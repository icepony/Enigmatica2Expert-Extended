#modloaded rftools

import crafttweaker.item.IIngredient;

// Mooshroom Syringe
recipes.addShapeless('Mooshroom Syringe',
  <rftools:syringe>.withTag({ mobName: 'Mooshroom', level: 10, mobId: 'minecraft:mooshroom' }),
  [<rftools:syringe>,<excompressum:bait:2>,<minecraft:hay_block>,<ore:listAllmushroom>]);

// Modular Storage
recipes.remove(<rftools:modular_storage>);
recipes.addShaped('Modular Storage 1', <rftools:modular_storage>,
  [[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
    [<ore:gemQuartz>, <immersiveengineering:wooden_device0:5>, <ore:gemQuartz>],
    [<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);

recipes.addShaped('Modular Storage 2', <rftools:modular_storage>,
  [[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
    [<ore:gemQuartz>, <forestry:sturdy_machine>, <ore:gemQuartz>],
    [<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);

recipes.addShaped('Modular Storage 3', <rftools:modular_storage>,
  [[<ore:dustRedstone>, <ore:chest>, <ore:dustRedstone>],
    [<ore:gemQuartz>, <ic2:resource:12>, <ore:gemQuartz>],
    [<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>]]);

// Storage Scanner
recipes.remove(<rftools:storage_scanner>);
recipes.addShaped('Storage Scanner 1', <rftools:storage_scanner>,
  [[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
    [<ore:ingotGold>, <mekanism:basicblock:8>, <ore:ingotGold>],
    [<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);

recipes.addShaped('Storage Scanner 2', <rftools:storage_scanner>,
  [[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
    [<ore:ingotGold>, <actuallyadditions:block_misc:9>, <ore:ingotGold>],
    [<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);

recipes.addShaped('Storage Scanner 3', <rftools:storage_scanner>,
  [[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
    [<ore:ingotGold>, <teslacorelib:machine_case>, <ore:ingotGold>],
    [<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);

recipes.addShaped('Storage Scanner 4', <rftools:storage_scanner>,
  [[<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>],
    [<ore:ingotGold>, <nuclearcraft:part:10>, <ore:ingotGold>],
    [<minecraft:redstone_torch>, <ore:enderpearl>, <minecraft:redstone_torch>]]);

// Matter Transmitter
recipes.remove(<rftools:matter_transmitter>);
recipes.addShaped('RFTools Matter Transmitter',
  <rftools:matter_transmitter>,
  [[<ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>],
    [<mekanism:teleportationcore>, <ic2:te:39>, <mekanism:teleportationcore>],
    [<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>]]);

// Matter Receiver
recipes.remove(<rftools:matter_receiver>);
recipes.addShaped('RFTools Matter Receiver',
  <rftools:matter_receiver>,
  [[<appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>, <appliedenergistics2:smooth_sky_stone_block>],
    [<mekanism:teleportationcore>, <ic2:te:39>, <mekanism:teleportationcore>],
    [<ore:enderpearl>, <ore:enderpearl>, <ore:enderpearl>]]);

// Machine Frame
recipes.remove(<rftools:machine_frame>);
recipes.addShaped('RFTools Machine Frame',
  <rftools:machine_frame> * 2,
  [[<ic2:heat_vent>, <ore:gearGold>, <ic2:heat_vent>],
    [<industrialforegoing:dryrubber>, <teslacorelib:machine_case>, <industrialforegoing:dryrubber>],
    [<industrialforegoing:pink_slime>, <tconevo:edible:1>, <industrialforegoing:pink_slime>]]);

// Machine Base
recipes.remove(<rftools:machine_base>);
recipes.addShapedMirrored('Machine Base',
  <rftools:machine_base>, [
    [<ore:plateCopper>, <ore:plateCopper>, <ore:plateCopper>],
    [<ore:stone>, <ore:stone>, <ore:stone>]]);

// Quarry Card
recipes.remove(<rftools:shape_card:2>);
recipes.addShapedMirrored('Quarry Card',
  <rftools:shape_card:2>,
  [[<rftools:machine_frame>, <tconstruct:hammer_head>.withTag({ Material: 'osgloglas' }), <rftools:machine_frame>],
    [<tconstruct:hammer_head>.withTag({ Material: 'manyullyn' }), <thermalexpansion:frame:146>, <tconstruct:hammer_head>.withTag({ Material: 'enderium' })],
    [<rftools:machine_frame>, <rftools:shape_card>, <rftools:machine_frame>]]);

recipes.addShaped('Quarry Card Clearing to Normal',
  <rftools:shape_card:2>,
  [[<ore:dirt>, <ore:dirt>, <ore:dirt>],
    [<ore:dirt>, <rftools:shape_card:5>, <ore:dirt>],
    [<ore:dirt>, <ore:dirt>, <ore:dirt>]]);

// [Crafter Tier 1] from [Machine Block][+2]
craft.remake(<rftools:crafter1>, ['pretty',
  '  U  ',
  '♥ ■ ♥'], {
  '■': scripts.mods.extrautilities2.machineBlock,
  '♥': <ore:gearRedstone>,    // Redstone Gear
  'U': <ore:xuUpgradeSpeed>,  // Upgrade Speed
});

// [Crafter Tier 2] from [Crafter Tier 1][+2]
craft.remake(<rftools:crafter2>, ['pretty',
  '  U  ',
  '♥ C ♥'], {
  'C': <rftools:crafter1>,            // Crafter Tier 1
  '♥': <ore:gearRedstone>,            // Redstone Gear
  'U': <extrautils2:ingredients:15>,  // Upgrade Speed (Magical)
});

// [Crafter Tier 3] from [Crafter Tier 2][+2]
craft.remake(<rftools:crafter3>, ['pretty',
  '  U  ',
  '♥ C ♥'], {
  'C': <rftools:crafter2>,            // Crafter Tier 2
  '♥': <ore:gearRedstone>,            // Redstone Gear
  'U': <extrautils2:ingredients:16>,  // Upgrade Speed (Ultimate)
});

// Storage Modules
recipes.removeByRecipeName('rftools:storage_module_0');
recipes.addShaped('rftools_storage_module_0', <rftools:storage_module>, [
  [<storagedrawers:upgrade_storage:0>, null, <storagedrawers:upgrade_storage:0>],
  [<ore:oc:materialCircuitBoardPrinted>, <ore:chest>, <ore:oc:materialCircuitBoardPrinted>],
  [<storagedrawers:upgrade_storage:0>, null, <storagedrawers:upgrade_storage:0>]]);

recipes.removeByRecipeName('rftools:storage_module_1');
recipes.addShaped('rftools_storage_module_1', <rftools:storage_module:1>, [
  [<storagedrawers:upgrade_storage:0>, null, <storagedrawers:upgrade_storage:0>],
  [<ore:circuitAdvanced>, <rftools:storage_module>.marked('module'), <ore:circuitAdvanced>],
  [<storagedrawers:upgrade_storage:0>, null, <storagedrawers:upgrade_storage:0>],
], function (out, ins, cInfo) {
  if (ins has 'module' && !isNull(ins.module) && ins.module.hasTag) {
    return out.withTag(ins.module.tag);
  }
  return out;
}, null);

recipes.removeByRecipeName('rftools:storage_module_2');
recipes.addShaped('rftools_storage_module_2', <rftools:storage_module:2>, [
  [<storagedrawers:upgrade_storage:1>, null, <storagedrawers:upgrade_storage:1>],
  [<ore:circuitBoard>, <rftools:storage_module:1>.marked('module'), <ore:circuitBoard>],
  [<storagedrawers:upgrade_storage:1>, null, <storagedrawers:upgrade_storage:1>],
], function (out, ins, cInfo) {
  if (ins has 'module' && !isNull(ins.module) && ins.module.hasTag) {
    return out.withTag(ins.module.tag);
  }
  return out;
}, null);

// Harder card recipe
recipes.removeByRecipeName('rftools:powercell_card');
recipes.addShaped(<rftools:powercell_card> * 4, [
  [<ore:dustEndstone>, <computercraft:printout>, <ore:dustEndstone>],
  [<computercraft:printout>, <rats:charged_creeper_chunk>, <computercraft:printout>],
  [<ore:dustEndstone>, <computercraft:printout>, <ore:dustEndstone>]]);

// ------------------------------------------------
// Power Cells

val powercellsIngrs = {
  '■': <ore:blockDimensional>,       // Dimensional Blank Block
  'P': <rftools:powercell>,          // Powercell
  '▲': <ore:dustDimensional>,        // Dimensional Blend
  'S': <cyclicmagic:soulstone>,      // Soulstone
  '◙': <rftools:machine_frame>,      // Machine Frame
  'I': <rftools:infused_diamond>,    // Infused Diamond
  'i': <rftools:powercell_simple>,   // Simple Powercell
  'ͼ': <integrateddynamics:logic_director>,
} as IIngredient[string];

recipes.remove(<rftools:powercell_simple>);
recipes.remove(<rftools:powercell>);
recipes.remove(<rftools:powercell_advanced>);

// [Simple Powercell*2] from [Soulstone][+3]
craft.make(<rftools:powercell_simple> * 2, ['pretty',
  '▲ ͼ ▲',
  '◙ S ◙',
  '▲ ͼ ▲'], powercellsIngrs
);

// [Powercell] from [Simple Powercell][+2]
craft.make(<rftools:powercell>, ['pretty',
  '▲ I ▲',
  '▲ i ▲'], powercellsIngrs
);

// [Powercell*2] from [Soulstone][+4]
craft.make(<rftools:powercell> * 2, ['pretty',
  '▲ I ▲',
  '◙ S ◙',
  'ͼ I ͼ'], powercellsIngrs
);

// [Advanced Powercell] from [Powercell][+2]
craft.make(<rftools:powercell_advanced>, ['pretty',
  '▲ ■ ▲',
  '▲ P ▲'], powercellsIngrs
);

// [Advanced Powercell*2] from [Soulstone][+4]
craft.make(<rftools:powercell_advanced> * 2, ['pretty',
  'I ■ I',
  '◙ S ◙',
  'ͼ ■ ͼ'], powercellsIngrs
);

// Matter beamer
remake('rftools matter_beamer', <rftools:matter_beamer>, [
  [<rats:charged_creeper_chunk>, <ore:glowstone>, <rats:charged_creeper_chunk>],
  [<ore:glowstone>, <rftools:machine_frame>, <ore:glowstone>],
  [<rats:charged_creeper_chunk>, <ore:glowstone>, <rats:charged_creeper_chunk>]]);

// Remove Dimensional block, so it could be only obtainable in Dimensions
recipes.remove(<rftoolsdim:dimensional_blank_block>);

// [Syringe] from [Tank][+2]
recipes.removeShaped(<rftools:syringe>);
craft.make(<rftools:syringe>, ['pretty',
  '‚    ',
  '  T  ',
  '    □'], {
  '□': <ore:plateAdvancedAlloy>, // Advanced Alloy
  'T': <enderio:block_omni_reservoir>, // Tank
  '‚': <ore:nuggetSteel>, // Steel Nugget
});

// [Charged Porter] from [Crystal Memory][+3]
craft.remake(<rftools:charged_porter>, ['pretty',
  '  ╳  ',
  '▬ * ▬',
  '  □  '], {
  '□': <ore:plateAdvancedAlloy>, // Advanced Alloy
  '╳': <ore:lapotronCrystal>, // Lapotron Crystal
  '*': <ic2:crystal_memory>, // Crystal Memory
  '▬': <extendedcrafting:material:36>,   // Ender Ingot
});

// [Advanced Charged Porter] from [Charged Porter][+2]
craft.remake(<rftools:advanced_charged_porter>, ['pretty',
  '▬ ‚ ▬',
  '‚ C ‚',
  '▬ ‚ ▬'], {
  'C': <rftools:charged_porter>,       // Charged Porter
  '‚': <extendedcrafting:material:49>, // Enhanced Ender Nugget
  '▬': <extendedcrafting:material:36>, // Ender Ingot
});

// [Screen Controller] from [Machine Base][+4]
craft.remake(<rftools:screen_controller>, ['pretty',
  'I * I',
  '□ M □',
  'I п I'], {
  '□': <ore:plateSilicon>,            // Silicon Plate
  'I': <ore:itemInsulatedGlassCable>, // Glass Fibre Cable
  '*': <ore:lapotronCrystal>, // Lapotron Crystal
  'M': <rftools:machine_base>,        // Machine Base
  'п': <ore:plateAdvancedAlloy>, // Advanced Alloy
});

// [Booster] from [Machine Base][+4]
craft.remake(<rftools:booster>, ['pretty',
  'I ▬ I',
  '□ M □',
  'I ~ I'], {
  '□': <ore:plateSilicon>,            // Silicon Plate
  'I': <ore:itemInsulatedGlassCable>, // Glass Fibre Cable
  '▬': <ore:ingotPinkMetal>,          // Pink Slime Ingot
  'M': <rftools:machine_base>,        // Machine Base
  '~': LiquidIngr('ic2hot_water') | LiquidIngr('hot_spring_water'), // Hotspring Water Bucket
});

// [Elevator] from [Machine Base][+4]
craft.remake(<rftools:elevator>, ['pretty',
  'I R I',
  '□ M □',
  'I T I'], {
  '□': <ore:plateSilicon>,            // Silicon Plate
  'R': <ore:itemRubber>,              // Plastic
  'T': <ic2:upgrade:1>,               // Transformer Upgrade
  'I': <ore:itemInsulatedGlassCable>, // Glass Fibre Cable
  'M': <rftools:machine_base>,        // Machine Base
});

// [Storage Control Screen Module] from [Infused Diamond][+1]
recipes.removeByRecipeName('rftools:storage_control_module');
craft.make(<rftools:storage_control_module>, ['pretty',
  '  A  ',
  'A I A',
  '  A  '], {
  'A': <xnet:antenna_dish>,       // Antenna Dish
  'I': <rftools:infused_diamond>, // Infused Diamond
});

// [Liquid Monitor] from [Machine Base][+2]
craft.remake(<rftools:liquid_monitor>, ['pretty',
  '  l  ',
  'F M F',
  '  l  '], {
  'l': <fluxnetworks:flux>,    // Flux
  'F': <flopper:flopper>,      // Flopper
  'M': <rftools:machine_base>, // Machine Base
});

// Remakes with infusions

// [Infused Diamond] from [Dimensional Shard][+1]
recipes.remove(<rftools:infused_diamond>);
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <ore:gemDiamondRat>, <rftools:infused_diamond>);

// [Infused Enderpearl] from [Dimensional Shard][+1]
recipes.remove(<rftools:infused_enderpearl>);
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <endreborn:item_advanced_ender_pearl>, <rftools:infused_enderpearl>);

// [CPU Core EX2000] from [Dimensional Shard][+1]
recipes.remove(<rftoolscontrol:cpu_core_2000>);
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <rftoolscontrol:cpu_core_1000>, <rftoolscontrol:cpu_core_2000>);

// [Dimlet Template] from [Dimensional Shard][+1]
recipes.remove(<rftoolsdim:dimlet_template>);
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <ore:paper>, <rftoolsdim:dimlet_template>);

// [Activity Probe] from [Dimensional Shard][+1]
recipes.remove(<rftoolsdim:activity_probe>);
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <rftools:machine_frame>, <rftoolsdim:activity_probe>);

// [Dimension Monitor] from [Redstone Comparator]
recipes.removeByRecipeName('rftoolsdim:dimension_monitor');
mods.mekanism.infuser.addRecipe('DIMENSIONAL', 160, <minecraft:comparator>, <rftoolsdim:dimension_monitor>);

// [CPU Core B500] from [Redstone][+1]
recipes.remove(<rftoolscontrol:cpu_core_500>);
mods.mekanism.infuser.addRecipe('REDSTONE', 160, <rftoolscontrol:card_base>, <rftoolscontrol:cpu_core_500>);

// [CPU Core S1000] from [Rat Diamond][+1]
recipes.remove(<rftoolscontrol:cpu_core_1000>);
mods.mekanism.infuser.addRecipe('DIAMOND', 160, <rftoolscontrol:cpu_core_500>, <rftoolscontrol:cpu_core_1000>);

// Non-dimensional source of "levarG"
val MA = <rftoolsdim:material_absorber>.withTag({meta: 0, absorbing: 0, block: "minecraft:stone"});
val FG = <rftoolsdim:fake_gravel>;
scripts.process.crush(MA, FG * 64, 'only: Macerator');
mods.ic2.ThermalCentrifuge.addRecipe([FG * 64, FG * 32], MA);
mods.astralsorcery.Grindstone.addRecipe(MA, FG * 64, 0.5);

// [Shape Card (Silk Quarry)] from [Shape Card (Quarry)][+3]
recipes.removeByRecipeName("rftools:shape_card_quarry_silk");
craft.make(<rftools:shape_card:3>, ['pretty',
  '◊ S ◊',
  '¤ h ¤',
  '◊ ¤ ◊'], {
  '◊': <ore:gemDimensionalShard>, // Dimensional Shard
  'S': <tconstruct:materials:16>, // Silky Jewel
  '¤': <ore:gearDiamond>,         // Diamond Gear
  'h': <rftools:shape_card:2>,    // Shape Card (Quarry)
});

// [Shape Card (Fortune Quarry)] from [Shape Card (Quarry)][+3]
recipes.removeByRecipeName("rftools:shape_card_quarry_fortune");
craft.make(<rftools:shape_card:4>, ['pretty',
  '◊ * ◊',
  '¤ S ¤',
  '◊ * ◊'], {
  '◊': <ore:gemDimensionalShard>, // Dimensional Shard
  '*': <ore:lapotronCrystal>,     // Lapotron Crystal
  '¤': <ore:gearDiamond>,         // Diamond Gear
  'S': <rftools:shape_card:2>,    // Shape Card (Quarry)
});

// [Endergenic Generator] from [Machine Frame][+2]
craft.remake(<rftools:endergenic>, ['pretty',
  'F F F',
  'F ◙ F',
  'F ¤ F'], {
  'F': <randomthings:ingredient:7>, // Floo Powder
  '◙': <rftools:machine_frame>,     // Machine Frame
  '¤': <ore:gearDiamond>,           // Diamond Gear
});

// [Machine Infuser] from [Machine Frame][+3]
craft.remake(<rftools:machine_infuser>, ['pretty',
  '◊ * ◊',
  '¤ ◙ ¤',
  '◊ * ◊'], {
  '◊': <ore:gemDimensionalShard>, // Dimensional Shard
  '*': <ore:gemCrystalFlux>,      // Flux Crystal
  '¤': <ore:gearDiamond>,         // Diamond Gear
  '◙': <rftools:machine_frame>,   // Machine Frame
});
