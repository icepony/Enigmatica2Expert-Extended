#priority 950
#modloaded bloodmagic

import mods.requious.AssemblyRecipe;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val x = <assembly:meteor>;
x.addJEICatalyst(<bloodmagic:ritual_diviner:1>.withTag({ current_ritual: 'meteor' }));
x.setJEIDurationSlot(1, 1, 'duration', scripts.jei.requious.getVisGauge(1, 8));
x.setJEIItemSlot (0, 1, 'f0');
x.setJEIFluidSlot(0, 0, 'f1');

var k = 0;
for _y in 0 .. 3 {
  for _x in 2 .. 9 {
    x.setJEIItemSlot(_x, _y, 'output');
    k += 1;
  }
}

/* Inject_js(
glob.sync('config/bloodmagic/meteors/*.json')
.map(loadJson)
.map((f) => {
  const weightName = f.components
    .map(c => [c.weight, c.oreName])
    .sort(([a], [b]) => b - a)
  const volume = 4.0 / 3.0 * Math.PI * (0.2 + f.radius) ** 3
  const totalWeight = weightName.reduce((acc, [w]) => acc + w, 0)
  return [
    `addMeteor(`,
    `<${f.catalystStack.registryName.domain}:${f.catalystStack.registryName.path}:${f.catalystStack.meta}>`,
    `, `,
    f.cost,
    `, [`,
    `${
      weightName
      .map(([weight, name]) => `<ore:${name}> * ${weight / totalWeight * volume | 0}`)
      .join(', ')
    }]);`,
  ]
}).sort((a, b) => b[2] - a[2])
) */
addMeteor(<jaopca:block_blockdilithium:0> , 1000000, [<ore:sandOxidisedFerric> * 147, <ore:oreEndDilithium> * 73, <ore:oreClathrateRedstone> * 29, <ore:oreClathrateEnder> * 29, <ore:oreClathrateGlowstone> * 29]);
addMeteor(<tconstruct:metal:1>            , 850000 , [<ore:oreCobalt> * 62, <ore:oreArdite> * 62, <ore:oreQuartz> * 55, <ore:oreNetherCoal> * 48, <ore:oreNetherRedstone> * 40, <ore:oreNetherLapis> * 37, <ore:oreNetherIron> * 33, <ore:oreNetherGold> * 29, <ore:oreNetherTin> * 25, <ore:oreNetherAluminum> * 22, <ore:oreNetherCopper> * 22, <ore:oreNetherLead> * 22, <ore:oreNetherDiamond> * 22, <ore:oreNetherNickel> * 18, <ore:oreNetherSilver> * 18, <ore:oreNetherCertusQuartz> * 18, <ore:oreNetherChargedCertusQuartz> * 14, <ore:oreNetherPlatinum> * 11, <ore:oreNetherOsmium> * 11, <ore:oreNetherUranium> * 11]);
addMeteor(<minecraft:emerald_block:0>     , 700000 , [<ore:oreAmber> * 25, <ore:oreDiamond> * 20, <ore:oreLapis> * 18, <ore:oreCertusQuartz> * 18, <ore:oreCinnabar> * 14, <ore:oreProsperity> * 11, <ore:oreCoal> * 3, <ore:oreRuby> * 3, <ore:orePeridot> * 3, <ore:oreTopaz> * 3, <ore:oreTanzanite> * 3, <ore:oreMalachite> * 3, <ore:oreSapphire> * 3, <ore:oreApatite> * 3, <ore:oreQuartzBlack> * 3]);
addMeteor(<immersiveengineering:storage:5>, 550000 , [<ore:oreBoron> * 108, <ore:oreThorium> * 93, <ore:oreLithium> * 62, <ore:oreMagnesium> * 46]);
addMeteor(<thermalfoundation:storage:7>   , 500000 , [<ore:mica> * 196, <ore:oreIridium> * 130, <ore:orePlatinum> * 91, <ore:oreMithril> * 65, <ore:oreRutile> * 45, <ore:oreAstralStarmetal> * 32, <ore:oreDraconium> * 26]);
addMeteor(<minecraft:iron_block:0>        , 300000 , [<ore:oreIron> * 529, <ore:oreCopper> * 264, <ore:oreTin> * 185, <ore:oreRedstone> * 132, <ore:oreAluminum> * 132, <ore:oreLead> * 105, <ore:oreSilver> * 92, <ore:oreLapis> * 79, <ore:oreGold> * 39]);
/**/

function addMeteor(catalyst as IItemStack, cost as int, oreList as IIngredient[]) as void {
  val ass = AssemblyRecipe.create(function (container) {
    for ore in oreList {
      container.addItemOutput('output', ore.items[0] * ore.amount);
    }
  });
  ass.requireItem('f0', catalyst);
  ass.requireFluid('f1', <fluid:lifeessence> * cost);
  <assembly:meteor>.addJEIRecipe(ass);
}
