#modloaded randomthings
#reloadable

// Temporary give player creative mode to evade stall bug
// https://github.com/ACGaming/UniversalTweaks/issues/460
events.register(function (e as crafttweaker.event.PlayerChangedDimensionEvent) {
  if (
    e.to != -343800852
    || e.player.creative
    || e.player.spectator
    || e.player.adventure
    || isNull(e.player)
    || isNull(e.player.world)
    || e.player.world.remote) return;

  // Give player creative mode and take it back in one tick
  utils.executeCommandSilent(server, `/gamemode 1 ${e.player.name}`);

  e.player.world.catenation().sleep(1).then(function (world, ctx) {
    utils.executeCommandSilent(server, `/gamemode 0 ${e.player.name}`);
  }).start();
});
