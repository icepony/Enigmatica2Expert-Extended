import crafttweaker.item.IIngredient;

#modloaded littletiles

scripts.lib.tooltip.desc.jei(<littletiles:recipeadvanced>, 'dont_put_into_ae');

# Storage tiles
recipes.remove(<littletiles:ltstorageblocktile>);
recipes.addShaped(<littletiles:ltstorageblocktile>, [
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>], 
	[<chisel:factory:6>, <ore:chest>, <chisel:factory:6>], 
	[<chisel:factory:6>, <chisel:factory:6>, <chisel:factory:6>]]);

# Tools
val ingrs = {
  "#": <randomthings:spectreplank>,       # Spectre Planks
  "`": <ore:nuggetPlatinum>,
  "╱": <ore:stickIron>,                   # Iron Rod
  "P": <computercraft:printout>,          # Printed Page
  "w": <ore:blockRockwool>,
  "M": <appliedenergistics2:material:39>, # ME Storage Housing
} as IIngredient[string];

craft.remake(<littletiles:hammer>,             [" ` ", " #`", "#  "], ingrs);
craft.remake(<littletiles:recipeadvanced> * 4, ["P P", " M ", "P P"], ingrs);
craft.remake(<littletiles:saw>,                ["  #", " #╱", "#╱ "], ingrs);
craft.remake(<littletiles:container>,          [" ` ", "w w", " w "], ingrs);
craft.remake(<littletiles:wrench>,             ["  `", " # ", "w  "], ingrs);
craft.remake(<littletiles:chisel>,             ["  `", " # ", "#  "], ingrs);
craft.remake(<littletiles:colortube>,          [" w ", " #w", "#  "], ingrs);
craft.remake(<littletiles:grabber>,            [" w ", "wOw", " # "], ingrs);

# Melt Water blocks
scripts.process.melt(<littletiles:lttransparentcoloredblock:5>, <liquid:water> * 1000);

// Add missed Dyable blocks recipes
val unique = scripts.lib.unique.Unique([
  <ore:dyeLightGray>,
  <rustic:clay_wall>,
  <rustic:clay_wall>,
]);

val hasRecipes = [12, 14] as int[];
for i in 0 .. 15 {
  if (hasRecipes has i) continue;
  recipes.addShaped("dyable block #"~i, <littletiles:ltcoloredblock>.definition.makeStack(i) * 4, unique.next());
}

for i in 0 .. 5 {
  recipes.addShaped("dyable block #"~(i+14), <littletiles:ltcoloredblock2>.definition.makeStack(i) * 4, unique.next());
}

// Add hint about converting blocks
val curium_stalactite = <littletiles:multitiles>.withTag({tiles: [{boxes: [[3, 0, 2, 5, 8, 4, -2146434816, 131074] as int[], [5, 2, 3, 7, 8, 5, -2147483072, -65538] as int[], [4, 2, 4, 5, 8, 8, -2139092992, -196612] as int[], [1, 6, 4, 4, 8, 6, -2142763904, -1, 131074] as int[], [3, 0, 4, 4, 6, 5, -2139092992, -1] as int[], [3, 5, 5, 4, 6, 6, -2139229930, 196607, 196607, -131070, -2, 196606, 262143, -131069] as int[]], tile: {block: "nuclearcraft:fertile_isotope:4"}}, {boxes: [[2, 7, 6, 4, 8, 7] as int[], [2, 5, 3, 3, 8, 4] as int[], [5, 5, 2, 6, 8, 3] as int[], [2, 6, 2, 3, 8, 3] as int[], [5, 6, 5, 7, 8, 7] as int[], [5, 3, 5, 6, 6, 6] as int[]], tile: {block: "minecraft:stone"}}], min: [1, 0, 2] as int[], size: [6, 8, 6] as int[], grid: 8, count: 12, structure: {blocks: [] as int[], name: "Curium-246 Stalactite", id: "fixed"}});
scripts.jei.crafting_hints.addInsOutCatl(
  [curium_stalactite * 6],
  <nuclearcraft:fertile_isotope:4>,
  <littletiles:container>
);
