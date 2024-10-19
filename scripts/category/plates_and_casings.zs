#modloaded immersiveengineering ic2
#ignoreBracketErrors

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

import mods.immersiveengineering.MetalPress;

static anyHammer as IIngredient = <immersiveengineering:tool> | <ic2:forge_hammer>.anyDamage();

// *======= Metal Plates =======*
val platesData = {
  Iron        : <thermalfoundation:material:32>,
  Gold        : <thermalfoundation:material:33>,
  Uranium     : <immersiveengineering:metal:35>,
  ElectrumFlux: <redstonearsenal:material:128>,
  Copper      : <thermalfoundation:material:320>,
  Tin         : <thermalfoundation:material:321>,
  Silver      : <thermalfoundation:material:322>,
  Lead        : <thermalfoundation:material:323>,
  Aluminum    : <thermalfoundation:material:324>,
  Nickel      : <thermalfoundation:material:325>,
  Platinum    : <thermalfoundation:material:326>,
  Iridium     : <thermalfoundation:material:327>,
  Mithril     : <thermalfoundation:material:328>,
  Steel       : <thermalfoundation:material:352>,
  Electrum    : <thermalfoundation:material:353>,
  Invar       : <thermalfoundation:material:354>,
  Bronze      : <thermalfoundation:material:355>,
  Constantan  : <thermalfoundation:material:356>,
  Signalum    : <thermalfoundation:material:357>,
  Lumium      : <thermalfoundation:material:358>,
  Enderium    : <thermalfoundation:material:359>,
  Brass       : <thaumcraft:plate>,
  Thaumium    : <thaumcraft:plate:2>,
  Void        : <thaumcraft:plate:3>,
  Mithrillium : <thaumadditions:mithrillium_plate>,
  Adaminite   : <thaumadditions:adaminite_plate>,
  Mithminite  : <thaumadditions:mithminite_plate>,
  Silicon     : <libvulpes:productplate:3>,
} as IItemStack[string];

for oreName, plate in platesData {
  if(isNull(plate)) continue;
  recipes.remove(plate);
  val ingot = oreDict['ingot' ~ oreName];
  recipes.addShapeless('plate EngHammer ' ~ oreName, plate, [ingot, ingot, anyHammer]);

  if (plate.definition.id.matches('(thermalfoundation|immersiveengineering).*'))
    MetalPress.addRecipe(plate, ingot, <immersiveengineering:mold>, 125, 1);
}

Purge(<ic2:plate>).ores([<ore:plateBronze>]);
Purge(<ic2:plate:1>).ores([<ore:plateCopper>]);
Purge(<ic2:plate:2>).ores([<ore:plateGold>]);
Purge(<ic2:plate:3>).ores([<ore:plateIron>]);
Purge(<ic2:plate:5>).ores([<ore:plateLead>]);
Purge(<ic2:plate:7>).ores([<ore:plateSteel>]);
Purge(<ic2:plate:8>).ores([<ore:plateTin>]);
Purge(<thaumcraft:plate:1>).ores([<ore:plateIron>]);

for plate, ores in {
  <immersiveengineering:metal:30>: [<ore:plateCopper>],
  <immersiveengineering:metal:31>: [<ore:plateAluminum>, <ore:plateAluminium>],
  <immersiveengineering:metal:32>: [<ore:plateLead>],
  <immersiveengineering:metal:33>: [<ore:plateSilver>],
  <immersiveengineering:metal:34>: [<ore:plateNickel>],
  <immersiveengineering:metal:36>: [<ore:plateConstantan>],
  <immersiveengineering:metal:37>: [<ore:plateElectrum>],
  <immersiveengineering:metal:38>: [<ore:plateSteel>],
  <immersiveengineering:metal:39>: [<ore:plateIron>],
  <immersiveengineering:metal:40>: [<ore:plateGold>],
} as IOreDictEntry[][IItemStack] {
  mods.immersiveengineering.MetalPress.removeRecipe(plate);
  Purge(plate).ores(ores);
}

recipes.addShapeless('steel_casing_with_tool', <ic2:casing:5> * 2, [<ore:plateSteel>, anyHammer]);

MetalPress.addRecipe(<ic2:casing:0> * 2, <ore:plateBronze>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:1> * 2, <ore:plateCopper>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:2> * 2, <ore:plateGold>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:3> * 2, <ore:plateIron>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:4> * 2, <ore:plateLead>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:5> * 2, <ore:plateSteel>, <immersiveengineering:mold>, 125, 1);
MetalPress.addRecipe(<ic2:casing:6> * 2, <ore:plateTin>, <immersiveengineering:mold>, 125, 1);
