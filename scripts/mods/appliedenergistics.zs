#modloaded appliedenergistics2

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

val pearlFluix = <ore:pearlFluix>;
val crystalCertus = <ore:crystalCertus>;

// ------ Silicon unification ------
val trueSilicon = <appliedenergistics2:material:5>;
<ore:itemSilicon>.remove([<libvulpes:productingot:3>, <enderio:item_material:5>]);
<ore:ingotSilicon>.add(trueSilicon);

// Removing
mods.mekanism.crusher.removeRecipe(<nuclearcraft:gem:6>); // Sand -> silicon

// Addition
mods.thermalexpansion.Compactor.addMintRecipe(trueSilicon * 2, <minecraft:sand>, 4000);
// ---------------------------------

// Smart Cable -> Dense
recipes.addShapeless('4 Smart Cables to Dense',
  <appliedenergistics2:part:76>,
  [<appliedenergistics2:part:56>, <appliedenergistics2:part:56>, <appliedenergistics2:part:56>, <appliedenergistics2:part:56>, <ore:dustRedstone>, <ore:dustGlowstone>]);

// [Portable Cell] from [Energy Cell][+3]
craft.remake(<appliedenergistics2:portable_cell>, ['pretty',
  '  *  ',
  '∩ Ϟ ∩',
  '⌃   ⌃'], {
  '*': <ic2:energy_crystal>.withTag({ charge: 1000000.0 }), // Energy Crystal
  '∩': <rats:charged_creeper_chunk>, // Charged Creeper Chunk
  'Ϟ': <appliedenergistics2:energy_cell:*>, // Energy Cell
  '⌃': <appliedenergistics2:material:1>, // Charged Certus Quartz Crystal
});

// ---=== Storage Cell Helpers ===---
function newCellRecipe(input as IIngredient, output as IItemStack) {
  recipes.remove(output);
  recipes.addShaped(output,
    [[<appliedenergistics2:quartz_glass>, <ore:plateConcrete>, <appliedenergistics2:quartz_glass>],
      [<ore:plateConcrete>, input, <ore:plateConcrete>],
      [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
  if (!isNull(input)) {
    recipes.addShapeless(output, [<appliedenergistics2:material:39>, input]);
  }
}

newCellRecipe(null, <appliedenergistics2:material:39>);

// ---=== Basic Cells ===---
val cellRecipes = {
  // Standard Cells
  <appliedenergistics2:material:35>: <appliedenergistics2:storage_cell_1k>,
  <appliedenergistics2:material:36>: <appliedenergistics2:storage_cell_4k>,
  <appliedenergistics2:material:37>: <appliedenergistics2:storage_cell_16k>,
  <appliedenergistics2:material:38>: <appliedenergistics2:storage_cell_64k>,
  // Fluid Cells
  <appliedenergistics2:material:54>: <appliedenergistics2:fluid_storage_cell_1k>,
  <appliedenergistics2:material:55>: <appliedenergistics2:fluid_storage_cell_4k>,
  <appliedenergistics2:material:56>: <appliedenergistics2:fluid_storage_cell_16k>,
  <appliedenergistics2:material:57>: <appliedenergistics2:fluid_storage_cell_64k>,
  // Spatial Cells
  <appliedenergistics2:material:32>: <appliedenergistics2:spatial_storage_cell_2_cubed>,
  <appliedenergistics2:material:33>: <appliedenergistics2:spatial_storage_cell_16_cubed>,
  <appliedenergistics2:material:34>: <appliedenergistics2:spatial_storage_cell_128_cubed>,
  // View Cell
  <ore:crystalCertus>              : <appliedenergistics2:view_cell>,

} as IItemStack[IIngredient];

for input, output in cellRecipes {
  newCellRecipe(input, output);
}

// Quantum Link Chamber
recipes.remove(<appliedenergistics2:quantum_link>);
recipes.addShapedMirrored('Quantum Link Chamber',
  <appliedenergistics2:quantum_link>,
  [[<appliedenergistics2:quartz_vibrant_glass>, <rftools:infused_enderpearl>, <appliedenergistics2:quartz_vibrant_glass>],
    [pearlFluix, <mekanism:machineblock3>, pearlFluix],
    [<appliedenergistics2:quartz_vibrant_glass>, <ore:manaPearl>, <appliedenergistics2:quartz_vibrant_glass>]]);

// [ME Drive] from [Disk Drive][+3]
craft.remake(<appliedenergistics2:drive>, ['pretty',
  'A A A',
  'A : A',
  'E ◙ E'], {
  'A': <ore:plateTitaniumAluminide>,
  'E': <appliedenergistics2:material:24>, // Engineering Processor
  '◙': <rftools:machine_frame>, // Machine Frame
  ':': <ore:oc:diskDrive>, // Disk Drive
});

// Matter Condenser
recipes.remove(<appliedenergistics2:condenser>);
mods.extendedcrafting.CompressionCrafting.addRecipe(<appliedenergistics2:condenser>,
  <minecraft:piston>, 10000, <excompressum:double_compressed_diamond_hammer>, 1000000000, 1000000);

// [Molecular Assembler] from [Augment_ Pattern Validation][+4]
craft.remake(<appliedenergistics2:molecular_assembler>, ['pretty',
  'D • D',
  'F u A',
  'D • D'], {
  'A': <appliedenergistics2:material:44>, // Annihilation Core
  '•': <appliedenergistics2:quartz_glass>, // Quartz Glass
  'D': <enderio:item_data_conduit>, // Data Conduit
  'u': <thermalexpansion:augment:432>, // Augment: Pattern Validation
  'F': <appliedenergistics2:material:43>, // Formation Core
});

// Grindstone
recipes.remove(<appliedenergistics2:grindstone>);
recipes.addShapedMirrored('Grindstone',
  <appliedenergistics2:grindstone>,
  [[<appliedenergistics2:smooth_sky_stone_block>, <ore:gearWood>, <appliedenergistics2:smooth_sky_stone_block>],
    [<ore:crystalCertusQuartz>, <appliedenergistics2:smooth_sky_stone_block>, <ore:crystalCertusQuartz>],
    [<appliedenergistics2:sky_stone_block>, <ore:crystalCertusQuartz>, <appliedenergistics2:sky_stone_block>]]);

// [Energy Acceptor] from [Redstone Engineering Block][+4]
craft.remake(<appliedenergistics2:energy_acceptor>, ['pretty',
  '⌃ ⌃ ⌃',
  '■ ♥ ■',
  'T E T'], {
  '⌃': <appliedenergistics2:part:140>, // Quartz Fiber
  '■': <appliedenergistics2:fluix_block>, // Fluix Block
  '♥': <immersiveengineering:metal_decoration0:3>, // Redstone Engineering Block
  'T': <ore:electronTube>, // Vacuum Tube
  'E': <appliedenergistics2:material:24>, // Engineering Processor
});

// [Inscriber] from [Fluix Block][+3]
craft.remake(<appliedenergistics2:inscriber>, ['pretty',
  'C P C',
  '■   M',
  'C P C'], {
  'C': <ore:plateConcrete>, // Concrete Sheet
  'P': <minecraft:sticky_piston>,             // Sticky Piston
  '■': <appliedenergistics2:fluix_block>,     // Fluix Block
  'M': <teslacorelib:machine_case>,           // Machine Case
});

// Presses with TE Compactor, press mode
mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:13>, <appliedenergistics2:quartz_block>, 50000);
mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:14>, <minecraft:diamond_block>, 50000);
mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:15>, <ic2:plate:11>, 50000);
mods.thermalexpansion.Compactor.addPressRecipe(<appliedenergistics2:material:19>, <extrautils2:compressedsand:1>, 50000);

