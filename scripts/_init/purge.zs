/**
 * @file Remove all items and their OreDicts BEFORE other scripts loads
 * to prevent iterating over purged items
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#priority 3000
#ignoreBracketErrors

import crafttweaker.item.IItemStack;

// Industrial Diamond (Replaced with regular diamond)
Purge(<ic2:crafting:19>).ores();

// Unused dusts
Purge(<ic2:dust:4>).ores();
Purge(<ic2:dust:7>).ores();
Purge(<ic2:dust:10>).ores();
Purge(<ic2:dust:12>).ores();
Purge(<ic2:dust:14>).ores();
Purge(<ic2:dust:17>).ores();
Purge(<ic2:dust:25>).ores();
Purge(<ic2:nuclear:6>);
Purge(<ic2:nuclear:8>);
Purge(<ic2:nuclear:9>);
Purge(<ic2:resource:8>).ores(); // Steel blocks
Purge(<ic2:resource:6>).ores(); // Copper blocks
Purge(<ic2:resource:9>).ores(); // Tin blocks
Purge(<ic2:resource:15>).ores(); // Silver blocks
Purge(<ic2:resource:7>).ores(); // Lead blocks
Purge(<ic2:misc_resource>).ores(); // Ashes
Purge(<ic2:misc_resource:5>).ores(); // Slag
Purge(<openblocks:generic:1>); // Crane ingredient
Purge(<openblocks:generic:2>);
Purge(<openblocks:generic:3>);
Purge(<openblocks:generic:4>);
Purge(<openblocks:generic:5>);
Purge(<openblocks:cursor>);
Purge(<actuallyadditions:item_misc:17>).ores();
Purge(<actuallyadditions:item_food:9>);
Purge(<avaritia:compressed_crafting_table>);
Purge(<avaritia:double_compressed_crafting_table>);
Purge(<avaritia:resource>); // Diamond Lattice

// Purge saltpeter and sulfur
Purge(<bloodmagic:component:24>);
Purge(<bloodmagic:component:23>);

// TC nuggets
for i in 0 .. 5 {
  Purge(<thaumcraft:nugget>.definition.makeStack(i)).ores();
}

// *======= Metal Nuggets =======*

Purge(<immersiveengineering:metal:29>).ores();
Purge(<immersiveengineering:metal:20>).ores();
Purge(<immersiveengineering:metal:21>).ores();
Purge(<immersiveengineering:metal:22>).ores();
Purge(<immersiveengineering:metal:23>).ores();
Purge(<immersiveengineering:metal:24>).ores();
Purge(<immersiveengineering:metal:26>).ores();
Purge(<immersiveengineering:metal:27>).ores();
Purge(<immersiveengineering:metal:28>).ores();
Purge(<extendedcrafting:material:128>).ores();
Purge(<extendedcrafting:material:129>).ores();
Purge(<opencomputers:material:29>).ores(); // Diamond nugget
Purge(<opencomputers:material>);

// Remove Refined storage cables
if (isNull(loadedMods['refinedstorage'])) {
  Purge(<immersivecables:coil_block:3>);
  Purge(<immersivecables:wire_coil:3>);
}

/* Inject_js(
(getUnchangedFurnaceRecipes()??[])
.filter((r) => isJEIBlacklisted(r.in_id, r.in_meta) && !isPurged(r.input))
.map(({output,input})=>[`furnace.remove(${output}`,`, ${input});`])
) */
furnace.remove(<appliedenergistics2:material:5>      , <actuallyadditions:item_dust:5>);
furnace.remove(<biomesoplenty:gem:7>                 , <biomesoplenty:gem_ore:7>);
furnace.remove(<contenttweaker:item_ore_tungsten:3>  , <contenttweaker:item_ore_tungsten:1>);
furnace.remove(<contenttweaker:item_ore_tungsten:3>  , <contenttweaker:item_ore_tungsten:2>);
furnace.remove(<appliedenergistics2:material:5>      , <enderio:item_material:33>);
furnace.remove(<exnihilocreatio:item_ore_aluminium:3>, <exnihilocreatio:item_ore_aluminium:1>);
furnace.remove(<tconstruct:ingots:1>                 , <exnihilocreatio:item_ore_ardite:1>);
furnace.remove(<tconstruct:ingots>                   , <exnihilocreatio:item_ore_cobalt:1>);
furnace.remove(<exnihilocreatio:item_ore_copper:3>   , <exnihilocreatio:item_ore_copper:1>);
furnace.remove(<minecraft:gold_ingot>                , <exnihilocreatio:item_ore_gold:1>);
furnace.remove(<minecraft:iron_ingot>                , <exnihilocreatio:item_ore_iron:1>);
furnace.remove(<exnihilocreatio:item_ore_lead:3>     , <exnihilocreatio:item_ore_lead:1>);
furnace.remove(<exnihilocreatio:item_ore_nickel:3>   , <exnihilocreatio:item_ore_nickel:1>);
furnace.remove(<exnihilocreatio:item_ore_silver:3>   , <exnihilocreatio:item_ore_silver:1>);
furnace.remove(<exnihilocreatio:item_ore_tin:3>      , <exnihilocreatio:item_ore_tin:1>);
furnace.remove(<thermalfoundation:material:128>      , <forestry:resources:1>);
furnace.remove(<thermalfoundation:material:129>      , <forestry:resources:2>);
furnace.remove(<ic2:ingot:2>                         , <ic2:dust:4>);
furnace.remove(<minecraft:gold_ingot>                , <ic2:dust:7>);
furnace.remove(<minecraft:iron_ingot>                , <ic2:dust:8>);
furnace.remove(<ic2:ingot:3>                         , <ic2:dust:10>);
furnace.remove(<ic2:ingot:4>                         , <ic2:dust:14>);
furnace.remove(<ic2:ingot:6>                         , <ic2:dust:17>);
furnace.remove(<ic2:ingot:1>                         , <ic2:dust>);
furnace.remove(<ic2:ingot:2>                         , <ic2:resource:1>);
furnace.remove(<ic2:ingot:3>                         , <ic2:resource:2>);
furnace.remove(<ic2:ingot:6>                         , <ic2:resource:3>);
furnace.remove(<immersiveengineering:metal:5>        , <ic2:resource:4>);
furnace.remove(<iceandfire:sapphire_gem>             , <iceandfire:sapphire_ore:*>);
furnace.remove(<iceandfire:silver_ingot>             , <iceandfire:silver_ore:*>);
furnace.remove(<immersiveengineering:metal>          , <immersiveengineering:metal:9>);
furnace.remove(<immersiveengineering:metal:1>        , <immersiveengineering:metal:10>);
furnace.remove(<immersiveengineering:metal:2>        , <immersiveengineering:metal:11>);
furnace.remove(<immersiveengineering:metal:3>        , <immersiveengineering:metal:12>);
furnace.remove(<immersiveengineering:metal:4>        , <immersiveengineering:metal:13>);
furnace.remove(<immersiveengineering:metal:6>        , <immersiveengineering:metal:15>);
furnace.remove(<immersiveengineering:metal:7>        , <immersiveengineering:metal:16>);
furnace.remove(<immersiveengineering:metal:8>        , <immersiveengineering:metal:17>);
furnace.remove(<minecraft:iron_ingot>                , <immersiveengineering:metal:18>);
furnace.remove(<minecraft:gold_ingot>                , <immersiveengineering:metal:19>);
furnace.remove(<immersiveengineering:metal:1>        , <immersiveengineering:ore:1>);
furnace.remove(<immersiveengineering:metal:2>        , <immersiveengineering:ore:2>);
furnace.remove(<immersiveengineering:metal:3>        , <immersiveengineering:ore:3>);
furnace.remove(<immersiveengineering:metal:4>        , <immersiveengineering:ore:4>);
furnace.remove(<immersiveengineering:metal>          , <immersiveengineering:ore>);
furnace.remove(<nuclearcraft:ingot:5>                , <jaopca:item_hunkboron>);
furnace.remove(<nuclearcraft:ingot:6>                , <jaopca:item_hunklithium>);
furnace.remove(<nuclearcraft:ingot:7>                , <jaopca:item_hunkmagnesium>);
furnace.remove(<nuclearcraft:ingot:3>                , <jaopca:item_hunkthorium>);
furnace.remove(<immersiveengineering:metal:5>        , <jaopca:item_hunkuranium>);
furnace.remove(<minecraft:gold_ingot> * 3            , <thaumicwonders:eldritch_cluster:1>);
furnace.remove(<ic2:ingot:2> * 3                     , <thaumicwonders:eldritch_cluster:2>);
furnace.remove(<ic2:ingot:6> * 3                     , <thaumicwonders:eldritch_cluster:3>);
furnace.remove(<ic2:ingot:4> * 3                     , <thaumicwonders:eldritch_cluster:4>);
furnace.remove(<ic2:ingot:3> * 3                     , <thaumicwonders:eldritch_cluster:5>);
furnace.remove(<thaumcraft:quicksilver> * 3          , <thaumicwonders:eldritch_cluster:6>);
furnace.remove(<minecraft:quartz> * 3                , <thaumicwonders:eldritch_cluster:7>);
furnace.remove(<thaumcraft:ingot:1> * 2              , <thaumicwonders:eldritch_cluster:8>);
furnace.remove(<minecraft:iron_ingot> * 3            , <thaumicwonders:eldritch_cluster>);
/**/

