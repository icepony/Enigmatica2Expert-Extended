/*

@file Additional features for Blood Magic meteors
- Producing trace of smoke particles when meteor flying
- Constantly spawn new meteors on some planets

*/

#modloaded bloodmagic
#reloadable

import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;

// Make smoke trail after the falling meteor
<entity:bloodmagic:meteor>.onTick(function (entity as IEntity) as void {
  if (entity.world.remote) return;
  // val throwable as IEntityThrowable = entity;

  utils.spawnParticles(entity,
    'largesmoke',
    entity.posX,
    entity.posY,
    entity.posZ,
    entity.motionX + 0.5,
    entity.motionY + 0.5,
    entity.motionZ + 0.5,
    0.1, 50);
}, 1);

static meteorCatalystForDimension as IItemStack[int] = {
  122: <minecraft:iron_block>,
  123: <jaopca:block_blockdilithium>,
};

zenClass Values {
  zenConstructor() {}
  val spawnTimeout as int[int] = {
    122: 10,
    123: 10,
  } as int[int];
}

static values as Values = Values();

// Allow only 1 meteor per tick summoned
events.onWorldTick(function (e as crafttweaker.event.WorldTickEvent) {
  if (
    e.world.remote
    || e.phase != 'END'
    || (e.world.dimension != 122 && e.world.dimension != 123)
  ) return;
  values.spawnTimeout[e.world.dimension] = values.spawnTimeout[e.world.dimension] - 1;
});

// A hack to tick chunks
events.onBlockNeighborNotify(function (e as crafttweaker.event.BlockNeighborNotifyEvent) {
  if (
    e.world.remote
    || (e.world.dimension != 122 && e.world.dimension != 123)
    || values.spawnTimeout[e.world.dimension] > 0
  ) return;

  val meteorCatalyst = meteorCatalystForDimension[e.world.dimension];
  if (isNull(meteorCatalyst)) return;

  val spread = 32;
  val rndPos = IBlockPos.create(
    e.x + e.world.random.nextInt(-spread, spread),
    255,
    e.z + e.world.random.nextInt(-spread, spread)
  );

  // Skip if random pos out of loaded chunks. Also prevent to spawn meteor on chunks boundaries
  if (
    !e.world.isBlockLoaded(rndPos)
    || !e.world.isBlockLoaded(rndPos.east(16))
    || !e.world.isBlockLoaded(rndPos.west(16))
    || !e.world.isBlockLoaded(rndPos.north(16))
    || !e.world.isBlockLoaded(rndPos.south(16))
  ) return;

  val data = e.world.getCustomChunkData(rndPos);
  val nextMeteorTime = (isNull(data) || isNull(data.nextMeteorTime))
    ? 0 as long
    : data.nextMeteorTime as long;

  // This chunk already spawned meteor recently
  if (e.world.time < nextMeteorTime) return;

  spawnMeteor(e.world, rndPos, meteorCatalyst);
  e.world.updateCustomChunkData({ nextMeteorTime: e.world.time + 6000 }, rndPos);

  // server.commandManager.executeCommandSilent(server, '/say §8spawned:['~rndPos.x~':'~rndPos.y~':'~rndPos.z~']timeout:'~values.spawnTimeout[e.world.dimension]~'nextMeteorTime:'~nextMeteorTime);

  // Forbid to spawn new meteors this tick
  values.spawnTimeout[e.world.dimension] = 20;
});

function spawnMeteor(world as IWorld, pos as IBlockPos, stack as IItemStack) as void {
  val meteor = <entity:bloodmagic:meteor>.spawnEntity(world, pos);
  val size = world.random.nextDouble(0.1, 0.5);
  val newData = stack.asData() + {
    noItem                 : null,
    radiusModifier         : size,
    explosionModifier      : size + 1.0,
    fillerChance           : 0.0,
    projectileMaxTicksInAir: 150,
    Motion                 : [
      world.random.nextDouble(-0.2, 0.2),
      world.random.nextDouble(-0.5, -1.5),
      world.random.nextDouble(0.25, 1),
    ],
  } as IData;
  meteor.updateNBT(newData);
}
