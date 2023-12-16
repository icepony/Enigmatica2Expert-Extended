/**
 * @file Give items when player right-click other player
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

val MAIN_HAND = crafttweaker.entity.IEntityEquipmentSlot.mainHand();

events.onPlayerInteractEntity(function(e as crafttweaker.event.PlayerInteractEntityEvent){
  var player = e.player;
  if (
    // Fake player not allowed
    player.fake
    // Player must be sneaking
    || !player.isSneaking
    // Player must be holding something
    || !player.hasItemInSlot(MAIN_HAND)
    // Player must be targeting another player
    || !(e.target instanceof IPlayer)
  ) {
    return;
  }

  // Cancel original interact event on both sides
  e.cancel();
  // Next only server-side actions
  if(e.world.remote) {
    return;
  }

  var target as IPlayer = e.target;
  var item = player.mainHandHeldItem;
  target.give(item);
  player.setItemToSlot(MAIN_HAND, null);

  broadcastMsg('send', player, target, item, 'blue', 'dark_blue');
  broadcastMsg('receive', target, player, item, 'dark_green', 'green');
});

function broadcastMsg(langCode as string, sender as IPlayer, receiver as IPlayer, item as IItemStack, col1 as string, col2 as string) as void {
  sender.sendRichTextMessage(crafttweaker.text.ITextComponent.fromData([{
    translate: 'chat.hand_over_your_items.' ~ langCode,
    color: col1,
    with: [scripts.lib.tellraw.itemObj(item, 'white'), {
      text: receiver.name,
      color: col2
    }]
  }]));
}