// Charged Certus Quartz -> Certus Dust
mods.thermalexpansion.Pulverizer.addRecipe(<appliedenergistics2:material:2>, <appliedenergistics2:material:1>, 2000, <appliedenergistics2:material:2>, 20);

// Lapis -> Dust
mods.appliedenergistics2.Grinder.addRecipe(<ic2:dust:9>, <minecraft:dye:4>, 4);

// If Channels are turned off in the config, these recipes will be changed
recipes.remove(<appliedenergistics2:quantum_ring>);

val controller = itemUtils.getItem('appliedenergistics2:controller');

if (isNull(controller)) {
  recipes.addShapedMirrored('Quantum Ring',
    <appliedenergistics2:quantum_ring>,
    [[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell:*>, <appliedenergistics2:material:24>],
      [<appliedenergistics2:energy_cell:*>, <enderio:item_me_conduit:1>, <appliedenergistics2:energy_cell:*>],
      [<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell:*>, <appliedenergistics2:material:23>]]);
}
else {
  recipes.addShapedMirrored('Quantum Ring',
    <appliedenergistics2:quantum_ring>,
    [[<appliedenergistics2:material:9>, <appliedenergistics2:energy_cell:*>, <appliedenergistics2:material:24>],
      [<appliedenergistics2:energy_cell:*>, <appliedenergistics2:part:76>, <appliedenergistics2:energy_cell:*>],
      [<appliedenergistics2:material:22>, <appliedenergistics2:energy_cell:*>, <appliedenergistics2:material:23>]]);

  // [ME Controller] from [Industrial Machine Chassis][+4]
  craft.remake(controller, ['pretty',
    'C A C',
    'Ϟ M Ϟ',
    'C A C'], {
    'C': <contenttweaker:compressed_crushed_skystone>, // Compressed Crushed Skystone
    'Ϟ': <appliedenergistics2:energy_acceptor>, // Energy Acceptor
    'M': <ore:itemMachineChassi>, // Industrial Machine Chassis
    'A': <appliedenergistics2:material:28>, // Advanced Card
  });
}

