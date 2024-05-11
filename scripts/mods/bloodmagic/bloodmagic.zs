#modloaded bloodmagic

import crafttweaker.item.IItemStack;

// Blood Orb Oredicts
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:weak' }));
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:apprentice' }));
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:magician' }));
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:master' }));
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }));
<ore:orbTier1>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:apprentice' }));
<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:magician' }));
<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:master' }));
<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }));
<ore:orbTier2>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:magician' }));
<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:master' }));
<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }));
<ore:orbTier3>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:master' }));
<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }));
<ore:orbTier4>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

<ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }));
<ore:orbTier5>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

<ore:orbTier6>.add(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:transcendent' }));

// Blood Magic Guide
recipes.addShapeless('Blood Magic Guide',
  <guideapi:bloodmagic-guide>,
  [<minecraft:book>, <bloodmagic:soul_snare>]);

// Alt recipes for non-tech players
for i, ingr in [
  <thaumcraft:stone_ancient_glyphed>,
  <extrautils2:decorativesolid:3>,
] as IItemStack[] {
  // Rune of Speed
  recipes.remove(<bloodmagic:blood_rune:1>);
  recipes.addShaped('Rune of Speed ' ~ i, <bloodmagic:blood_rune:1>,
    [[ingr, <bloodmagic:slate>, ingr],
      [<bloodmagic:blood_rune>, <ore:foodCake>, <bloodmagic:blood_rune>],
      [ingr, <bloodmagic:slate>, ingr]]);

  // Rune of Sacrifice
  recipes.remove(<bloodmagic:blood_rune:3>);
  recipes.addShaped('Rune of Sacrifice ' ~ i, <bloodmagic:blood_rune:3> * 3,
    [[ingr, <bloodmagic:slate:1>, ingr],
      [<bloodmagic:slate:1>, utils.reuse(<ore:orbTier2>), <bloodmagic:slate:1>],
      [ingr, <astralsorcery:itemcrystalsword:*>.withTag({ astralsorcery: {} }), ingr]]);

  // Imperfect Ritual Stone
  recipes.remove(<bloodmagic:ritual_controller:1>);
  recipes.addShaped('Imperfect Ritual Stone ' ~ i, <bloodmagic:ritual_controller:1>,
    [[<ore:obsidian>, ingr, <ore:obsidian>],
      [ingr, utils.reuse(<ore:orbTier1>), ingr],
      [<ore:obsidian>, ingr, <ore:obsidian>]]);
}

// [Rune of Capacity] from [Blank Rune][+3]
craft.remake(<bloodmagic:blood_rune:6>, ['pretty',
  'M F M',
  'F B F',
  'M I M'], {
  'M': <ore:stoneMetamorphic>, // Metamorphic Forest Stone
  'F': <flopper:flopper>, // Flopper
  'B': <bloodmagic:blood_rune>, // Blank Rune
  'I': <bloodmagic:slate:2>, // Imbued Slate
});

// Rune of the orb
recipes.remove(<bloodmagic:blood_rune:8>);
recipes.addShaped('Rune of the Orb', <bloodmagic:blood_rune:8>,
  [[<bloodmagic:slate:1>, utils.reuse(<ore:orbTier1>), <bloodmagic:slate:1>],
    [<bloodmagic:slate:2>, utils.reuse(<ore:orbTier4>), <bloodmagic:slate:2>],
    [<bloodmagic:slate:3>, utils.reuse(<ore:orbTier1>), <bloodmagic:slate:3>]]);

// Rune of acceleration
recipes.remove(<bloodmagic:blood_rune:9>);
recipes.addShaped('Rune of Acceleration', <bloodmagic:blood_rune:9>,
  [[<bloodmagic:blood_tank>, <bloodmagic:slate:3>, <bloodmagic:blood_tank>],
    [<ore:ingotGold>, <actuallyadditions:item_drill_upgrade_speed_ii>, <minecraft:gold_ingot>],
    [<bloodmagic:blood_tank>, utils.reuse(<ore:orbTier4>), <bloodmagic:blood_tank>]]);

// Ritual Stone
recipes.remove(<bloodmagic:ritual_stone>);
recipes.addShaped('Ritual Stone', <bloodmagic:ritual_stone> * 4,
  [[<thaumcraft:salis_mundus>, <bloodmagic:slate:1>, <thaumcraft:salis_mundus>],
    [<bloodmagic:slate:1>, utils.reuse(<ore:orbTier2>), <bloodmagic:slate:1>],
    [<ore:obsidian>, <bloodmagic:slate:1>, <ore:obsidian>]]);

// Hellfire Forge
recipes.remove(<bloodmagic:soul_forge>);
recipes.addShaped('Hellfire Forge', <bloodmagic:soul_forge>,
  [[<ore:nuggetQuartz>, <ore:dustAstralStarmetal>, <ore:nuggetQuartz>],
    [<thaumcraft:stone_arcane>, <ore:ingotBrass>, <thaumcraft:stone_arcane>],
    [<thaumcraft:stone_arcane>, <botania:storage>, <thaumcraft:stone_arcane>]]);

// Blood Altar
recipes.remove(<bloodmagic:altar>);
recipes.addShaped('Blood Altar', <bloodmagic:altar>,
  [[<ore:livingrock>, <astralsorcery:itemcraftingcomponent:3>, <ore:livingrock>],
    [<ore:plateBrass>, <minecraft:furnace>, <ore:plateBrass>],
    [<thaumcraft:stone_arcane>, <bloodmagic:monster_soul>, <thaumcraft:stone_arcane>]]);

// Blood Letter's Pack
recipes.remove(<bloodmagic:pack_self_sacrifice>);
recipes.addShaped("Blood Letter's Pack", <bloodmagic:pack_self_sacrifice>,
  [[<botania:managlass>, <botania:bloodpendant>, <botania:managlass>],
    [<minecraft:flint>, <minecraft:leather_chestplate>.anyDamage(), <minecraft:flint>],
    [<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);

// Coat of Arms
recipes.remove(<bloodmagic:pack_sacrifice>);
recipes.addShaped('Coat of Arms', <bloodmagic:pack_sacrifice>,
  [[<botania:managlass>, <minecraft:bucket>, <botania:managlass>],
    [<thermalfoundation:material:354>, <minecraft:leather_chestplate>, <thermalfoundation:material:354>],
    [<botania:managlass>, <bloodmagic:slate>, <botania:managlass>]]);

// Sacrificial Dagger
recipes.remove(<bloodmagic:sacrificial_dagger>);
recipes.addShaped('Sacrificial Dagger', <bloodmagic:sacrificial_dagger>,
  [[<botania:managlass>, <botania:managlass>, <botania:managlass>],
    [null, <thaumcraft:ingot:2>, <botania:managlass>],
    [<botania:enderdagger>.anyDamage(), null, <botania:managlass>]]);

// Rudimentary Snare
recipes.remove(<bloodmagic:soul_snare>);
recipes.addShaped('Rudimentary Snare', <bloodmagic:soul_snare> * 8,
  [[<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>],
    [<ore:ingotManasteel>, <ore:redstoneRoot>, <ore:ingotManasteel>],
    [<thaumcraft:fabric>, <ore:ingotManasteel>, <thaumcraft:fabric>]]);

// Blank Slate
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:stone>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>, <botania:livingrock>, 0, 1000, 10, 10);

// Orb tier 1
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:diamond>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:weak' }),
  <botania:manaresource:2>, 0, 2000, 12, 12);

// Orb tier 2
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:redstone_block>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:apprentice' }),
  <thaumcraft:crystal_essence>.withTag({ Aspects: [{ amount: 1, key: 'victus' }] }), 1, 5000, 25, 25);