// *======= Metal Blocks =======*
recipes.remove(<mekanism:basicblock:12>);
recipes.remove(<mekanism:basicblock:1>);
recipes.remove(<mekanism:basicblock:3>);
recipes.remove(<mekanism:basicblock:5>);
recipes.remove(<mekanism:basicblock:13>);
recipes.remove(<forestry:resource_storage:3>);
recipes.remove(<forestry:resource_storage:1>);
recipes.remove(<forestry:resource_storage:2>);
recipes.remove(<tcomplement:storage>);
recipes.remove(<immersiveengineering:stone_decoration:3>);
recipes.remove(<immersiveengineering:storage>);
recipes.remove(<immersiveengineering:storage:1>);
recipes.remove(<immersiveengineering:storage:2>);
recipes.remove(<immersiveengineering:storage:3>);
recipes.remove(<immersiveengineering:storage:4>);
recipes.remove(<immersiveengineering:storage:7>);
recipes.remove(<immersiveengineering:storage:8>);
recipes.remove(<ic2:ingot:2>);
recipes.remove(<ic2:ingot:3>);
recipes.remove(<ic2:ingot:4>);
recipes.remove(<ic2:ingot:5>);
recipes.remove(<ic2:ingot:6>);
Purge(<ic2:resource:5>).ores(); // Bronze
Purge(<ic2:ingot:1>).furn().ores();
Purge(<ic2:ingot:8>).ores();
Purge(<ic2:ingot:3>).furn().ores();
// *============================*

