#modloaded environmentalmaterials

// Make all blocks uncraftable since mod is going to be removed
for item in loadedMods['environmentalmaterials'].items {
  Purge(item);
}
/*
mods.chisel.Carving.addVariation('basalt', <environmentalmaterials:basalt>);
mods.chisel.Carving.addVariation('basalt', <environmentalmaterials:basalt_paver>);
mods.chisel.Carving.addVariation('basalt', <environmentalmaterials:basalt_bricks>);
mods.chisel.Carving.addVariation('basalt', <environmentalmaterials:basalt_tiles>);

// Environmental Materials
for i in 0 .. 16 {
  mods.chisel.Carving.addVariation('alabaster ' ~ i, <environmentalmaterials:alabaster>.definition.makeStack(i));
  mods.chisel.Carving.addVariation('alabaster ' ~ i, <environmentalmaterials:alabaster_paver>.definition.makeStack(i));
  mods.chisel.Carving.addVariation('alabaster ' ~ i, <environmentalmaterials:alabaster_bricks>.definition.makeStack(i));
  mods.chisel.Carving.addVariation('alabaster ' ~ i, <environmentalmaterials:alabaster_tiles>.definition.makeStack(i));
}

mods.chisel.Carving.addVariation('hardened_stone', <environmentalmaterials:hardened_stone>);
mods.chisel.Carving.addVariation('hardened_stone', <environmentalmaterials:hardened_stone_paver>);
mods.chisel.Carving.addVariation('hardened_stone', <environmentalmaterials:hardened_stone_bricks>);
mods.chisel.Carving.addVariation('hardened_stone', <environmentalmaterials:hardened_stone_tiles>);

mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <minecraft:dye:15> * 5]);
mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <biomesoplenty:white_dye> * 5]);
mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <thermalfoundation:dye:15> * 5]);
mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <botania:dye> * 5]);
mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <industrialforegoing:artificial_dye> * 5]);
mods.cyclicmagic.Packager.addRecipe(<environmentalmaterials:alabaster> * 16, [<minecraft:cobblestone> * 4, <quark:root_dye:2> * 5]);

// Light Gray Alabaster
recipes.addShaped('Light Gray Alabaster',
  <environmentalmaterials:alabaster:8> * 8,
  [[<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>],
    [<ore:emcraftingAlabasterNormal>, <ore:dyeLightGray>, <ore:emcraftingAlabasterNormal>],
    [<ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>, <ore:emcraftingAlabasterNormal>]]);

// Remake alabaster from cobblestone instead of stone
// Because alabaster is yet another building colored stone and should be a bit less pricy
recipes.removeByRecipeName('environmentalmaterials:m_alabaster/normal/alabaster_c_white_temp');
craft.make(<environmentalmaterials:alabaster> * 20, ['pretty',
  '░ d ░',
  'd ░ d',
  '░ d ░'], {
  '░': <ore:cobblestone>, // Cobblestone
  'd': <ore:dyeWhite>,
});
 */