// [Advanced Card*2] from [Calculation Processor][+3]
craft.remake(<appliedenergistics2:material:28> * 2, ['pretty',
  '▲ ▬  ',
  '♥ C ▬',
  '▲ ▬  '], {
  '▲': <ore:dustCryotheum>, // Cryotheum Dust
  'C': <appliedenergistics2:material:23>, // Calculation Processor
  '♥': <ore:ingotRedstoneAlloy>, // Redstone Alloy Ingot
  '▬': <ore:ingotElectricalSteel>, // Electrical Steel Ingot
});

// Add ore for Better Questing
<ore:craftingStorageAny>.add([
  <appliedenergistics2:crafting_storage_64k>,
  <appliedenergistics2:crafting_storage_16k>,
  <appliedenergistics2:crafting_storage_4k>,
  <appliedenergistics2:crafting_storage_1k>,
]);

// Sky stone Dust
scripts.process.crush(<appliedenergistics2:sky_stone_block>, <appliedenergistics2:material:45>, 'Except: AEGrinder Pulverizer', null, null);

// Batch dust crushing
scripts.process.crush(<appliedenergistics2:fluix_block>, <appliedenergistics2:material:8> * 4, 'only: SagMill', null, null);

/*
Patchouli_js('Items/Matter Cannon', [
  {
    icon: "appliedenergistics2:matter_cannon",
    title: "Matter Cannon Ammo",
    _text: `
      This items can be used as ammo for $(l)Matter Cannon/$.
      Number represent $(l)Atomic_Mass / 10/$, not actual damage!`
  },
  ...paged({
    title: "Matter Cannon Ammo",
    type:  "grid"
  },
    match_block_below(/^\s*<([^>]+)>\s*:\s*(\d+)\.0d?,$/gm)
		.sort((a,b)=>b[2]-a[2])
    .map(match=>match[1] +'#'+ Math.round(match[2] / 10))
  )
]) */
// Matter cannon more matter
val itemMass as double[IItemStack] = {
  <tconevo:metal:42>                                 : 500.0,
  <deepmoblearning:pristine_matter_zombie>           : 100.0,
  <deepmoblearning:pristine_matter_skeleton>         : 100.0,
  <deepmoblearning:pristine_matter_creeper>          : 100.0,
  <deepmoblearning:pristine_matter_spider>           : 100.0,
  <deepmoblearning:pristine_matter_slime>            : 100.0,
  <deepmoblearning:pristine_matter_witch>            : 100.0,
  <deepmoblearning:pristine_matter_blaze>            : 150.0,
  <deepmoblearning:pristine_matter_ghast>            : 150.0,
  <deepmoblearning:pristine_matter_wither_skeleton>  : 200.0,
  <deepmoblearning:pristine_matter_enderman>         : 200.0,
  <deepmoblearning:pristine_matter_wither>           : 250.0,
  <deepmoblearning:pristine_matter_dragon>           : 400.0,
  <deepmoblearning:pristine_matter_shulker>          : 150.0,
  <deepmoblearning:pristine_matter_guardian>         : 150.0,
  <deepmoblearning:pristine_matter_thermal_elemental>: 150.0,
  <deepmoblearning:pristine_matter_tinker_slime>     : 100.0,
  <deepmoblearning:pristine_matter_twilight_forest>  : 200.0,
  <deepmoblearning:pristine_matter_twilight_swamp>   : 200.0,
  <deepmoblearning:pristine_matter_twilight_darkwood>: 200.0,
  <deepmoblearning:pristine_matter_twilight_glacier> : 200.0,
} as double[IItemStack];

for item, mass in itemMass {
  if (!isNull(item)) {
    mods.appliedenergistics2.Cannon.registerAmmo(item, mass);
  }
}

// [Printed (Every) Circuit] shortcut in [Cutting Machine]
scripts.process.saw(<ore:blockSilicon>, <appliedenergistics2:material:20> * 9, 'only: AdvRockCutter');
scripts.process.saw(<ore:blockGold>, <appliedenergistics2:material:18> * 9, 'only: AdvRockCutter');
scripts.process.saw(<ore:blockDiamond>, <appliedenergistics2:material:17> * 9, 'only: AdvRockCutter');
scripts.process.saw(<ore:crystalPureCertusQuartz> * 9, <appliedenergistics2:material:16> * 9, 'only: AdvRockCutter');

// ---------------------------------------------------------
// Make Quartz glass harder and then Show through fabricator

recipes.remove(<appliedenergistics2:quartz_glass>);

// [Quartz Glass*2] from [Glass][+1]
craft.make(<appliedenergistics2:quartz_glass> * 2, ['pretty',
  '• □ •',
  '□ • □',
  '• □ •'], {
  '□': <ore:blockGlass>, // Glass
  '•': <ore:dustQuartz> | <ore:dustCertusQuartz>,
});

// [Quartz Glass*8] from [Nether Quartz Dust]
val qglass_grid = ['pretty',
  '• • •',
  '•   •',
  '• • •'] as string[];
mods.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  '•': <ore:dustQuartz>,
}).shaped(), <liquid:glass> * 1000, <forestry:wax_cast:*>);
mods.forestry.ThermionicFabricator.addCast(<appliedenergistics2:quartz_glass> * 10, Grid(qglass_grid, {
  '•': <ore:dustCertusQuartz>,
}).shaped(), <liquid:glass> * 1000, <forestry:wax_cast:*>);

