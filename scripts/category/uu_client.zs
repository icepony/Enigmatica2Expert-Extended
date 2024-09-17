#modloaded ic2
#reloadable
#priority -1
#sideonly client

import crafttweaker.item.ITooltipFunction;
import crafttweaker.player.IPlayer;
import mods.zenutils.StaticString.format;

val uuTooltip as ITooltipFunction = function (item) {
  val cost = scripts.category.uu.getCost(item, -1);
  val text = scripts.category.uu.formatUUCost(cost);
  val actualCost = scripts.category.uu.difficultCost(cost, client.player.difficulty);
  if (actualCost == cost) return text; // default cost

  val actualCostText = format('%,.2f', 0.01 * actualCost)
    .replace('.00', '');
  return `§8(${actualCostText}) ${text}`;
};

for itemID, metaData in scripts.category.uu.values {
  for meta, cost in metaData {
    val item = itemUtils.getItem(itemID, meta);
    if (isNull(item)) continue;
    item.only(function (item) { return !item.hasTag; })
      .addAdvancedTooltip(uuTooltip);
  }
}

<ic2:crystal_memory>.addAdvancedTooltip(function (item) {
  val replicable = scripts.lib.mod.ic2.getCrystalMemoryContent(item);
  if (isNull(replicable)) return null;

  val cost = scripts.category.uu.getCost(replicable, -1);
  if (cost <= 0) return null;

  val increase = 64.0 * scripts.category.uu.diffIncrease(0.01 * cost);
  val increaseText = increase < 0.01 ? format('%,.6f', increase) : format('%,.2f', increase);
  
  return mods.zenutils.I18n.format(game.localize('e2ee.acquire.increase'), increaseText);
});
