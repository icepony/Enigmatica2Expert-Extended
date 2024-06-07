#priority -1800
#reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import scripts.do.hand_over_your_items.tellrawItemObj;
import mods.zenutils.StringList;
import scripts.do.acquire.data.sendAcquireMessage;
import mods.zenutils.StaticString.format;

static MAX_SUGGESTED_ITEMS as int = 20;
static playersCompleted as bool[string] = {} as bool[string];

function show(player as IPlayer, item as IItemStack) as bool {
  if (
    isNull(player.world)
    || player.world.remote
    || isNull(item)
    || item.definition.id != 'ic2:crystal_memory'
    || !item.hasTag
    || isNull(item.tag.Pattern)
    || isNull(item.tag.Pattern.id)
  ) return false;

  var encodedItem = IItemStack.fromData(item.tag.Pattern);
  if(isNull(encodedItem)) return false;

  // collect all items that cost more than required one
  val requiredCost = scripts.category.uu.getCost(encodedItem, player.difficulty);
  var strList = StringList.empty();
  for itemID, metaData in scripts.category.uu.values {
    for meta, cost in metaData {
      if (cost < requiredCost) continue;
      strList.add(`${'0'.repeat(24 - toString(cost).length())}${cost};${itemID};${meta}`);
    }
  }
  val strArr = strList.toArray();
  mods.ctintegration.util.ArrayUtil.sort(strArr);

  // Convert item text into actual items with their text
  var textData = [] as IData;
  var k = 0;
  while textData.asList().length < MAX_SUGGESTED_ITEMS && k < strArr.length {
    val a = strArr[k].split(';');
    val item = itemUtils.getItem(a[1], a[2]);
    k += 1;
    if (!isNull(item)) textData += [tellrawItemObj(item, null, false)];
  }
  val itemsDisplayCount = min(MAX_SUGGESTED_ITEMS, textData.asList().length);

  val prefix = [{ translate: 'e2ee.acquire.prefix' }] as IData;
  sendAcquireMessage(player, [
    itemsDisplayCount <= 0
      ? { translate: 'e2ee.acquire.cannot', with: [
          tellrawItemObj(encodedItem, 'white')
        ] }
      : [
        { translate: 'e2ee.acquire.to_replicate', with: [
          tellrawItemObj(encodedItem, 'aqua'),
          formatDfclty(player.difficulty),
          scripts.category.uu.formatUUCost(requiredCost),
        ]},
        prefix,
        { translate: 'e2ee.acquire.list', with: [
          itemsDisplayCount,
        ] },
        prefix,
        textData,
      ]
  ]);

  playersCompleted[player.uuid] = true;
  return true;
}

events.register(function (e as crafttweaker.event.PlayerRightClickItemEvent) {
  if(show(e.player, e.item)) e.cancel();
}, mods.zenutils.EventPriority.low());

events.register(function (e as crafttweaker.event.PlayerLeftClickBlockEvent) {
  if(show(e.player, e.item)) e.cancel();
}, mods.zenutils.EventPriority.low());

function formatDfclty(dfclty as double) as string {
  return format('§6%,.2f§e✪', dfclty)
    .replace('.00', '')
    .replace('.', '§8.')
    .replaceAll(',', '§8,§6');
}