// ---------------------------------------------------------

// [Crafting Unit] from [Logic Processor][+3]
craft.remake(<appliedenergistics2:crafting_unit>, ['pretty',
  '▬ C ▬',
  'M L M',
  '▬ C ▬'], {
  'C': <appliedenergistics2:material:23>, // Calculation Processor
  '▬': <ore:ingotFluixSteel>, // Fluix Steel Ingot
  'L': <appliedenergistics2:material:22>, // Logic Processor
  'M': <appliedenergistics2:part:76>, // ME Dense Smart Cable - Fluix
});

// [ME Interface] from [Annihilation Core][+3]
recipes.removeByRecipeName('appliedenergistics2:network/blocks/interfaces_interface');
craft.make(<appliedenergistics2:interface>, ['pretty',
  '▬ ■ ▬',
  'A   F',
  '▬ ■ ▬'], {
  'A': <appliedenergistics2:material:44>, // Annihilation Core
  'F': <appliedenergistics2:material:43>, // Formation Core
  '■': <ore:plateConcrete>,
  '▬': <ore:ingotTungsten>, // Tungsten Ingot
});

# [ME Storage Bus] from [Mono-Directional Connector][+3]
craft.remake(<appliedenergistics2:part:220>, ["pretty",
  "□ п",
  "E M",
  "□ п"], {
  "□": <ore:plateEnderium>,             # Enderium Plate
  "п": <ore:plateSilver>,               # Silver Plate
  "E": <appliedenergistics2:interface>, # ME Interface
  "M": <integrateddynamics:part_connector_mono_directional_item>, # Mono-Directional Connector
});

# [ME Fluid Storage Bus] from [Mono-Directional Connector][+3]
craft.remake(<appliedenergistics2:part:221>, ["pretty",
  "□ п",
  "E M",
  "□ п"], {
  "□": <ore:plateEnderium>,                   # Enderium Plate
  "п": <ore:plateSilver>,                     # Silver Plate
  "E": <appliedenergistics2:fluid_interface>, # ME Fluid Interface
  "M": <integrateddynamics:part_connector_mono_directional_item>, # Mono-Directional Connector
});

# [ME OreDict Storage Bus] from [Oak Bookshelf][+1]
craft.reshapeless(<appliedenergistics2:part:222>, "Mb", {
  "M": <appliedenergistics2:part:220>,       # ME Storage Bus
  "b": <ore:bookshelf>, # Oak Bookshelf
});

// ---------------------------------------------------------
// Universal facade crafting recipe
// Sadly, this cant be changed like this.
// Option
//   B:EnableFacadeCrafting=false
// wont actually remove crafting recipes.
// Also, recipes.remove dont work too.
// val A = <appliedenergistics2:part:120>;
// recipes.remove(<appliedenergistics2:facade:*>);
// recipes.addHiddenShaped("Universal Facade", <appliedenergistics2:facade>, [
// 	[null, A, null],
// 	[A, <*>.marked('block'), A],
// 	[null, A, null],
// ],
// function(out, ins, cInfo) {
// 	if(isNull(ins) || isNull(ins.block)) return null;
//   return <appliedenergistics2:facade>.withTag({damage: ins.block.damage, item: ins.block.definition.id});
// });
// recipes.addShaped("Universal Facade Example", <appliedenergistics2:facade>.withTag({damage: 0, item: "minecraft:cobblestone"}), [
// 	[null, A, null],
// 	[A, <minecraft:cobblestone>, A],
// 	[null, A, null],
// ]);
// ---------------------------------------------------------

// [Charged Quartz Fixture]*6 from [Tin Item Casing][+1]
craft.reshapeless(<appliedenergistics2:quartz_fixture> * 6, '⌃⌂', {
  '⌃': <ore:gemChargedCertusQuartz>, // Charged Certus Quartz Crystal
  '⌂': <ic2:casing:6>, // Tin Item Casing
});

// [Vibrant Quartz Glass]*8 from [Glowstone Dust][+1]
craft.remake(<appliedenergistics2:quartz_vibrant_glass> * 8, ['pretty',
  '⌃ ⌃ ⌃',
  '⌃ ▲ ⌃',
  '⌃ ⌃ ⌃'], {
  '⌃': <appliedenergistics2:quartz_glass>, // Quartz Glass
  '▲': <ore:dustGlowstone>, // Glowstone Dust
});

function regrind(input as IItemStack, output as IItemStack, isOre as bool = false, extra as IItemStack = null) as void {
  val extras = (!isOre ? null : isNull(extra) ? [output] : [output, extra]) as IItemStack[];
  scripts.process.crush(input, output, 'strict: aegrinder', extras, [0.75f, 0.9f]);
}