// Orb tier 3
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:gold_block>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:magician' }),
  <thaumcraft:metal_thaumium>, 2, 25000, 50, 50);

// Orb tier 5
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:nether_star>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({ orb: 'bloodmagic:archmage' }),
  <botania:manaresource:5>, 4, 80000, 200, 200);

// Dagger of Sacrifice
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:iron_sword>);
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:dagger_of_sacrifice>,
  <thaumcraft:thaumium_sword>, 1, 3000, 12, 12);

// Remake recipe of blood tanks

// [Blood Tank Tier 1] from [Glass][+2]
craft.remake(<bloodmagic:blood_tank>, ['B', '■', 'A'], {
  'B': <bloodmagic:slate>, // Blank Slate
  '■': <ore:blockGlass>, // Glass
  'A': <thaumcraft:stone_arcane>, // Arcane Stone
});

recipes.addShapeless('Clearing Blood Tank 0', <bloodmagic:blood_tank>, [<bloodmagic:blood_tank>]);
for i in 1 .. 16 {
  val tank = itemUtils.getItem('bloodmagic:blood_tank', i);
  val prevTank = itemUtils.getItem('bloodmagic:blood_tank', i - 1);

  val t16cost = 2000000.0; // Change only this number

  val t16powr = pow(1.5, 15);
  val t16mult = t16cost / t16powr;
  val t1resde = (15 - i) * (t16cost / 6000);

  val cost = (((pow(1.5, i as double) * t16mult) as int - t1resde) / 500) * 500;

  recipes.remove(tank);
  mods.bloodmagic.BloodAltar.addRecipe(tank, prevTank, max(0, min(4, i / 2)), cost, 10 + 10 * i, 10 + 10 * i);
  recipes.addShapeless('Clearing Blood Tank ' ~ i, tank, [tank]);
}

