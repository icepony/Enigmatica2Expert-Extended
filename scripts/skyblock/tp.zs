#modloaded zenutils ctintegration patchouli
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
    || isNull(e.player.currentItem)
    || e.player.getDimension() != 0
    || e.player.posY < SKY_TP_HEIGHT
  ) return;

  print('~~~ entering onPlayerTick');
  // Show warning message if player doesnt hold book but only once per server restart
  if (!(requiredItem has e.player.currentItem)) {
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

  print('~~~ executing tp');
  e.player.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(600, 0));
  e.player.changeDimension(3);
  e.player.posY = SKY_TP_HEIGHT - 255.0;
});