/* Inject_js(
['ore', 'ingot']
.map((input, i) =>
	_.uniqBy(
		getOreBases_byKinds([input, 'dust'])
			.map(base => [
				`regrind(${getByOredict_first(input + base).commandString}`,
				', ',
				`${getByOredict_first(`dust${base}`).commandString + (!i
					? `, true${(() => {
							const r = getByOredict_first(`dustTiny${getExtra(base)}`)
							return !r ? '' : `, ${r.commandString}`
						})()}`
					: ''
				)});`,
			])
		, '0')
		.sort(([a], [b]) => naturalSort(a, b))
).flat()
) */
regrind(<actuallyadditions:block_misc:3>        , <actuallyadditions:item_dust:7>, true, <jaopca:item_dusttinycoal>);
regrind(<appliedenergistics2:charged_quartz_ore>, <jaopca:item_dustchargedcertusquartz>, true, <jaopca:item_dusttinydiamond>);
regrind(<appliedenergistics2:quartz_ore>        , <appliedenergistics2:material:2>, true, <jaopca:item_dusttinyquartz>);
regrind(<astralsorcery:blockcustomore:1>        , <astralsorcery:itemcraftingcomponent:2>, true, <contenttweaker:dust_tiny_silver>);
regrind(<astralsorcery:blockcustomsandore>      , <jaopca:item_dustaquamarine>, true, <jaopca:item_dusttinyaluminium>);
regrind(<biomesoplenty:gem_ore:1>               , <jaopca:item_dustruby>, true, <jaopca:item_dusttinyaluminium>);
regrind(<biomesoplenty:gem_ore:2>               , <jaopca:item_dustperidot>, true, <jaopca:item_dusttinyemerald>);
regrind(<biomesoplenty:gem_ore:3>               , <jaopca:item_dusttopaz>, true, <jaopca:item_dusttinyquartzblack>);
regrind(<biomesoplenty:gem_ore:4>               , <jaopca:item_dusttanzanite>, true, <jaopca:item_dusttinyquartz>);
regrind(<biomesoplenty:gem_ore:5>               , <jaopca:item_dustmalachite>, true, <ic2:dust:22>);
regrind(<biomesoplenty:gem_ore:6>               , <jaopca:item_dustsapphire>, true, <jaopca:item_dusttinyaluminium>);
regrind(<biomesoplenty:gem_ore>                 , <jaopca:item_dustamethyst>, true, <jaopca:item_dusttinycobalt>);
regrind(<draconicevolution:draconium_ore>       , <draconicevolution:draconium_dust>, true, <jaopca:item_dusttinyardite>);
regrind(<endreborn:block_wolframium_ore>        , <qmd:dust>, true, <jaopca:item_dusttinymagnesium>);
regrind(<forestry:resources>                    , <jaopca:item_dustapatite>, true, <jaopca:item_dusttinyaluminium>);
regrind(<immersiveengineering:ore:5>            , <immersiveengineering:metal:14>, true);
regrind(<libvulpes:ore0:8>                      , <libvulpes:productdust:7>, true, <jaopca:item_dusttinytungsten>);
regrind(<libvulpes:ore0>                        , <libvulpes:productdust>, true, <ic2:dust:24>);
regrind(<mekanism:oreblock>                     , <mekanism:dust:2>, true, <jaopca:item_dusttinynickel>);
regrind(<minecraft:coal_ore>                    , <thermalfoundation:material:768>, true, <jaopca:item_dusttinyquartzblack>);
regrind(<minecraft:diamond_ore>                 , <ic2:dust:5>, true, <jaopca:item_dusttinycertusquartz>);
regrind(<minecraft:emerald_ore>                 , <actuallyadditions:item_dust:3>, true, <jaopca:item_dusttinyperidot>);
regrind(<minecraft:gold_ore>                    , <thermalfoundation:material:1>, true, <contenttweaker:dust_tiny_silver>);
regrind(<minecraft:iron_ore>                    , <thermalfoundation:material>, true, <jaopca:item_dusttinynickel>);
regrind(<minecraft:lapis_ore>                   , <ic2:dust:9>, true, <jaopca:item_dusttinyapatite>);
regrind(<minecraft:quartz_ore>                  , <appliedenergistics2:material:3>, true, <rustic:dust_tiny_iron>);
regrind(<minecraft:redstone_ore>                , <minecraft:redstone>, true, <jaopca:item_dusttinycoal>);
regrind(<nuclearcraft:ore:3>                    , <nuclearcraft:dust:3>, true, <jaopca:item_dusttinyuranium>);
regrind(<nuclearcraft:ore:5>                    , <nuclearcraft:dust:5>, true, <jaopca:item_dusttinymagnesium>);
regrind(<nuclearcraft:ore:6>                    , <ic2:dust:11>, true, <jaopca:item_dusttinyaluminium>);
regrind(<nuclearcraft:ore:7>                    , <nuclearcraft:dust:7>, true, <rustic:dust_tiny_iron>);
regrind(<rftools:dimensional_shard_ore>         , <jaopca:item_dustdimensionalshard>, true, <jaopca:item_dusttinyastralstarmetal>);
regrind(<tconstruct:ore:1>                      , <enderio:item_material:30>, true, <jaopca:item_dusttinyosmium>);
regrind(<tconstruct:ore>                        , <enderio:item_material:31>, true, <rustic:dust_tiny_iron>);
regrind(<thaumcraft:ore_amber>                  , <jaopca:item_dustamber>, true, <rustic:dust_tiny_iron>);
regrind(<thermalfoundation:ore:1>               , <thermalfoundation:material:65>, true, <rustic:dust_tiny_iron>);
regrind(<thermalfoundation:ore:2>               , <thermalfoundation:material:66>, true);
regrind(<thermalfoundation:ore:3>               , <thermalfoundation:material:67>, true);
regrind(<thermalfoundation:ore:4>               , <thermalfoundation:material:68>, true, <rustic:dust_tiny_iron>);
regrind(<thermalfoundation:ore:5>               , <thermalfoundation:material:69>, true, <jaopca:item_dusttinyplatinum>);
regrind(<thermalfoundation:ore:6>               , <thermalfoundation:material:70>, true, <jaopca:item_dusttinynickel>);
regrind(<thermalfoundation:ore:7>               , <thermalfoundation:material:71>, true, <jaopca:item_dusttinyplatinum>);
regrind(<thermalfoundation:ore:8>               , <thermalfoundation:material:72>, true, <contenttweaker:dust_tiny_gold>);
regrind(<thermalfoundation:ore>                 , <thermalfoundation:material:64>, true);
regrind(<trinity:trinitite>                     , <jaopca:item_dusttrinitite>, true, <jaopca:item_dusttinytrinitite>);
regrind(<advancedrocketry:productingot:1>       , <advancedrocketry:productdust:1>);
regrind(<advancedrocketry:productingot>         , <advancedrocketry:productdust>);
regrind(<astralsorcery:itemcraftingcomponent:1> , <astralsorcery:itemcraftingcomponent:2>);
regrind(<draconicevolution:draconium_ingot>     , <draconicevolution:draconium_dust>);
regrind(<enderio:item_alloy_ingot:7>            , <enderio:item_material:74>);
regrind(<endreborn:item_ingot_wolframium>       , <qmd:dust>);
regrind(<immersiveengineering:material:19>      , <immersiveengineering:material:18>);
regrind(<immersiveengineering:metal:5>          , <immersiveengineering:metal:14>);
regrind(<libvulpes:productingot:7>              , <libvulpes:productdust:7>);
regrind(<mekanism:ingot:1>                      , <mekanism:dust:2>);
regrind(<mekanism:ingot>                        , <mekanism:otherdust:5>);
regrind(<minecraft:gold_ingot>                  , <thermalfoundation:material:1>);
regrind(<minecraft:iron_ingot>                  , <thermalfoundation:material>);
regrind(<nuclearcraft:ingot:3>                  , <nuclearcraft:dust:3>);
regrind(<nuclearcraft:ingot:5>                  , <nuclearcraft:dust:5>);
regrind(<nuclearcraft:ingot:6>                  , <ic2:dust:11>);
regrind(<nuclearcraft:ingot:7>                  , <nuclearcraft:dust:7>);
regrind(<nuclearcraft:ingot:8>                  , <nuclearcraft:dust:8>);
regrind(<nuclearcraft:ingot:9>                  , <nuclearcraft:dust:9>);
regrind(<nuclearcraft:ingot:10>                 , <nuclearcraft:dust:10>);
regrind(<nuclearcraft:ingot:11>                 , <nuclearcraft:dust:11>);
regrind(<nuclearcraft:ingot:14>                 , <nuclearcraft:dust:14>);
regrind(<nuclearcraft:ingot:15>                 , <nuclearcraft:dust:15>);
regrind(<psi:material:1>                        , <psi:material>);
regrind(<qmd:ingot:1>                           , <qmd:dust:1>);
regrind(<qmd:ingot:2>                           , <qmd:dust:2>);
regrind(<qmd:ingot:6>                           , <qmd:dust:6>);
regrind(<qmd:ingot:7>                           , <qmd:dust:7>);
regrind(<qmd:ingot:11>                          , <qmd:dust:11>);
regrind(<qmd:ingot:12>                          , <qmd:dust:12>);
regrind(<qmd:ingot:13>                          , <qmd:dust:13>);
regrind(<qmd:ingot:14>                          , <qmd:dust:14>);
regrind(<qmd:ingot2:1>                          , <qmd:dust2:1>);
regrind(<qmd:ingot2>                            , <qmd:dust2>);
regrind(<redstonearsenal:material:32>           , <redstonearsenal:material>);
regrind(<redstonerepository:material:1>         , <redstonerepository:material>);
regrind(<tconevo:metal:5>                       , <tconevo:metal:6>);
regrind(<tconevo:metal:10>                      , <tconevo:metal:11>);
regrind(<tconevo:metal:15>                      , <tconevo:metal:16>);
regrind(<tconevo:metal:20>                      , <tconevo:metal:21>);
regrind(<tconevo:metal:25>                      , <tconevo:metal:26>);
regrind(<tconevo:metal:30>                      , <tconevo:metal:31>);
regrind(<tconevo:metal:35>                      , <tconevo:metal:36>);
regrind(<tconevo:metal:40>                      , <tconevo:metal:41>);
regrind(<tconevo:metal>                         , <tconevo:metal:1>);
regrind(<tconstruct:ingots:1>                   , <enderio:item_material:30>);
regrind(<tconstruct:ingots>                     , <enderio:item_material:31>);
regrind(<thermalfoundation:material:128>        , <thermalfoundation:material:64>);
regrind(<thermalfoundation:material:129>        , <thermalfoundation:material:65>);
regrind(<thermalfoundation:material:130>        , <thermalfoundation:material:66>);
regrind(<thermalfoundation:material:131>        , <thermalfoundation:material:67>);
regrind(<thermalfoundation:material:132>        , <thermalfoundation:material:68>);
regrind(<thermalfoundation:material:133>        , <thermalfoundation:material:69>);
regrind(<thermalfoundation:material:134>        , <thermalfoundation:material:70>);
regrind(<thermalfoundation:material:135>        , <thermalfoundation:material:71>);
regrind(<thermalfoundation:material:136>        , <thermalfoundation:material:72>);
regrind(<thermalfoundation:material:160>        , <thermalfoundation:material:96>);
regrind(<thermalfoundation:material:161>        , <thermalfoundation:material:97>);
regrind(<thermalfoundation:material:162>        , <thermalfoundation:material:98>);
regrind(<thermalfoundation:material:163>        , <thermalfoundation:material:99>);
regrind(<thermalfoundation:material:164>        , <thermalfoundation:material:100>);
regrind(<thermalfoundation:material:165>        , <thermalfoundation:material:101>);
regrind(<thermalfoundation:material:166>        , <thermalfoundation:material:102>);
regrind(<thermalfoundation:material:167>        , <thermalfoundation:material:103>);
regrind(<trinity:ingot_au_198>                  , <trinity:dust_au_198>);
/**/