// Creative Dagger
val crDgr = <bloodmagic:sacrificial_dagger:1>.withTag({ HideFlags: 1 } + <enchantment:enderio:shimmer>.makeEnchantment(1).makeTag());
mods.jei.JEI.addItem(crDgr);

val capRune = <bloodmagic:blood_rune:7>;
val sprIng = <randomthings:ingredient:3>;
val bldTnk = <bloodmagic:blood_tank:7>.withTag({ Fluid: { FluidName: 'lifeessence', Amount: 2048000 } });
val antBck = Bucket('blockfluidantimatter');
mods.extendedcrafting.TableCrafting.addShaped(0, crDgr, [
  [null, null, null, null, null, <ore:nuggetDraconicMetal>, sprIng],
  [null, null, null, null, <ore:nuggetDraconicMetal>, sprIng, <ore:nuggetDraconicMetal>],
  [null, capRune, null, <ore:nuggetDraconicMetal>, sprIng, <ore:nuggetDraconicMetal>, null],
  [null, capRune, <bloodmagic:slate:4>, <bloodmagic:sacrificial_dagger>, <ore:nuggetDraconicMetal>, null, null],
  [null, capRune, bldTnk, <bloodmagic:slate:4>, null, null, null],
  [antBck, <animus:sigil_consumption>, capRune, capRune, capRune, null, null],
  [<ore:gemBenitoite>, antBck, null, null, null, null, null],
]);

// Remove weak saltpater recipe
mods.bloodmagic.AlchemyTable.removeRecipe([<bloodmagic:component:22>, <bloodmagic:component:22>, <thermalfoundation:material:768>]);

// Remove coal dupe recipe
mods.bloodmagic.AlchemyTable.removeRecipe([<minecraft:coal>, <minecraft:coal>, <minecraft:flint>]);

