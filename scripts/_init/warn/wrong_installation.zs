#modloaded !netherendingores !mctsmelteryio
#reloadable

import crafttweaker.player.IPlayer;

static messageSended as bool[string] = {};

events.onPlayerLoggedIn(function (e as crafttweaker.event.PlayerLoggedInEvent) {
  if (e.player.world.remote) return;

  if(!isNull(messageSended[e.player.uuid])) return;

  e.player.world.catenation().sleep(20 * 20).then(function (world, ctx) {
    if(!isNull(messageSended[e.player.uuid])) return;
    e.player.sendRichTextMessage(crafttweaker.text.ITextComponent.fromTranslation('e2ee.warn.wrong_installation'));
    messageSended[e.player.uuid] = true;
  }).start();
});
