// Create automatic portals in other dimensions when player right-click ritual stone

#modloaded bloodmagic
#reloadable
#norun

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

static scheme as string[][] = [[
  '             ',
  '             ',
  '∏ □ □ □ □ □ ∏',
  '             ',
  '             ',
], [
  '             ',
  '             ',
  '□ ◙ ◙ ◙ ◙ ◙ □',
  '             ',
  '             ',
], [
  '             ',
  '             ',
  '□ ◙       ◙ □',
  '             ',
  '             ',
], [
  '             ',
  '             ',
  '□ ◙       ◙ □',
  '             ',
  '             ',
], [
  '             ',
  '             ',
  '□ ◙       ◙ □',
  '             ',
  '             ',
], [
  '▬ ▬ ▬ ▬ ▬ ▬ ▬',
  '▬ ▬ ▬ ▒ ▬ ▬ ▬',
  '▬ ◙ ◙ ◘ ◙ ◙ □',
  '▬ ▬ ▬ ▒ ▬ ▬ ▬',
  '▬ ▬ ▬ ▬ ▬ ▬ ▬',
]] as string[][];

static map as IItemStack[string] = {
  '∏': <thaumcraft:banner_crimson_cult>,
  '□': <thaumcraft:stone_ancient_glyphed>,
  '◙': <bloodmagic:ritual_stone>,
  '▬': <bloodmagic:decorative_brick:2>,
  '◘': <bloodmagic:ritual_controller>,
  '▒': <thaumadditions:mithminite_block>,
} as IItemStack[string];

events.onPlayerInteractBlock(function (e as crafttweaker.event.PlayerInteractBlockEvent) {
  server.commandManager.executeCommandSilent(server, '/say §8Enter onPlayerInteractBlock');
  if (isNull(e.world) || e.world.remote || isNull(e.player)/*  || e.player.isFake() */) return;
  if (isNull(e.item) || e.item.definition.id != 'bloodmagic:activation_crystal') return;
  server.commandManager.executeCommandSilent(server, '/say §8  Crystal found');

  // Check clicked block to be ritual stone
  val state = e.world.getBlockState(e.position);
  if (isNull(state)) return;
  val block = state.block;
  if(block.definition.id != 'bloodmagic:ritual_controller') return;
  server.commandManager.executeCommandSilent(server, '/say §8  Ritual block found');

  // Check if portal valid (simplified)
  if(!detectPortal(e.world, e.position)) return;
  server.commandManager.executeCommandSilent(server, '/say §8  Portal valid');

  // Get point on other planet
  val stella = IWorld.getFromID(114);
  if (isNull(stella)) return;
  server.commandManager.executeCommandSilent(server, '/say §8  Planet found');

  val median = getMedianHeight(stella, scheme[0].length, scheme[0][0].length());
  server.commandManager.executeCommandSilent(server, '/say §8  Median: '~median);
});

// Check if clicked portal ritual stone is valid (simplified)
function detectPortal(w as IWorld, pos as IBlockPos) as bool {
  return isPortalBlock(w, pos.north()) && isPortalBlock(w, pos.south())
      || isPortalBlock(w, pos.east()) && isPortalBlock(w, pos.west());
}

// Check if block on this pos is valid portal block
function isPortalBlock(w as IWorld, pos as IBlockPos) as bool {
  return w.getBlockState(pos).block.definition.id == 'thaumadditions:mithminite_block';
}

function getMedianHeight(w as IWorld, width as int, deph as int) as int {
  // w.setBlockState(<blockstate:minecraft:air>, IBlockPos.create(0, 255, 0));
  // w.spawnEntity(<minecraft:dirt>.createEntityItem(w, 0, 255, 0));
  val arr = intArrayOf(width * deph);
  var k = 0;
  for z in 0 .. deph {
    for x in 0 .. width {
      for y in 0 .. 255 {
        if (w.isAirBlock(IBlockPos.create(x, 255 - y, z))) continue;
        arr[k] = y;
        break;
      }
      k += 1;
    }
  }
  mods.ctintegration.util.ArrayUtil.sort(arr);
  return arr.length % 2 == 0
    ? (arr[arr.length / 2] + arr[arr.length / 2 + 1]) / 2
    : arr[arr.length / 2];
}