// Remove unused recipes
val alcTableOres = [
  <actuallyadditions:block_misc:3>,
  <appliedenergistics2:charged_quartz_ore>,
  <appliedenergistics2:quartz_ore>,
  <astralsorcery:blockcustomore:1>,
  <astralsorcery:blockcustomsandore>,
  <biomesoplenty:gem_ore:1>,
  <biomesoplenty:gem_ore:2>,
  <biomesoplenty:gem_ore:3>,
  <biomesoplenty:gem_ore:4>,
  <biomesoplenty:gem_ore:5>,
  <biomesoplenty:gem_ore:6>,
  <biomesoplenty:gem_ore>,
  <draconicevolution:draconium_ore>,
  <forestry:resources>,
  <immersiveengineering:ore:5>,
  <libvulpes:ore0:8>,
  <libvulpes:ore0>,
  <mekanism:oreblock>,
  <minecraft:diamond_ore>,
  <minecraft:emerald_ore>,
  <minecraft:gold_ore>,
  <minecraft:iron_ore>,
  <minecraft:lapis_ore>,
  <minecraft:redstone_ore>,
  <nuclearcraft:ore:3>,
  <nuclearcraft:ore:5>,
  <nuclearcraft:ore:6>,
  <nuclearcraft:ore:7>,
  <rftools:dimensional_shard_ore>,
  <tconstruct:ore:1>,
  <tconstruct:ore>,
  <thaumcraft:ore_amber>,
  <thermalfoundation:ore:1>,
  <thermalfoundation:ore:2>,
  <thermalfoundation:ore:3>,
  <thermalfoundation:ore:4>,
  <thermalfoundation:ore:5>,
  <thermalfoundation:ore:6>,
  <thermalfoundation:ore:7>,
  <thermalfoundation:ore:8>,
  <thermalfoundation:ore>,
] as IItemStack[];

for item in alcTableOres {
  mods.bloodmagic.AlchemyTable.removeRecipe([item, <bloodmagic:cutting_fluid>]);
}

// [Blood Wood] from [Spectre Wood]*2
mods.bloodmagic.BloodAltar.addRecipe(<animus:blockbloodwood>, <randomthings:spectrelog>, 0, 2000, 12, 12);

// [Crystal Cluster]*64 from [Benitoite][+3]
// mods.bloodmagic.AlchemyTable.addRecipe(IItemStack output, IItemStack[] inputs, int syphon, int ticks, int minTier);
mods.bloodmagic.AlchemyTable.addRecipe(<bloodmagic:decorative_brick:2> * 64, [
  <draconicevolution:infused_obsidian>, // Draconium Infused Obsidian
  <thaumicaugmentation:research_notes>,
  <thaumcraft:banner_crimson_cult>, // Crimson Cult Banner
  <bloodmagic:item_demon_crystal:*>, // Demon Will Crystal
  <bloodmagic:item_demon_crystal:*>, // Demon Will Crystal
  <bloodmagic:item_demon_crystal:*>, // Demon Will Crystal
], 100000, 300, 4);

// [Crystal Cluster Brick]*4 from [Crystal Cluster]
craft.shapeless(<bloodmagic:decorative_brick:3> * 4, '****', {
  '*': <bloodmagic:decorative_brick:2>, // Crystal Cluster
});

// [Sigil of the whirlwind]
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:sigil_whirlwind>, <minecraft:shield>, <bloodmagic:slate>);

// ///////////////////////////////////////////////////////////////////
// Add cutting of any compressed block
// ///////////////////////////////////////////////////////////////////

