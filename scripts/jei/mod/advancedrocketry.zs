#modloaded advancedrocketry
#priority 950
#reloadable

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.randomtweaker.jei.IJeiUtils;

import scripts.jei.requious.add as addRecipe;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
val x = <assembly:asteroids>;
x.addJEICatalyst(<advancedrocketry:asteroidchip>);
x.setJEIDurationSlot(1, 0, 'duration', scripts.jei.requious.getVisGauge(3, 1));
scripts.jei.requious.addInsOuts(x, [[0, 0]], [[2, 0], [3, 0], [4, 0]]);

function addAsteroid(name as string, values as double[], output as IItemStack[]) as void {
  addRecipe(<assembly:asteroids>, { [<advancedrocketry:asteroidchip>.withLore([
    '§8Distance: §b' ~ values[0],
    '§8Mass: §b' ~ values[1],
    '§8Mass variability: §b' ~ values[2],
    '§8Probability: §b' ~ values[3],
    '§8Richness: §b' ~ values[4],
    '§8Richness variability: §b' ~ values[5],
  ]).withDisplayName('§6' + name)] as IIngredient[]:
    output,
  });
}

/* Inject_js(
xml_to_js(loadText('config/advRocketry/asteroidConfig.xml')).elements[0].elements.map(
  (asteroid) => [`addAsteroid('${asteroid.attributes.name}'`, `, [${
      Object.entries(asteroid.attributes)
      .filter(([key]) => key !== 'name')
      .sort(([a],[b])=>a.length-b.length)
      .map(([,val]) => val)
      .join(', ')}]`, `, [${
      asteroid.elements
      .map((item) => `<${
        String(item.attributes.itemStack).replace(' ', ':')
      }>.withLore(['§8Chance: §b${item.attributes.chance}'])`)
      .join(', ')}]);`]
)) */
addAsteroid('Iridium Enriched'     , [25, 100, 0.8, 3, 10, 0.2], [<minecraft:iron_ore>.withLore(['§8Chance: §b25']), <thermalfoundation:ore:7>.withLore(['§8Chance: §b25'])]);
addAsteroid('Draconium'            , [64, 75, 0.7, 5, 1, 0.5]  , [<draconicevolution:draconium_ore>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Prosperity'           , [64, 75, 0.7, 5, 1, 0.5]  , [<mysticalagriculture:prosperity_ore>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Dimensional Shard'    , [64, 75, 0.7, 5, 1, 0.5]  , [<rftools:dimensional_shard_ore>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Mana Infused'         , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore:8>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Destabilized Redstone', [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:2>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Energized Netherrack' , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:3>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Resonant End Stone'   , [64, 75, 0.7, 5, 1, 0.5]  , [<thermalfoundation:ore_fluid:4>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Dilithium'            , [64, 75, 0.7, 5, 1, 0.5]  , [<netherendingores:ore_end_modded_1:14>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Titanium'             , [64, 75, 0.7, 5, 1, 0.5]  , [<libvulpes:ore0:8>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Starmetal'            , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore:1>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Rock Crystal'         , [64, 75, 0.7, 5, 1, 0.5]  , [<astralsorcery:blockcustomore>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Steel'                , [64, 75, 0.3, 7, 1, 0.2]  , [<thermalfoundation:storage_alloy>.withLore(['§8Chance: §b100']), <advancedrocketry:hotturf>.withLore(['§8Chance: §b25'])]);
addAsteroid('Moon Turf'            , [64, 50, 0.9, 8, 10, 0.1] , [<advancedrocketry:moonturf>.withLore(['§8Chance: §b50']), <advancedrocketry:moonturf_dark>.withLore(['§8Chance: §b50'])]);
/**/

// -----------------------------------------------------------------------
val p = mods.jei.JEI.createJei('orbital_laser_drill', "Orbital Laser Drill")
.setBackground(IJeiUtils.createBackground(7*18, 3*18))
.addRecipeCatalyst(<advancedrocketry:spacelaser>)
.setIcon(<advancedrocketry:spacelaser>)
.setModid('advancedrocketry');
for y in 0 .. 3 {
  for x in 0 .. 7 {
    p.addSlot(IJeiUtils.createItemSlot('output', x*18, y*18, false, false));
  }
}
p.register();

mods.jei.JEI.createJeiRecipe("orbital_laser_drill").setOutputs([
/* Inject_js(
config('config/advRocketry/advancedRocketry.cfg')
['world and ore generation'].laserDrillOres
.map(l=>`  <ore:${l}>,`)
) */
  <ore:oreClathrateEnder>,
  <ore:oreClathrateGlowstone>,
  <ore:oreClathrateRedstone>,
  <ore:oreDraconium>,
  <ore:oreProsperity>,
  <ore:oreAstralStarmetal>,
  <ore:oreDilithium>,
  <ore:oreIridium>,
  <ore:oreMithril>,
  <ore:orePlatinum>,
  <ore:oreTitanium>,
/**/
]).build();
