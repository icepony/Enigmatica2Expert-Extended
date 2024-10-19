#modloaded ic2

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.WeightedItemStack;
import mods.ic2.ScrapBox;

import scripts.jei.mod.ic2.addCrop;

<ic2:treetap>.maxDamage = 400; // Buff from 16
<ic2:wrench>.maxDamage = 5000; // Buff from 100
<ic2:cf_pack>.maxDamage = 4000; // Buff from 27
<ic2:dynamite>.maxStackSize = 64;
<ic2:dynamite_sticky>.maxStackSize = 64;

// Prevent recharging dupe
<ic2:lzh_condensator>.maxStackSize = 1;
<ic2:rsh_condensator>.maxStackSize = 1;

Purge(<ic2:te:76>); // Electrolyzer

// Hydrated Coal Dust recipe consumes containers that can store 1000mB + liquid, this fixes that
recipes.addShapeless('ic2_hydrated_coal_dust_liquid_fix', <ic2:dust:3>, [<ore:dustCoal>, LiquidIngr('water')]);
recipes.addShapeless('ic2_hydrated_tin_fix', <ic2:dust:29>, [<ore:dustTin>, LiquidIngr('water')]);
recipes.addShapeless('ic2_coffee_fix', <ic2:mug:1>, [<ic2:mug>, <ic2:crop_res:1>, LiquidIngr('water')]);
recipes.addShapeless('ic2_heat_storage_fix', <ic2:heat_storage>, [<ore:plateTin>, <ore:plateTin>, LiquidIngr('ic2coolant'), <ore:plateTin>, <ore:plateTin>]);
furnace.remove(<ic2:dust:2>);
furnace.addRecipe(<thermalfoundation:material:768>, <ic2:dust:3>);

// Missed ingot smeltings
for input, output in {
  <ic2:crushed>: <thermalfoundation:material:128>,
  <ic2:crushed:4>: <thermalfoundation:material:130>,
  <ic2:crushed:5>: <thermalfoundation:material:129>,
  <ic2:crushed:3>: <thermalfoundation:material:131>,
  <ic2:crushed:6>: <immersiveengineering:metal:5>,  
} as IItemStack[IItemStack] {
  furnace.addRecipe(output, input, 0.5);
  furnace.addRecipe(output, <ic2:purified>.withDamage(input.damage), 0.5);
}

// [RE-Battery] from [Rubber][+2]
craft.make(<ic2:re_battery:26>.withTag({}), ['pretty',
  '  R  ',
  '⌂ ♥ ⌂',
  '⌂ ♥ ⌂'], {
  'R': <ore:itemRubber>,   // Rubber
  '⌂': <ic2:casing:6>,     // Tin Item Casing
  '♥': <ore:dustRedstone>, // Redstone
});

// [Advanced RE-Battery] from [Sulfur][+3]
craft.make(<ic2:advanced_re_battery:26>.withTag({}), ['pretty',
  'R ⌂ R',
  '⌂ ♠ ⌂',
  '⌂ ▲ ⌂'], {
  'R': <ore:itemRubber>, // Rubber
  '⌂': <ic2:casing>,     // Bronze Item Casing
  '♠': <ore:dustSulfur>, // Sulfur
  '▲': <ore:dustLead>,   // Pulverized Lead
});

// Removing IC2 coal coke
recipes.remove(<ic2:coke>);

// Hazmat/Rubber Armor
recipes.addShaped('Hazmat ', <ic2:hazmat_helmet>,
  [[<ore:dyeOrange>, <ore:dyeOrange>, <ore:dyeOrange>],
    [<ore:itemRubber>, <ore:blockGlass>, <ore:itemRubber>],
    [<ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>]]);

recipes.addShaped('Hazmat Chest', <ic2:hazmat_chestplate>,
  [[<ore:itemRubber>, null, <ore:itemRubber>],
    [<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>],
    [<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>]]);

recipes.addShaped('Hazmat Leggings', <ic2:hazmat_leggings>,
	 [[<ore:itemRubber>, <ore:dyeOrange>, <ore:itemRubber>],
	 [<ore:itemRubber>, null, <ore:itemRubber>],
	  [<ore:itemRubber>, null, <ore:itemRubber>]]);

recipes.addShaped('Hazmat Boots', <ic2:rubber_boots>,
  [[<ore:itemRubber>, null, <ore:itemRubber>],
    [<ore:itemRubber>, null, <ore:itemRubber>],
    [<ore:itemRubber>, <ore:dyeBlack>, <ore:itemRubber>]]);

// Clay Dust
recipes.addShapeless('Clay Dust',
  <ic2:dust:1>, [<minecraft:clay>, <ore:craftingToolForgeHammer>]);

// Oredicting recipe
// [Industrial Workbench] from [Basic Machine Casing][+3]
craft.remake(<ic2:te:88>, ['Two'], {
  'T': <ore:craftingToolForgeHammer>.noReturn(), // Forge Hammer
  'w': <ore:workbench>, // Crafting Table
  'o': <ore:craftingToolWireCutter>.noReturn(), // Cutter
});

// [Batch Crafter] from [Basic Machine Casing][+2]
craft.remake(<ic2:te:89>, ['pretty',
  '  I  ',
  'R ■ R'], {
  'I': <ic2:te:88>,        // Industrial Workbench
  'R': <ore:itemRubber>,   // Rubber
  '■': <ore:machineBlock>, // Basic Machine Casing
});

