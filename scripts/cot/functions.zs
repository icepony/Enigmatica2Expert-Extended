#modloaded contenttweaker
#reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import crafttweaker.world.IFacing;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.World;

function abs(n as double) as double { return n < 0 ? -n : n; }

// ------------------------------------------
// Anglesite and Benitoite
// ------------------------------------------
<cotBlock:ore_anglesite>.dropHandler = function (drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<contenttweaker:anglesite>);
  for i in 0 .. fortune { drops.add(<contenttweaker:anglesite> % 50); }
};

<cotBlock:ore_benitoite>.dropHandler = function (drops, world, position, state, fortune) {
  drops.clear();
  drops.add(<contenttweaker:benitoite>);
  for i in 0 .. fortune { drops.add(<contenttweaker:benitoite> % 50); }
};
// ------------------------------------------
// Conglomerates
// ------------------------------------------
function getPlayer(world as IWorld, p as IBlockPos) as IPlayer {
  for pl in world.getAllPlayers() {
    if (abs(pl.x - p.x) > 60 || abs(pl.y - p.y) > 60 || abs(pl.z - p.z) > 60) continue;
    return pl;
  }
  return null;
}

function createParticles(world as IWorld, p as IBlockPos, amount as int = 10, type as string = 'heart') as void {
  if (world.remote) return;
  val player = getPlayer(world, p);
  if (isNull(player)) return;
  server.commandManager.executeCommandSilent(<minecraft:dirt>.createEntityItem(world, p.x, p.y, p.z),
    '/particle ' ~ type ~ ' '
    ~ ((p.x + 0.5)) ~ ' ' ~ (p.y + 0.5) ~ ' ' ~ ((p.z + 0.5))
    ~ ' 0.25 0.25 0.25 0.02 ' ~ amount
  );
}

val lifeRecipes = {
  'betteranimalsplus:goose': { <betteranimalsplus:golden_goose_egg>: 100 },
  'minecraft:ocelot'       : { <actuallyadditions:item_hairy_ball>: 4 },
} as int[IItemStack][string];

<cotBlock:conglomerate_of_life>.onBlockPlace = function (world, p, blockState) {
  if (!world.remote) scripts.do.build.entity.build(world, p, blockState);
  createParticles(world, p);
};
<cotBlock:conglomerate_of_life>.onBlockBreak = function (world, p, blockState) { createParticles(world, p); };
<cotBlock:conglomerate_of_life>.onRandomTick = function (world, p, blockState) {
  if (world.remote) return;
  for entity in world.getEntities() {
    if (isNull(entity.definition)) continue;
    val output = lifeRecipes[entity.definition.id];
    if (isNull(output)) continue;
    if (abs(entity.x - p.x) > 8 || abs(entity.y - p.y) > 8 || abs(entity.z - p.z) > 8) continue;

    for outItem, outChance in output {
      if (world.getRandom().nextInt(outChance) != 1) continue;
      val w as IWorld = world;
      val itemEntity = (outItem * 1).createEntityItem(w, entity.x as float, entity.y as float, entity.z as float);
      itemEntity.motionY = 0.4;
      world.spawnEntity(itemEntity);
      createParticles(world, p, 3);
    }
  }
};

<cotBlock:conglomerate_of_sun>.onBlockPlace = function (world, p, blockState) {
  if (!world.remote) scripts.do.build.entity.build(world, p, blockState);
  createParticles(world, p, 10, 'endRod');
};
<cotBlock:conglomerate_of_sun>.onBlockBreak = function (world, p, blockState) { createParticles(world, p, 10, 'endRod'); };
<cotBlock:conglomerate_of_sun>.onRandomTick = function (world, p, blockState) {
  if (world.remote) return;
  var hadEffect = false;
  for entity in world.getEntities() {
    if (isNull(entity.definition)) continue;
    if (!(entity instanceof crafttweaker.entity.IEntityAgeable)) continue;
    val ageable as crafttweaker.entity.IEntityAgeable = entity;

    // Already grown up
    if (ageable.growingAge >= 0) continue;

    // Speed up growth of ageble mobs
    ageable.addGrowth(300);
    hadEffect = true;
    createParticles(world, ageable.position, 10, 'endRod');
  }
  if (hadEffect) createParticles(world, p, 10, 'endRod');
};
// ------------------------------------------
// Coral
// ------------------------------------------
scripts.jei.crafting_hints.add1to1(<contenttweaker:compressed_coral>, <randomthings:biomestone>);

function canPlaceCoral(world as World, p as IBlockPos) as bool {
  val floorBlockId = world.getBlockState(p.down()).block.definition.id;
  return 
    (floorBlockId == 'minecraft:sand' || floorBlockId == 'minecraft:gravel' || floorBlockId == 'minecraft:dirt')
    && world.getBlockState(p).block.definition.id == 'minecraft:water'
    && world.getBlockState(p.up()).block.definition.id == 'minecraft:water'
  ;
}
<cotBlock:compressed_coral>.onRandomTick = function (world as World, p as BlockPos, blockState as BlockState) {
  if (world.remote) return;

  if(world.getBlockState(p.up()).block.definition.id != 'minecraft:water') {
    world.destroyBlock(p, false);
    world.setBlockState(<blockstate:randomthings:biomestone>, p);
    return;
  }
  
  for face in [east, north, west, south] as IFacing[] {
    if (world.getRandom().nextInt(2) != 0) continue;

    val coral = <blockstate:biomesoplenty:coral>;
    val newPos = p.getOffset(face, 1);
    if (canPlaceCoral(world, newPos)) {
      world.setBlockState(coral, newPos);
      utils.spawnParticles(world, 'droplet', 0.5 + p.x, 0.5 + p.y, 0.5 + p.z, 0.5, 0.5, 0.5, 0, 100);
    }
  }
};
// ------------------------------------------