regrind(<minecraft:obsidian>, <thermalfoundation:material:770>);
regrind(<tconstruct:ingots>, <exnihilocreatio:item_ore_cobalt:2>);
regrind(<tconstruct:ore>, <exnihilocreatio:item_ore_cobalt:2>);

// [Pattern Expansion Card] from [ME Interface][+2]
craft.remake(<appliedenergistics2:material:58>, ['pretty',
  '  A  ',
  'd M A',
  '  A  '], {
  'A': <ore:plateTitanium>,
  'd': <appliedenergistics2:material:28>, // Advanced Card
  'M': <appliedenergistics2:interface>, // ME Interface
});

// [Pattern Expansion Card] from [ME Interface][+2]
craft.make(<appliedenergistics2:material:58>, ['pretty',
  '  A  ',
  'd M A',
  '  A  '], {
  'A': <ore:plateTitanium>,
  'd': <appliedenergistics2:material:28>, // Advanced Card
  'M': <appliedenergistics2:part:440>, // ME Interface
});

# [Quantum Link Card] from [1024k ME Storage Component][+3]
mods.appliedenergistics2.Inscriber.removeRecipe(<appliedenergistics2:material:59>);
craft.remake(<appliedenergistics2:material:59>, ["pretty",
  "M S M",
  "◊ § ◊",
  "M S M"], {
  "M": <appliedenergistics2:quantum_link>, # ME Quantum Link Chamber
  "S": <appliedenergistics2:material:47>,  # Singularity
  "◊": <ore:gemAnglesite>,                 # Anglesite
  "§": <nae2:material:2>,                  # 1024k ME Storage Component
});