// Jetpack Attachment Plate, recipe needs oredict
recipes.remove(<ic2:crafting:37>);
recipes.addShaped('Jetpack Attachment Plate',
  <ic2:crafting:37>,
  [[null, <ic2:crafting:3>, null],
    [<ic2:crafting:15>, <ore:plateSteel>, <ic2:crafting:15>],
    [null, <ic2:crafting:3>, null]]);

//  Overclocker Upgrade
recipes.remove(<ic2:upgrade>);
scripts.mods.forestry.Carpenter.addRecipe(<ic2:upgrade> * 2,
  [[<ore:plateTin>, <ore:plateTin>, <ore:plateTin>],
    [<ic2:cable>, <ore:circuitBasic>, <ic2:cable>],
    [<ore:plateTin>, <ore:plateTin>, <ore:plateTin>]], 40, <liquid:ic2coolant> * 3000);

// Iridium Reinforced Plate, recipe needs oredict
recipes.remove(<ic2:crafting:4>);
recipes.addShapedMirrored('Iridium Reinforced Plate',
  <ic2:crafting:4>,
  [[<ore:ingotIridium>, <ic2:crafting:3>, <ore:ingotIridium>],
    [<ic2:crafting:3>, <ore:gemDiamondRat>, <ic2:crafting:3>],
    [<ore:ingotIridium>, <ic2:crafting:3>, <ore:ingotIridium>]]);

// Reactor Chamber
recipes.remove(<ic2:te:24>);
recipes.addShaped('IC2 Reactor Chamber',
  <ic2:te:24> * 2,
  [[null, <ore:plateDenseLead>, null],
    [<ore:plateDenseLead>, <ic2:resource:12>, <ore:plateDenseLead>],
    [null, <ore:plateDenseLead>, null]]);

// Basic Machine Casing
recipes.remove(<ic2:resource:12>);
recipes.addShapedMirrored('Basic Machine Casing1',
  <ic2:resource:12> * 4,
  [[<ore:plateAluminum>, <tconstruct:large_plate>.withTag({ Material: 'iron' }), <ore:plateAluminum>],
    [<tconstruct:large_plate>.withTag({ Material: 'iron' }), null, <tconstruct:large_plate>.withTag({ Material: 'iron' })],
    [<ore:plateAluminum>, <tconstruct:large_plate>.withTag({ Material: 'iron' }), <ore:plateAluminum>]]);

recipes.addShapedMirrored('Basic Machine Casing2',
  <ic2:resource:12> * 4,
  [[<ore:plateAluminium>, <ore:plateDenseIron>, <ore:plateAluminium>],
    [<ore:plateDenseIron>, null, <ore:plateDenseIron>],
    [<ore:plateAluminium>, <ore:plateDenseIron>, <ore:plateAluminium>]]);

recipes.addShapedMirrored('Basic Machine Casing3',
  <ic2:resource:12> * 4,
  [[<ore:plateAluminium>, <ore:plateDenseTin>, <ore:plateAluminium>],
    [<ore:plateDenseTin>, null, <ore:plateDenseTin>],
    [<ore:plateAluminium>, <ore:plateDenseTin>, <ore:plateAluminium>]]);

// Reinforced Stone
recipes.addShapedMirrored('Reinforced Stone',
  <ic2:resource:11> * 16,
  [[<minecraft:stone:*>, <tconstruct:soil>, <minecraft:stone:*>],
    [<tconstruct:soil>, <ore:dustClay>, <tconstruct:soil>],
    [<minecraft:stone:*>, <tconstruct:soil>, <minecraft:stone:*>]]);

// Iridium TiC Compat
mods.tconstruct.Melting.addRecipe(<liquid:iridium> * 144, <ic2:misc_resource:1>, 500);
mods.tconstruct.Melting.addRecipe(<liquid:iridium> * 16, <ic2:misc_resource:2>, 200);

// Lapis Dust
recipes.remove(<ic2:dust:9>);

// Diamond Dust
recipes.remove(<ic2:dust:5>);

// IC2 Block Cutting blades
mods.tconstruct.Casting.addTableRecipe(<ic2:block_cutting_blade>,   <architecturecraft:sawblade>, <fluid:iron>, 1152, true, 20);
mods.tconstruct.Casting.addTableRecipe(<ic2:block_cutting_blade:1>, <architecturecraft:sawblade>, <fluid:steel>, 1152, true, 60);
mods.tconstruct.Casting.addTableRecipe(<ic2:block_cutting_blade:2>, <architecturecraft:sawblade>, <fluid:diamond>, 5328, true, 120);
mods.tconstruct.Melting.addRecipe(<liquid:iron>  * 1152, <ic2:block_cutting_blade>);
mods.tconstruct.Melting.addRecipe(<liquid:steel> * 1152, <ic2:block_cutting_blade:1>);

