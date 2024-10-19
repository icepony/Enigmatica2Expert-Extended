#modloaded bloodmagic
#reloadable
#sideonly client

import crafttweaker.entity.IEntity;

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