val terminalIngrs = {
  'F': <ore:pearlFluix>, // Fluix Pearl
  'W': <ae2stuff:wireless>,
  'M': <appliedenergistics2:quantum_ring>, // ME Quantum Ring
  'C': <appliedenergistics2:part:360>, // ME Crafting Terminal
  '○': <appliedenergistics2:part:520>, // ME Fluid Terminal
  'P': <appliedenergistics2:part:340>, // ME Pattern Terminal
} as IIngredient[string];

// [Wireless Crafting Terminal]
craft.remake(<appliedenergistics2:wireless_crafting_terminal>, ['pretty',
  '  C  ',
  'F W F',
  'F M F'], terminalIngrs
);

// [Wireless Fluid Terminal]
craft.remake(<appliedenergistics2:wireless_fluid_terminal>, ['pretty',
  '  ○  ',
  'F W F',
  'F M F'], terminalIngrs
);

// [Wireless Pattern Terminal]
craft.remake(<appliedenergistics2:wireless_pattern_terminal>, ['pretty',
  '  P  ',
  'F W F',
  'F M F'], terminalIngrs
);

// ---------------------------------
// Storage Component rework
// ---------------------------------
val storCompIngrs = [
  [<appliedenergistics2:material:35>, /*     1k */ <ore:dustGlowstone>, <appliedenergistics2:material:22>, /* Logic Processor */              <appliedenergistics2:material:1>], // Charged Certus Quartz Crystal
  [<appliedenergistics2:material:36>, /*     4k */ <ore:dustGlowstone>, <appliedenergistics2:material:22>, /* Logic Processor */              <ic2:re_battery>.withTag({ charge: 10000.0 })], // RE-Battery
  [<appliedenergistics2:material:37>, /*    16k */ <ore:dustGlowstone>, <appliedenergistics2:material:23>, /* Calculation Processor */        <ic2:advanced_re_battery>.withTag({ charge: 100000.0 })], // Advanced RE-Battery
  [<appliedenergistics2:material:38>, /*    64k */ <ore:dustGlowstone>, <appliedenergistics2:material:23>, /* Calculation Processor */        <ic2:energy_crystal>.withTag({ charge: 1000000.0 })], // Energy Crystal
  [<nae2:material:1>, /*   256k */ <ore:dustGlowstone>, <appliedenergistics2:material:24>, /* Engineering Processor */        <ic2:lapotron_crystal>.withTag({ charge: 1.0e7 })], // Lapotron Crystal
  [<nae2:material:2>, /*  1024k */ <ore:dustGlowstone>, <appliedenergistics2:material:24>, /* Engineering Processor */        <requious:quantron>.withTag({ energy: 200000000 })], // Quantron
  [<nae2:material:3>, /*  4096k */ <ore:dustGlowstone>, <threng:material:6>              , /* Massively Parallel Processor */ <requious:positron_unit>.withTag({ energy: 2000000000 })], // Positron Unit
  [<nae2:material:4>, /* 16384k */ <ore:dustGlowstone>, <threng:material:6>              , /* Massively Parallel Processor */ <ore:blockDraconiumCharged>], // Charged Draconium Block
] as IIngredient[][];