// New Scraps
ScrapBox.addDrop(<ic2:crafting:24>                            , 0.00000001f); // First entry there would always be outputted, like, x1000 times more often
ScrapBox.addDrop(<appliedenergistics2:material:6>             , 6.0f);
ScrapBox.addDrop(<thermalfoundation:diagram_redprint>         , 4.65f);
ScrapBox.addDrop(<thermalfoundation:material:864>             , 4.2f);
ScrapBox.addDrop(<mekanism:substrate>                         , 3.6f);
ScrapBox.addDrop(<mekanismgenerators:hohlraum>                , 3.15f);
ScrapBox.addDrop(<rftools:syringe>                            , 2.55f);
ScrapBox.addDrop(<mekanism:mufflingupgrade>                   , 2.25f);
ScrapBox.addDrop(<industrialforegoing:plastic>                , 1.65f);
ScrapBox.addDrop(<mekanism:polyethene:2>                      , 1.35f);
ScrapBox.addDrop(<nuclearcraft:upgrade:1>                     , 1.35f);
ScrapBox.addDrop(<nuclearcraft:upgrade>                       , 1.35f);
ScrapBox.addDrop(<appliedenergistics2:material:52>            , 0.9f);
ScrapBox.addDrop(<immersiveengineering:material:5>            , 0.9f);
ScrapBox.addDrop(<extrautils2:decorativesolid:3>              , 0.6f);
ScrapBox.addDrop(<extrautils2:decorativesolid:7>              , 0.6f);
ScrapBox.addDrop(<immersiveengineering:stone_decoration:8>    , 0.6f);
ScrapBox.addDrop(<industrialforegoing:pink_slime>             , 0.45f);
ScrapBox.addDrop(<rftools:shape_card>                         , 0.45f);
ScrapBox.addDrop(<appliedenergistics2:fluix_block>            , 0.3f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:1>     , 0.15f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:2>     , 0.15f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:3>     , 0.15f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:4>     , 0.15f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard:5>     , 0.15f);
ScrapBox.addDrop(<actuallyadditions:item_crystal_shard>       , 0.15f);
ScrapBox.addDrop(<extrautils2:klein>                          , 0.15f);
ScrapBox.addDrop(<immersiveengineering:material:26>           , 0.15f);
ScrapBox.addDrop(<psi:cad_colorizer_:17>                      , 0.15f);
ScrapBox.addDrop(<thermalexpansion:frame:64>                  , 0.075f);
ScrapBox.addDrop(<rftoolsdim:dimlet_parcel>                   , 0.045f);
ScrapBox.addDrop(<forestry:chipsets:0>.withTag({ T: 0 as short }), 0.15f);
ScrapBox.addDrop(<forestry:chipsets:1>.withTag({ T: 1 as short }), 0.09f);
ScrapBox.addDrop(<forestry:chipsets:2>.withTag({ T: 2 as short }), 0.06f);
ScrapBox.addDrop(<forestry:chipsets:3>.withTag({ T: 3 as short }), 0.015f);

// Energy crystal compat
scripts.process.compress(<ic2:dust:6> * 9, <ic2:energy_crystal:27>, 'except: compressor');

// Harder wooden box
craft.remake(<ic2:te:111>, ['pretty',
  'A B A',
  'B C B',
  'A B A'], {
  A: <ore:logWood>,
  B: <ore:plankWood>,
  C: <quark:iron_button>,
});

// Construction foam
// Remove CF Powder but replace it with Building Gadget's powder
scripts.process.solution([<buildinggadgets:constructionpaste>], [<fluid:water> * 4000], [<fluid:ic2construction_foam> * 4000], null, 'Except: highoven');

// [Solar Panel] from [Pulverized Coal][+3]
craft.remake(<ic2:te:8>, ['pretty',
  '◊ ◊ ◊',
  '□ © □',
  '□ B □'], {
  '□': <ore:plateIron>, // Iron Plate
  'B': <ore:circuitBasic>, // Electronic Circuit
  '©': <ore:dustCoal>, // Pulverized Coal
  '◊': <ore:gemLapis>, // Lapis Lazuli
});

// [Solar Panel] batch crafting
scripts.processUtils.avdRockXmlRecipeEx(
  'PrecisionAssembler', [
    <ore:plateIron> * 64,
    <ore:gemLapis> * 48,
    <ore:circuitBasic> * 16,
    <ore:dustCoal> * 16,
  ], null, [<ic2:te:8> * 16], null, { power: 120000, timeRequired: 100 });

// Remove Recycler (replaced by other machines)
recipes.remove(<ic2:te:48>);

// [Solar Helmet] from [Solar Panel][+2]
craft.remake(<ic2:solar_helmet>, ['pretty',
  '  I  ',
  '  2  ',
  'C C C'], {
  '2': <ore:ic2SolarPanel>, // Solar Panel
  'C': <ore:itemCopperCable>, // Insulated Copper Cable
  'I': <conarm:helmet_core>.withTag({ Material: 'iron' }), // Iron Helmet Core
});

// Crafts from ini file
for out, inp in {
  <advancedrocketry:productplate:1>: <ore:ingotTitaniumIridium>,
  <advancedrocketry:productplate>  : <ore:ingotTitaniumAluminide>,
  <immersiveengineering:metal:35>  : <ore:ingotUranium>,
  <libvulpes:productplate:3>       : <ore:ingotSilicon>,
  <libvulpes:productplate:7>       : <ore:ingotTitanium>,
  <redstonearsenal:material:128>   : <ore:ingotElectrumFlux>,
  <thermalfoundation:material:322> : <ore:ingotSilver>,
  <thermalfoundation:material:324> : <ore:ingotAluminum>,
  <thermalfoundation:material:325> : <ore:ingotNickel>,
  <thermalfoundation:material:326> : <ore:ingotPlatinum>,
  <thermalfoundation:material:327> : <ore:ingotIridium>,
  <thermalfoundation:material:328> : <ore:ingotMithril>,
  <thermalfoundation:material:353> : <ore:ingotElectrum>,
  <thermalfoundation:material:354> : <ore:ingotInvar>,
  <thermalfoundation:material:356> : <ore:ingotConstantan>,
  <thermalfoundation:material:357> : <ore:ingotSignalum>,
  <thermalfoundation:material:358> : <ore:ingotLumium>,
  <thermalfoundation:material:359> : <ore:ingotEnderium>,
} as IIngredient[IItemStack] {
  mods.ic2.MetalFormer.addRollingRecipe(out, inp);
}

