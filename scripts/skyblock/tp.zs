#modloaded zenutils ctintegration patchouli
#priority -10
#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

static SKY_TP_HEIGHT as double = 257.0;
static requiredItem as IItemStack = <patchouli:guide_book>.withTag({ 'patchouli:book': 'patchouli:e2e_e' });
static playersNoted as bool[IPlayer] = {};

events.onPlayerTick(function (e as crafttweaker.event.PlayerTickEvent) {
  if (
    e.player.world.remote
    || e.player.world.getWorldTime() % 2 != 0
    || e.player.getDimension() != 0
    || e.player.posY < SKY_TP_HEIGHT
  ) return;

  // Show warning message if player doesnt hold book but only once per server restart
  if (isNull(e.player.currentItem) || !(requiredItem has e.player.currentItem)) {
    if (isNull(playersNoted[e.player])) {
      playersNoted[e.player] = true;
      e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromData([{
        translate: 'e2ee.skyblock.need_item',
        with     : [
          scripts.lib.tellraw.itemObj(requiredItem, 'gold'),
          SKY_TP_HEIGHT as int,
        ] }]));
    }
    return;
  }

  e.player.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(600, 0));
  server.commandManager.executeCommandSilent(server,
    '/tpx ' ~ e.player.name ~ ' ' ~ e.player.posX ~ ' ' ~ (SKY_TP_HEIGHT - 255.0) ~ ' ' ~ e.player.posZ ~ ' 3'
  );

  // Show message about staying in skyblock forever
  e.player.world.catenation().sleep(60).run(function (world, context) {
    if(isNull(e.player)) return;
    e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation('e2ee.skyblock.stay_forever'));
  }).start();
});

events.onCommand(function(e as crafttweaker.event.CommandEvent) {
  if(isNull(e.command)
    || (e.command.name != "island")
    || (e.parameters.length == 0)
    || (e.parameters[0] != "create")
    || !(e.commandSender instanceof IPlayer)) {
    return;
  }

  val player as IPlayer = e.commandSender;
  if (player.hasGameStage('skyblock') || player.getDimension() != 3) return;

  scripts.skyblock.addGameStage.grant(player);
  player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation('e2ee.skyblock.now_skyblocker'));
});
