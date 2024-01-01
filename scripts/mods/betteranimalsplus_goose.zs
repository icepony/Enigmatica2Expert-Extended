#modloaded betteranimalsplus
#reloadable

import crafttweaker.entity.IEntityAnimal;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;

function clearPlayerInventory(player as IPlayer) as void {
  for i in 0 .. player.inventorySize {
    val item = player.getInventoryStack(i);
    if (isNull(item)) continue;
    player.replaceItemInInventory(i, null);
  }
}

// --------------------------------
// Geese use items
// --------------------------------
events.onWorldTick(function (e as crafttweaker.event.WorldTickEvent) {
  val world = e.world;
  if (world.remote || world.time % 10 != 0) return;
  
  for entity in world.getEntities() {
    if (!(entity instanceof IEntityAnimal) || !entity.alive) continue;
    val animal as IEntityAnimal = entity;
    if (!animal.canPickUpLoot) continue;
    if (animal.definition.id != 'betteranimalsplus:goose') continue;
    val base as IEntityLivingBase = animal;
    tickGoose(base);
  }
});

function tickGoose(entity as IEntityLivingBase) as void {
  val item = entity.getItemInSlot(crafttweaker.entity.IEntityEquipmentSlot.mainHand());

  // No item in Goose beak
  if (isNull(item)) return;

  // Test random
  if (entity.world.random.nextInt(5) != 0) return;

  val player = entity.world.getFakePlayer();
  player.setToLocationFrom(entity);
  // player.posY -= 0.5;

  // Clear previous fake player inventory
  clearPlayerInventory(player);

  val result = player.simulateRightClickItem(item, crafttweaker.entity.IEntityEquipmentSlot.mainHand());

  // Replace held item of Goose
  entity.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.mainHand(), result.item);

  // Drop all items in fake player inventory
  for i in 0 .. player.inventorySize {
    val item = player.getInventoryStack(i);
    if (isNull(item)) continue;
    player.replaceItemInInventory(i, null);
    player.dropItem(item);
  }

  // Copyposition if effect teleport
  entity.posX = player.posX;
  entity.posY = player.posY;// + 0.5;
  entity.posZ = player.posZ;
  player.onEntityUpdate();
}