// Remake Dust compession recipes
function tinyDustFix(a as IItemStack, b as IItemStack) as void {
  recipes.addShapeless('Pack dist_' ~ a.damage, b, [a,a,a,a,a,a,a,a,a]);
}

tinyDustFix(<ic2:dust:22>, <ic2:dust:9>);
tinyDustFix(<ic2:dust:25>, <thermalfoundation:material:770>);
tinyDustFix(<ic2:dust:35>, <actuallyadditions:item_dust:3>);
tinyDustFix(<ic2:dust:18>, <thermalfoundation:material:99>);
tinyDustFix(<ic2:dust:24>, <ic2:dust:11>);
tinyDustFix(<ic2:dust:27>, <thermalfoundation:material:771>);

// Convert purged tin and copper
recipes.addShapeless(<thermalfoundation:ore> * 2        , [<ic2:resource:1>, <ic2:resource:1>] /* Copper Ore */);
recipes.addShapeless(<thermalfoundation:ore:1> * 2      , [<ic2:resource:3>, <ic2:resource:3>] /* Tin Ore */);
recipes.addShapeless(<thermalfoundation:material:64> * 2, [<ic2:dust:4>, <ic2:dust:4>] /* Copper Dust */);
recipes.addShapeless(<thermalfoundation:material:65> * 2, [<ic2:dust:17>, <ic2:dust:17>] /* Tin Dust */);

// Crystal memory crafts
function crystalRecipe(name as string, item as IItemStack, ingrs as IIngredient[]) {
  recipes.remove(item);
  recipes.addShapeless(name, <ic2:crystal_memory>.withTag({ Pattern: { id: item.definition.id, Count: 1 as byte, Damage: item.damage as short } }), ingrs);
  scripts.lib.tooltip.desc.both(item, 'crystal_memory');
}

crystalRecipe('[Shape Card] crystal', <rftools:shape_card>,      [<ore:circuitElite>, <immersiveengineering:blueprint>.withTag({ blueprint: 'molds' }), <ic2:crystal_memory>, <ore:paper>, <ore:paper>]);
crystalRecipe('[Base Addon] crystal', <teslacorelib:base_addon>, [<industrialforegoing:plastic>, <industrialforegoing:plastic>, <ic2:crystal_memory>, <ore:paper>, <ore:paper>]);

// [Heat-Capacity Reactor Plating] from [Dense Copper Plate][+1]
craft.reshapeless(<ic2:heat_plating>, 'п□', {
  '□': <ore:plateDenseCopper>, // Dense Copper Plate
  'п': <ore:plateLead>,        // Lead Plate
});

// [Containment Reactor Plating] from [Lead Plate][+1]
craft.reshapeless(<ic2:containment_plating>, 'п□□□', {
  '□': <ore:plateAdvancedAlloy>, // Advanced Alloy
  'п': <ore:plateLead>, // Lead Plate
});

// Reprocess plutonium
mods.nuclearcraft.DecayHastener.addRecipe(<ic2:nuclear:3>, <nuclearcraft:uranium:5>, 2.0, 2.0);

// Remove Uranium 238 and replace it with simple uranium
mods.nuclearcraft.FuelReprocessor.removeRecipeWithInput(<nuclearcraft:depleted_fuel_ic2>);
mods.nuclearcraft.FuelReprocessor.addRecipe(<ore:depletedFuelIC2U>,
  <nuclearcraft:uranium:10> * 2, <nuclearcraft:uranium:10>, <nuclearcraft:uranium:10>, <ic2:nuclear:7>,
  null, null, null, null
);

// Batch crafting recipe for reflector, skipping microcraftings
scripts.processUtils.avdRockXmlRecipeEx('PrecisionAssembler', [
  <ore:plateCopper> * 64, // Copper Plate
  <ore:dustTin> * 64,     // Pulverized Tin
  <ore:dustCoal> * 64,    // Pulverized Coal
  <ic2:crafting:4>,       // Iridium Reinforced Plate
], null,
[<ic2:iridium_reflector>], null, { power: 160000, timeRequired: 80 }
);

// Milk Powder
scripts.process.evaporate(<fluid:milk> * 250, <ic2:dust:33>, 'No exceptions');
scripts.process.solution([<ic2:dust:33>], [<fluid:water> * 250], [<fluid:milk> * 250], null, 'Except: highoven');

// Stone dust alt usage
furnace.addRecipe(<tconstruct:materials>, <ore:dustStone>);

// [Treated Wood Planks]*8 from [Creosote Bucket][+1]
craft.make(<immersiveengineering:treated_wood> * 8, ['pretty',
  '# # #',
  '# ~ #',
  '# # #'], {
  '#': <ore:plankWood>, // Oak Wood Planks
  '~': LiquidIngr('ic2creosote'),
});

// Weed => Fertilizer
mods.actuallyadditions.Compost.addRecipe(<ic2:crop_res:2>, <minecraft:wool:13>, <ic2:crop_res:5>, <tconstruct:soil:1>);