for i, inputs in storCompIngrs {
  craft.remake(inputs[0].items[0], ['pretty',
    '♥ - ♥',
    '⌃ C ⌃',
    '♥ - ♥'], {
    '♥': inputs[1], // Dust
    '-': inputs[2], // Processor
    '⌃': i == 0 ? <appliedenergistics2:material:1> as IIngredient : storCompIngrs[i - 1][0], // Prev
    'C': inputs[3], // Battery
  });

  if (i > 4) {
    val curr = itemUtils.getItem('nae2:coprocessor_' ~ pow(4, i - 4) as int ~ 'x');
    val prev = itemUtils.getItem('nae2:coprocessor_' ~ pow(4, i - 5) as int ~ 'x');
    craft.remake(curr, ['pretty',
      '♥ - ♥',
      '⌃ C ⌃',
      '♥ - ♥'], {
      '♥': <ore:ingotFluixSteel>,
      '-': inputs[2], // Processor
      '⌃': i == 5 ? <appliedenergistics2:crafting_accelerator> as IIngredient : prev, // Prev
      'C': inputs[3], // Battery
    });
  }
}
// ---------------------------------

// Clear singularity tags
recipes.addHiddenShapeless(
  'singularity_tag_clearing',
  <appliedenergistics2:material:48> * 2,
  [<ore:singularityEntangled>, <ore:singularityEntangled>]
);
// and JEI recipe hint for it, it's added at both server and client to prevent strange data syncing issue
recipes.addShapeless(
  'dummy_singularity_tag_clearing',
  <appliedenergistics2:material:48> * 2,
  [
    <appliedenergistics2:material:48>.withTag({freq: 1234567890 as long}),
    <appliedenergistics2:material:48>.withTag({freq: 9876543210 as long})
  ]
);

// [ME Crafting Terminal] from [ME Terminal][+3]
craft.remake(<appliedenergistics2:part:360>, ['pretty',
  '  N  ',
  '¤ M ¤',
  '  V  '], {
  'N': <thermallogistics:manager>, // Network Manager
  '¤': <ore:gearVibrant>, // Vibrant Bimetal Gear
  'M': <appliedenergistics2:part:380>, // ME Terminal
  'V': <vaultopic:vice>, // V.I.C.E. (Vaultopic Item Crafting Entity)
});

// Remake recipe that making hundred of its copies
mods.appliedenergistics2.Inscriber.removeRecipe(<appliedenergistics2:material:60>);
mods.appliedenergistics2.Inscriber.addRecipe(<appliedenergistics2:material:60>, <appliedenergistics2:material:25>, false, <minecraft:redstone_block>, <minecraft:lapis_block>);

// Pure crystals instant growing in Witch Water
mods.inworldcrafting.FluidToItem.transform(<appliedenergistics2:material:10>, <fluid:witchwater>, [<appliedenergistics2:crystal_seed>], true);
mods.inworldcrafting.FluidToItem.transform(<appliedenergistics2:material:11>, <fluid:witchwater>, [<appliedenergistics2:crystal_seed:600>], true);
mods.inworldcrafting.FluidToItem.transform(<appliedenergistics2:material:12>, <fluid:witchwater>, [<appliedenergistics2:crystal_seed:1200>], true);
