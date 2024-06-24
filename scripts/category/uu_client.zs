#modloaded ic2
#reloadable
#priority -1
#sideonly client

import crafttweaker.item.ITooltipFunction;
import crafttweaker.player.IPlayer;
import mods.zenutils.StaticString.format;

val uuTooltip as ITooltipFunction = function (item) {
  val cost = scripts.category.uu.getCost(item);
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