// Scrap making from seed bags
scripts.process.crush(<ic2:crop_seed_bag>, <ic2:crafting:23>, 'only: Macerator', null, null);

// [Scrap]*64 from [Condensate Water Bucket][+1]
craft.shapeless(<ic2:crafting:23> * 64, 'G~', {
  'G': <rats:garbage_pile>, // Garbage Pile
  '~': LiquidIngr('condensate_water'), // Condensate Water
});

// [Scrap]*64
craft.shapeless(<ic2:crafting:23> * 64, 'G~', {
  'G': <nuclearcraft:wasteland_earth>,
  '~': LiquidIngr('condensate_water'), // Condensate Water
});

// [Scrap Box]*64
craft.shapeless(<ic2:crafting:24> * 32, 'G~', {
  'G': <trinity:radioactive_earth>,
  '~': LiquidIngr('condensate_water'), // Condensate Water
});

// [Scrap Box]*64
craft.shapeless(<ic2:crafting:24> * 64, 'G~', {
  'G': <trinity:radioactive_earth2>,
  '~': LiquidIngr('water'), // Condensate Water
});

// --------------------------------------------------------------------------------------------
// CROPS
// --------------------------------------------------------------------------------------------

//    Name           | Drops                                                          | Tier | Attributes                                  | "Special requirements"                                                                                                                            |
addCrop('weed'          , [<ic2:crop_res:5>]                                              , 0 , 'Weed Bad'                                    , '§6Can only be harvested with §nWeeding Trowel§r§6; Takes over neighboring plants and spreads grass');
addCrop('beetroots'     , [<minecraft:beetroot>]                                          , 1 , 'Red Food Beetroot');
addCrop('pumpkin'       , [<minecraft:pumpkin>]                                           , 1 , 'Orange Decoration Stem');
addCrop('wheat'         , [<minecraft:wheat>]                                             , 1 , 'Yellow Food Wheat'                           , '§6Light level of at least 9');
addCrop('blackthorn'    , [<minecraft:dye>]                                               , 2 , 'Black Flower Rose'                           , '§6Light level of at least 12');
addCrop('brown_mushroom', [<minecraft:brown_mushroom>]                                    , 2 , 'Brown Food Mushroom'                         , '§6Must be hydrated');
addCrop('carrots'       , [<minecraft:carrot>]                                            , 2 , 'Orange Food Carrots'                         , '§6Light level of at least 9');
addCrop('cyazint'       , [<minecraft:dye:6>]                                             , 2 , 'Blue Flower'                                 , '§6Light level of at least 12');
addCrop('dandelion'     , [<minecraft:dye:11>]                                            , 2 , 'Yellow Flower'                               , '§6Light level of at least 12');
addCrop('flax'          , [<minecraft:string>]                                            , 2 , 'Silk Vine Addictive');
addCrop('melon'         , [<minecraft:melon>,<minecraft:melon_block>]                     , 2 , 'Green Food Stem');
addCrop('potato'        , [<minecraft:potato>,<minecraft:poisonous_potato>]               , 2 , 'Yellow Food Potato'                          , '§6Light level of at least 9; Must be harvested early or it will drop §nPoisonous Potato');
addCrop('red_mushroom'  , [<minecraft:red_mushroom>]                                      , 2 , 'Red Food Mushroom'                           , '§6Must be hydrated');
addCrop('reed'          , [<minecraft:reeds>]                                             , 2 , 'Reed');
addCrop('rose'          , [<minecraft:dye:1>]                                             , 2 , 'Red Flower Rose'                             , '§6Light level of at least 12');
addCrop('tulip'         , [<minecraft:dye:5>]                                             , 2 , 'Purple Flower Tulip'                         , '§6Light level of at least 12');
addCrop('cocoa'         , [<minecraft:dye:3>]                                             , 3 , 'Brown Food Stem'                             , '§6Nutrients of at least 3');
addCrop('venomilia'     , [<minecraft:dye:5>,<ic2:crop_res:3>]                            , 3 , 'Purple Flower Tulip Poison'                  , '§6Light level of at least 12; Only drops §nGrin Powder§r§6 during second to last stage; at which point the plant is poisonous to touch unless sneaking');
addCrop('stickreed'     , [<minecraft:reeds>,<ic2:misc_resource:4>]                       , 4 , 'Reed Resin'                                  , '§6Drops §nSticky Resin§r§6 only when mature');
addCrop('corpse_plant'  , [<minecraft:rotten_flesh>,<minecraft:dye:15>,<minecraft:bone>]  , 5 , 'Toxic Undead Vine Edible Rotten');
addCrop('hops'          , [<ic2:crop_res:4>]                                              , 5 , 'Green Ingredient Wheat'                      , '§6Light level of at least 9');
addCrop('nether_wart'   , [<minecraft:nether_wart>]                                       , 5 , 'Red Nether Ingredient Soulsand'              , '§6Grows faster with §nSoul Sand§r§6 under it; Turns into §nTerra Wart§r§6 if there is Snow under it');
addCrop('terra_wart'    , [<ic2:terra_wart>]                                              , 5 , 'Blue Aether Consumable Snow'                 , '§6Grows faster with §nSnow§r§6 under it; Turns into §nNether Wart§r§6 if there is §nSoul Sand§r§6 under it');
addCrop('aurelia'       , [<ic2:dust:20>]                                                 , 6 , 'Gold Leaves Metal'                           , '§6Only matures if there is a §nGold Ore§r§6 or §nBlock of Gold§r§6 below it');
addCrop('blazereed'     , [<ic2:dust:16>, <minecraft:blaze_rod>, <minecraft:blaze_powder>], 6 , 'Fire Blaze Reed Sulfur');
addCrop('corium'        , [<minecraft:leather>]                                           , 6 , 'Cow Silk Vine');
addCrop('stagnium'      , [<ic2:dust:28>]                                                 , 6 , 'Shiny Leaves Metal'                          , '§6Only matures if there is an §nTin Ore§r§6 or §nTin Block§r§6 below it');
addCrop('cyprium'       , [<ic2:dust:19>]                                                 , 6 , 'Copper Leaves Metal'                         , '§6Only matures if there is an §nCopper Ore§r§6 or §nCopper Block§r§6 below it');
addCrop('eatingplant'   , [<minecraft:cactus>, <minecraft:rotten_flesh>]                                            , 6 , 'Bad Food'                                    , '§6Light level of at least 10; Only matures if §nLava§r§6 is below it; Will attack the player if not wearing metal armor and drop §nRotten Flesh');
addCrop('egg_plant'     , [<minecraft:egg>,<minecraft:chicken>,<minecraft:feather>]       , 6 , 'Chicken Egg Edible Feather Flower Addictive');
addCrop('ferru'         , [<ic2:dust:21>]                                                 , 6 , 'Gray Leaves Metal'                           , '§6Only matures if there is an §nIron Ore§r§6 or §nBlock of Iron§r§6 below it');
addCrop('milk_wart'     , [<ic2:crop_res:6>]                                              , 6 , 'Edible Milk Cow');
addCrop('plumbiscus'    , [<ic2:dust:23>]                                                 , 6 , 'Lead Leaves Metal'                           , '§6Only matures if there is an §nLead Ore§r§6 or §nLead Block§r§6 below it');
addCrop('redwheat'      , [<minecraft:redstone>,<minecraft:wheat>]                        , 6 , 'Red Redstone Wheat'                          , '§6Light level between 5 and 10 inclusive; Drops §nRedstone§r§6 only when powered by redstone');
addCrop('shining'       , [<ic2:dust:26>]                                                 , 6 , 'Silver Leaves Metal'                         , '§6Only matures if there is an §nSilver Block§r§6 or §nSilver Ore§r§6 below it');
addCrop('slime_plant'   , [<minecraft:slime_ball>]                                        , 6 , 'Slime Bouncy Sticky Bush');
addCrop('spidernip'     , [<minecraft:string>,<minecraft:web>,<minecraft:spider_eye>]     , 7 , 'Silk Vine Addictive');
addCrop('coffee'        , [<ic2:crop_res>]                                                , 7 , 'Leaves Ingredient Beans'                     , '§6Light level of at least 9');
addCrop('creeper_weed'  , [<minecraft:gunpowder>]                                         , 7 , 'Creeper Vine Explosive Fire Sulfur Saltpeter Coal');
addCrop('meat_rose'     , [<minecraft:dye:9>,<minecraft:chicken>,<minecraft:beef>,<minecraft:porkchop>,<minecraft:fish>] , 7 , 'Edible Flower Cow Fish Chicken Pig');
addCrop('tearstalks'    , [<minecraft:ghast_tear>]                                        , 8 , 'Healing Nether Ingredient Reed Ghast');
addCrop('withereed'     , [<ic2:dust:2>,<minecraft:coal>]                                 , 8 , 'Fire Undead Reed Coal Rotten Wither');
addCrop('oil_berries'   , [<ic2:crop_res:7>]                                              , 9 , 'Fire Dark Reed Rotten Coal Oil');
addCrop('ender_blossom' , [<ic2:dust:31>,<minecraft:ender_pearl>,<minecraft:ender_eye>]   , 10, 'Ender Flower Shiny');
addCrop('bobs_yer_uncle_ranks_berries', [<ic2:crop_res:8>, <minecraft:emerald>]           , 11, 'Shiny Vine Emerald Berylium Crystal');
addCrop('diareed'       , [<ic2:dust:36>,<minecraft:diamond>]                             , 12, 'Fire Shiny Reed Coal Diamond Crystal');