Purge(<contenttweaker:item_ore_tungsten:1>).ores();
Purge(<contenttweaker:item_ore_tungsten:2>).ores();
Purge(<contenttweaker:item_ore_tungsten:3>).furn().ores();
Purge(<jaopca:block_blocktungsten>).ores();
Purge(<jaopca:item_nuggettungsten>).ores();
Purge(<enderio:item_owl_egg>);
Purge(<thermalfoundation:material:656>);
Purge(<ae2stuff:visualiser>);
Purge(<itemfilters:filter>);
Purge(<excompressum:ore_smasher>);
Purge(<forestry:gear_bronze>).ores();
Purge(<forestry:gear_copper>).ores();
Purge(<forestry:gear_tin>).ores();
Purge(<forestry:capsule>);
Purge(<forestry:can>);
Purge(<forestry:refractory>);
Purge(<appliedenergistics2:material:40>).ores();
Purge(<mysticalagriculture:chunk>);
Purge(<mysticalagriculture:chunk:1>);
Purge(<mysticalagriculture:chunk:2>);
Purge(<mysticalagriculture:chunk:3>);
Purge(<mysticalagriculture:chunk:4>);
Purge(<mysticalagradditions:insanium:4>);
Purge(<mysticalagradditions:stuff:69>);
Purge(<immersiveengineering:ore:1>).ores();
Purge(<qmd:ingot:3>).ores(); // Titanium Ingot
Purge(<betteranimalsplus:cheese>);

// Pams replacements
Purge(<harvestcraft:chilipepperitem>).ores();
Purge(<harvestcraft:chilipepperseeditem>).ores();
Purge(<harvestcraft:coffeebeanitem>).ores();
Purge(<harvestcraft:coffeeseeditem>).ores();
Purge(<harvestcraft:grapeitem>).ores();
Purge(<harvestcraft:grapeseeditem>).ores();
Purge(<harvestcraft:olive_sapling>).ores();
Purge(<harvestcraft:oliveitem>).ores();
Purge(<harvestcraft:pamolive>).ores();
Purge(<harvestcraft:tomatoitem>).ores();
Purge(<harvestcraft:tomatoseeditem>).ores();
Purge(<harvestcraft:beanseeditem>).ores();
Purge(<harvestcraft:beanitem>).ores();
Purge(<harvestcraft:riceseeditem>).ores();
Purge(<harvestcraft:riceitem>).ores();
Purge(<harvestcraft:cocoapowderitem>).ores();
Purge(<harvestcraft:chocolatebaritem>).ores();

Purge(<thaumicwonders:eldritch_cluster:0>);
Purge(<thaumicwonders:eldritch_cluster:1>);
Purge(<thaumicwonders:eldritch_cluster:2>);
Purge(<thaumicwonders:eldritch_cluster:3>);
Purge(<thaumicwonders:eldritch_cluster:4>);
Purge(<thaumicwonders:eldritch_cluster:5>);
Purge(<thaumicwonders:eldritch_cluster:6>);
Purge(<thaumicwonders:eldritch_cluster:7>);
Purge(<thaumicwonders:eldritch_cluster:8>);

// Gears
val gearsToRemove = [
  <thermalfoundation:material:22>,
  <thermalfoundation:material:23>,
  <thermalfoundation:material:24>,
  <thermalfoundation:material:25>,
  <thermalfoundation:material:26>,
  <thermalfoundation:material:27>,
  <thermalfoundation:material:256>,
  <thermalfoundation:material:257>,
  <thermalfoundation:material:258>,
  <thermalfoundation:material:259>,
  <thermalfoundation:material:260>,
  <thermalfoundation:material:261>,
  <thermalfoundation:material:262>,
  <thermalfoundation:material:263>,
  <thermalfoundation:material:264>,
  <thermalfoundation:material:288>,
  <thermalfoundation:material:289>,
  <thermalfoundation:material:290>,
  <thermalfoundation:material:291>,
  <thermalfoundation:material:292>,
  <thermalfoundation:material:293>,
  <thermalfoundation:material:294>,
  <thermalfoundation:material:295>,
  <redstonearsenal:material:96>,
  <jaopca:item_geardraconium>,
] as IItemStack[];

for items in gearsToRemove {
  recipes.remove(items);
}