val compressions = [
  [
    [<minecraft:stone>, <additionalcompression:stone_compressed>, <additionalcompression:stone_compressed:1>, <additionalcompression:stone_compressed:2>, <additionalcompression:stone_compressed:3>, <additionalcompression:stone_compressed:4>, <additionalcompression:stone_compressed:5>, <additionalcompression:stone_compressed:6>, <additionalcompression:stone_compressed:7>, <additionalcompression:stone_compressed:8>, <additionalcompression:stone_compressed:9>],
    [<minecraft:cobblestone>, <extrautils2:compressedcobblestone>, <extrautils2:compressedcobblestone:1>, <extrautils2:compressedcobblestone:2>, <extrautils2:compressedcobblestone:3>, <extrautils2:compressedcobblestone:4>, <extrautils2:compressedcobblestone:5>, <extrautils2:compressedcobblestone:6>, <extrautils2:compressedcobblestone:7>, <additionalcompression:cobblestone_compressed:8>, <additionalcompression:cobblestone_compressed:9>],
    [<minecraft:gravel>, <extrautils2:compressedgravel>, <extrautils2:compressedgravel:1>, <additionalcompression:gravel_compressed:2>, <additionalcompression:gravel_compressed:3>, <additionalcompression:gravel_compressed:4>, <additionalcompression:gravel_compressed:5>, <additionalcompression:gravel_compressed:6>, <additionalcompression:gravel_compressed:7>, <additionalcompression:gravel_compressed:8>, <additionalcompression:gravel_compressed:9>],
    [<minecraft:sand>, <extrautils2:compressedsand>, <extrautils2:compressedsand:1>, <additionalcompression:blocksand_compressed:2>, <additionalcompression:blocksand_compressed:3>, <additionalcompression:blocksand_compressed:4>, <additionalcompression:blocksand_compressed:5>, <additionalcompression:blocksand_compressed:6>, <additionalcompression:blocksand_compressed:7>, <additionalcompression:blocksand_compressed:8>, <additionalcompression:blocksand_compressed:9>],
    [<exnihilocreatio:block_dust>, <excompressum:compressed_block>, <additionalcompression:dust_compressed:1>, <additionalcompression:dust_compressed:2>, <additionalcompression:dust_compressed:3>, <additionalcompression:dust_compressed:4>, <additionalcompression:dust_compressed:5>, <additionalcompression:dust_compressed:6>, <additionalcompression:dust_compressed:7>, <additionalcompression:dust_compressed:8>, <additionalcompression:dust_compressed:9>],
  ],
  [
    [<minecraft:netherrack>, <extrautils2:compressednetherrack>, <extrautils2:compressednetherrack:1>, <extrautils2:compressednetherrack:2>, <extrautils2:compressednetherrack:3>, <extrautils2:compressednetherrack:4>, <extrautils2:compressednetherrack:5>, <additionalcompression:netherrack_compressed:6>, <additionalcompression:netherrack_compressed:7>, <additionalcompression:netherrack_compressed:8>, <additionalcompression:netherrack_compressed:9>],
    [<exnihilocreatio:block_netherrack_crushed>, <excompressum:compressed_block:6>, <additionalcompression:gravelnether_compressed:1>, <additionalcompression:gravelnether_compressed:2>, <additionalcompression:gravelnether_compressed:3>, <additionalcompression:gravelnether_compressed:4>, <additionalcompression:gravelnether_compressed:5>, <additionalcompression:gravelnether_compressed:6>, <additionalcompression:gravelnether_compressed:7>, <additionalcompression:gravelnether_compressed:8>, <additionalcompression:gravelnether_compressed:9>],
  ],
  [
    [<minecraft:end_stone>, <excompressum:compressed_block:10>, <additionalcompression:endstone_compressed:1>, <additionalcompression:endstone_compressed:2>, <additionalcompression:endstone_compressed:3>, <additionalcompression:endstone_compressed:4>, <additionalcompression:endstone_compressed:5>, <additionalcompression:endstone_compressed:6>, <additionalcompression:endstone_compressed:7>, <additionalcompression:endstone_compressed:8>, <additionalcompression:endstone_compressed:9>],
    [<exnihilocreatio:block_endstone_crushed>, <excompressum:compressed_block:7>, <additionalcompression:gravelend_compressed:1>, <additionalcompression:gravelend_compressed:2>, <additionalcompression:gravelend_compressed:3>, <additionalcompression:gravelend_compressed:4>, <additionalcompression:gravelend_compressed:5>, <additionalcompression:gravelend_compressed:6>, <additionalcompression:gravelend_compressed:7>, <additionalcompression:gravelend_compressed:8>, <additionalcompression:gravelend_compressed:9>],
  ]
] as IItemStack[][][];

for group in compressions {
  var longest = 0;
  for type in group {
    longest = max(longest, type.length);
  }

  for i in 1 .. group.length {
    for j in 0 .. longest {
      if (group[i - 1].length < j || group[i].length < j || isNull(group[i - 1][j]) || isNull(group[i][j])) continue;
      mods.bloodmagic.AlchemyTable.addRecipe(group[i][j], [group[i - 1][j], <bloodmagic:cutting_fluid>], i * 1000, j * 20 + 20, min(4, j / 4));
    }
  }
}