function morphDust(fruit as IItemStack, liquid as ILiquidStack, orePiece as IItemStack, extra as IItemStack, aspects as thaumcraft.aspect.CTAspectStack[]) as void {
  // Remove Oredict entries from dust, because they would be used totally another way
  for ore in fruit.ores {
    ore.remove(fruit);
  }

  if(!isNull(liquid)) {
    // Squeezing fruits
    scripts.process.squeeze([fruit], liquid, 'only: CrushingTub ForestrySqueezer IndustrialSqueezer', extra);

    // Bigger fluid output + capsule
    val amount = (liquid.amount * 2) / 1000;
    val capsule = FluidCell(liquid.name);
    mods.rats.recipes.addChefRatRecipe(fruit, amount > 1 ? capsule * amount : capsule);
  }

  if(!isNull(orePiece)) {
    val output = [orePiece % 100, extra % 20] as WeightedItemStack[];
    mods.forestry.Centrifuge.addRecipe(output, fruit, 10);
    mods.thermalexpansion.Centrifuge.addRecipe(output, fruit, <fluid:juice> * 200, 400);
    scripts.process.squeeze([fruit], <fluid:juice> * 200, 'only: CrushingTub', extra);
  }

  // Thaumcraft aspects
  fruit.setAspects(aspects);
}

