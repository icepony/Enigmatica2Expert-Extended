#priority 950
#modloaded bloodmagic

import mods.requious.AssemblyRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val x = <assembly:meteor>;
x.addJEICatalyst(<bloodmagic:ritual_diviner:1>.withTag({ current_ritual: 'meteor' }));
x.setJEIDurationSlot(1, 1, 'duration', scripts.jei.requious.getVisGauge(1, 8));
x.setJEIItemSlot (0, 1, 'f0');
x.setJEIFluidSlot(0, 0, 'f1');

static meteors as string[][] = [
/* Inject_js(
glob.sync('config/bloodmagic/meteors/*.json')
.map(loadJson)
.map(f=>
  [
  `${f.catalystStack.registryName.domain}:${f.catalystStack.registryName.path}`,
  f.catalystStack.meta,
  f.cost,
  ...f.components.map(c=>c.oreName)
  ]
  .map(s=>`'${s}'`).join(', ')
).map(s=>`  [${s}],`).sort(naturalSort).join('\n')
) */
  ['jaopca:block_blockdilithium', '0', '2000000', 'oreEndDilithium', 'oreClathrateRedstone', 'oreClathrateEnder', 'oreClathrateGlowstone'],
  ['minecraft:emerald_block', '0', '1400000', 'oreLapis', 'oreDiamond', 'oreCoal', 'oreRuby', 'orePeridot', 'oreTopaz', 'oreTanzanite', 'oreMalachite', 'oreSapphire', 'oreAmber', 'oreApatite', 'oreCertusQuartz', 'oreCinnabar', 'oreProsperity', 'oreQuartzBlack'],
  ['minecraft:iron_block', '0', '600000', 'oreIron', 'oreCopper', 'oreTin', 'oreSilver', 'oreLead', 'oreGold', 'oreLapis', 'oreRedstone', 'oreAluminum'],
  ['nuclearcraft:ingot_block', '3', '1100000', 'oreThorium', 'oreBoron', 'oreLithium', 'oreMagnesium'],
  ['tconstruct:metal', '1', '1700000', 'oreQuartz', 'oreNetherAluminum', 'oreNetherCopper', 'oreNetherLead', 'oreNetherNickel', 'oreNetherRedstone', 'oreNetherLapis', 'oreNetherIron', 'oreNetherGold', 'oreNetherDiamond', 'oreNetherCoal', 'oreNetherPlatinum', 'oreNetherSilver', 'oreNetherTin', 'oreNetherCertusQuartz', 'oreNetherChargedCertusQuartz', 'oreNetherOsmium', 'oreNetherUranium', 'oreCobalt', 'oreArdite'],
  ['thermalfoundation:storage', '7', '1000000', 'oreDraconium', 'oreAstralStarmetal', 'oreRutile', 'oreMithril', 'orePlatinum', 'oreIridium', 'mica'],
/**/
];

var k = 0;
var maxRows = 0;
for t in meteors { if (t.length > maxRows) maxRows = t.length; }
for _y in 0 .. (maxRows - 4) / 7 + 1 {
  for _x in 2 .. 9 {
    x.setJEIItemSlot(_x, _y, 'i' ~ k);
    k += 1;
  }
}

for i, meteor in meteors {
  val meteorAss = AssemblyRecipe.create(function (container) {
    for i, ore in meteor {
      if (i < 3) continue;
      container.addItemOutput('i' ~ (i - 3), oreDict.get(ore).firstItem);
    }
  });
  meteorAss.requireItem('f0', itemUtils.getItem(meteor[0], meteor[1]));
  meteorAss.requireFluid('f1', <fluid:lifeessence> * (meteor[2] as int));
  x.addJEIRecipe(meteorAss);
}
