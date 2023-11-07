#modloaded twilightforest twilighttweaks

import crafttweaker.item.IItemStack;

val blacklist = [
  <twilightforest:castle_brick>,
  <twilightforest:castle_door:3>,
  <conarm:armor_trim>,
  <thaumicwonders:alchemist_stone>,
  <thaumicwonders:transmuter_stone>,
  <thaumicwonders:alienist_stone>,
  <mekanism:energycube>,
  <mekanism:basicblock>,
  <mekanism:machineblock2>,
  <mekanism:gastank>,
  <forge:bucketfilled>,
  <ftbquests:lootcrate>,
] as IItemStack[];

for item in blacklist {
  mods.twilighttweaks.uncrafting.banUncraft(item);
}

// Additional replaces
mods.twilighttweaks.uncrafting.addRecipe(true, 2, [
  [<enderio:block_dark_iron_bars>, <minecraft:clay>, <minecraft:string>],
  [<minecraft:string>, <minecraft:string>, <minecraft:string>],
], <enderio:item_dark_steel_upgrade>);