// Metals
morphDust(<ic2:dust:20>, null, <exnihilocreatio:item_ore_gold>, <minecraft:glowstone_dust>, [<aspect:desiderium> * 50]); // Tiny Pile of Gold Dust
morphDust(<ic2:dust:28>, null, <exnihilocreatio:item_ore_tin>, <thermalfoundation:material:99>, [<aspect:metallum> * 120]); // Tiny Pile of Tin Dust
morphDust(<ic2:dust:19>, null, <exnihilocreatio:item_ore_copper>, <thermalfoundation:material:99>, [<aspect:metallum> * 120]); // Tiny Pile of Copper Dust
morphDust(<ic2:dust:21>, null, <exnihilocreatio:item_ore_iron>, <thermalfoundation:material:98>, [<aspect:instrumentum> * 95]); // Tiny Pile of Iron Dust
morphDust(<ic2:dust:23>, null, <exnihilocreatio:item_ore_lead>, <thermalfoundation:material:67>, [<aspect:fabrico> * 90]); // Tiny Pile of Lead Dust
morphDust(<ic2:dust:26>, null, <exnihilocreatio:item_ore_silver>, <thermalfoundation:material:97>, [<aspect:machina> * 55]); // Tiny Pile of Silver Dust

// Other
morphDust(<ic2:dust:16>, <liquid:ic2pahoehoe_lava> * 1000, null, <enderio:item_material:22>, [<aspect:desiderium> * 50]); // Sulfur Dust
morphDust(<ic2:dust:2>, <liquid:petrotheum> * 500, null, <actuallyadditions:item_misc:5>, [<aspect:exanimis> * 30]); // Coal Dust
morphDust(<ic2:dust:31>, <liquid:spectre> * 500, null, <biomesoplenty:crystal_shard>, [<aspect:praemunio> * 60]); // Ender Pearl Dust
morphDust(<ic2:dust:36>, <liquid:cryotheum_nak> * 500, null, <enderio:item_material:14>, [<aspect:spiritus> * 50]); // Tiny Pile of Diamond Dust

// Special case for dusts that recipes not stick with oredict
// Coal
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:coal>);
mods.appliedenergistics2.Grinder.removeRecipe(<minecraft:coal_ore>);
mods.mekanism.crusher.removeRecipe(<ic2:dust:2>);
mods.mekanism.enrichment.removeRecipe(<ic2:dust:2>);
mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(<thermalfoundation:material:160>);
mods.nuclearcraft.Melter.removeRecipeWithInput(<ic2:dust:2>);
mods.mekanism.reaction.removeRecipe(<ore:dustSulfur>, <gas:hydrogen>, <ic2:dust:2>);
// Sulfur
furnace.setFuel(<ic2:dust:16>, 0);
mods.mekanism.chemical.oxidizer.removeRecipe(<gas:sulfurdioxide>, <ic2:dust:16>);
mods.mekanism.enrichment.removeRecipe(<ic2:dust:16>);
mods.nuclearcraft.Melter.removeRecipeWithInput(<ic2:dust:16>);
mods.nuclearcraft.Melter.addRecipe(<ore:dustSulfur>, <liquid:sulfur> * 100);

// -----------------------------------------
// Other new recipes for crop res

<ic2:crop_res:5>.setAspects(<aspect:herba> * 20); // Weed
<ic2:crop_res:4>.setAspects(<aspect:herba> * 40, <aspect:victus> * 30); // Hops
<ic2:terra_wart>.setAspects(<aspect:gelum> * 35); // Terra Wart
<ic2:crop_res:6>.setAspects(<aspect:aqua> * 20,<aspect:alkimia> * 40); // Milk Wart
<ic2:crop_res>.setAspects(<aspect:cognitio> * 60); // Coffee Beans
<ic2:crop_res:7>.setAspects(<aspect:motus> * 100); // Oil Berry
<ic2:crop_res:8>.setAspects(Aspect.visum * 20); // Bobs-Yer-Uncle-Ranks Berry
<ic2:crop_res:1>.setAspects(<aspect:cognitio> * 50); // Coffee Powder

// [Biogas Bucket] from [Hops]
scripts.process.squeeze([<ic2:crop_res:4>], <fluid:ic2biogas> * 200, 'only: IndustrialSqueezer');

// [Gelid Cryotheum Bucket] from [Terra Wart]
scripts.process.squeeze([<ic2:terra_wart>], <fluid:cryotheum> * 400, 'only: CrushingTub IndustrialSqueezer');

// [Oil Bucket] from [Oil Berry]
scripts.process.squeeze([<ic2:crop_res:7>], <fluid:oil> * 100, 'only: CrushingTub IndustrialSqueezer');

// [Molten Mirion Bucket] from [Bobs-Yer-Uncle-Ranks Berry]
scripts.process.squeeze([<ic2:crop_res:8>], <fluid:mirion> * 2, 'only: CrushingTub IndustrialSqueezer');

// [HDPE Pellet] from [Milk Wart]
scripts.process.compress(<ic2:crop_res:6>, <mekanism:polyethene>);

// [Heart Dust]*2 from [Heart Dust][+2]
craft.reshapeless(<scalinghealth:heartdust> * 2, 'A▲C', {
  'A': <ore:pestleAndMortar>,     // Pestle and Mortar
  '▲': <scalinghealth:heartdust>, // Heart Dust
  'C': <ic2:crop_res>,            // Coffee Beans
});

// [Emerald Gear] from [Wooden Gear][+1]
craft.remake(<thermalfoundation:material:27>, ['pretty',
  '  B  ',
  'B # B',
  '  B  '], {
  'B': <ic2:crop_res:8>, // Bobs-Yer-Uncle-Ranks Berry
  '#': <ore:gearWood>,   // Wooden Gear
});

// [Quartzburnt] from [Black Quartz Block][+1]
craft.remake(<extrautils2:decorativesolid:7>, ['pretty',
  'O O O',
  'O ⌃ O',
  'O O O'], {
  'O': <ic2:crop_res:7>,      // Oil Berry
  '⌃': <ore:blockQuartzBlack>, // Black Quartz
});

<ic2:resource>.displayName = game.localize('e2ee.tile.unsalted_basalt');

// Semifluid generator usages
function addSemifluidRecipe(fluid as ILiquidStack, eu_t as double) as void {
  scripts.jei.mod.ic2.semifluid(fluid, eu_t);
  mods.ic2.SemiFluidGenerator.addFluid(fluid, eu_t);
}

addSemifluidRecipe(<fluid:biodiesel>, 40);
addSemifluidRecipe(<fluid:biofuel>, 80);
addSemifluidRecipe(<fluid:biocrude>, 256);
addSemifluidRecipe(<fluid:refined_biofuel>, 512);

// Solid Fuel Firebox output Ashes
recipes.addShapeless('firebox_ashes', <forestry:ash>, [<ic2:misc_resource>]);

// Shortcut for AR
// [Lapotron Crystal] from [Advanced Circuit][+1]
scripts.processUtils.avdRockXmlRecipe('Crystallizer', [<ore:circuitAdvanced> * 4], [<fluid:lapis> * 10000], [<ic2:lapotron_crystal> * 4], null);

// [Scaffold]*20 from [Stick][+1]
craft.remake(<ic2:scaffold> * 20, ['pretty',
  '≢ ≢ ≢',
  '  #  ',
  '#   #'], {
  '≢': <ore:plankWood>, // Oak Wood Planks
  '#': <ore:stickWood>, // Stick
});

// Advanced Alloy in other machines
scripts.process.compress(<ic2:ingot>, <ic2:crafting:3>, 'except: Compressor');

// [mining pipe]*64 from [Stone Rod]
craft.remake(<ic2:mining_pipe> * 64, ['pretty',
  '/   /',
  '/   /',
  '/   /'], {
  '/': <ore:stickStone>, // Stone Rod
});

// --------------------------
// Coil rework
// replace IC2 coil with Copper Wires
// --------------------------
recipes.remove(<ic2:crafting:5>);

static copperCoil as IIngredient = <industrialwires:ic2_wire_coil:1>
  .withTag({ wireLength: 9, display: { Lore: ['Length must be 9+'] } }, false)
  .only(function (item) { return item.hasTag && !isNull(item.tag) && !isNull(item.tag.wireLength) && item.tag.wireLength.asInt() >= 9; })
  .transformNew(function (item) {
    if (isNull(item.tag) || isNull(item.tag.wireLength)) return null;
    val len = item.tag.wireLength.asInt();
    if (len <= 9) return null;
    return item.updateTag({ wireLength: len - 9 });
  }) as IIngredient;

// [Coil] for Electric Heater
craft.remake(<ic2:crafting:5> * 5, ['pretty',
  '= = =',
  '- - -',
  '= = ='], {
  '-': <ore:nuggetFakeIron>,
  '=': copperCoil,
});

// [LV-Transformer] from [Copper Wire Coil][+2]
craft.remake(<ic2:te:77>, ['pretty',
  '# T #',
  '# C #',
  '# T #'], {
  '#': <ore:plankWood>, // Zebrawood Wood Planks (Fireproof)
  'T': <ore:itemInsulatedTinCable>, // Insulated Tin Cable
  'C': copperCoil,
});

// [Metal Former] from [Copper Wire Coil][+4]
craft.remake(<ic2:te:55>, ['pretty',
  '  B  ',
  'o C T',
  '  ■  '], {
  'B': <ore:circuitBasic>, // Electronic Circuit
  'o': <ic2:tool_box:*>,   // Tool Box
  'C': copperCoil,
  'T': <ic2:tool_box>,     // Tool Box
  '■': <ore:machineBlockCasing>, // Basic Machine Casing
});

// [Electric Motor] from [Copper Wire Coil][+2]
craft.remake(<ic2:crafting:6>, ['pretty',
  '  ▬  ',
  '⌂ C ⌂',
  '  ▬  '], {
  '▬': <ore:ingotFakeIron>, // Iron Ingot
  '⌂': <ic2:casing:6>,      // Tin Item Casing
  'C': copperCoil,
});

// [Variac®] from [HOP Graphite Ingot][+2]
craft.remake(<industrialwires:panel_component:4>, [
  'R',
  '▬',
  'C'], {
  'R': <ore:itemRubber>,       // Plastic
  '▬': <ore:ingotHOPGraphite>, // HOP Graphite Ingot
  'C': copperCoil,
});

// [Low Voltage Emitter] from [Copper Wire Coil][+3]
craft.remake(<advgenerators:eu_output_lv>, ['pretty',
  '  L  ',
  '◙ C ◙',
  '  R  '], {
  'L': <mekanism:energyupgrade>,
  '◙': <advgenerators:iron_frame>,   // Iron Frame
  'C': copperCoil,
  'R': <advgenerators:iron_wiring>,  // Redstone-Iron Wiring
});
// --------------------------
