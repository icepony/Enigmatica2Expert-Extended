#priority 4000
#reloadable
#modloaded zenutils contenttweaker

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

/*
████████╗███████╗██╗     ██╗     ██████╗  █████╗ ██╗    ██╗
╚══██╔══╝██╔════╝██║     ██║     ██╔══██╗██╔══██╗██║    ██║
    ██║   █████╗  ██║     ██║     ██████╔╝███████║██║ █╗ ██║
    ██║   ██╔══╝  ██║     ██║     ██╔══██╗██╔══██║██║███╗██║
    ██║   ███████╗███████╗███████╗██║  ██║██║  ██║╚███╔███╔╝
    ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ 
*/
function item(item as IItemStack, color as string = null, showName as bool = true) as string {
  val colorTag = isNull(color)
    ? ''
    : ',"color":"'~color~'"';
  val displayName = item.hasDisplayName
    ? '"'~item.tag.display.Name.asString()~'"'
    : '{"translate":"'~item.name~'.name"}';

  val amount = item.amount > 1
    ? '{"translate":"%s ","with":["'~item.amount~'"]'~colorTag~'},'
    : '';
  val name = showName 
    ? ',{"translate":"[%s]","with":['~displayName~']'~colorTag~'}'
    : '';
  // The major part of `iconQuark` is actually 3 spaces, which are reserved for Quark item rendering
  // So you needs Quark to get the icon
  val iconQuark = 
    '{"text":"\u00A7f   ","hoverEvent":{"action":"show_item","value":"'
      ~item.asData().toNBTString().replaceAll('"', '\\\\"')
    ~'"}}';
  // Combine these pieces together, and return it
  return '{"text":"","extra":['~amount~iconQuark~name~']}';
}

function send(player as IPlayer, message as string) as void {
  mods.contenttweaker.Commands.call('/tellraw '~player.name~' ['~message~']', player, player.world, false, true);
}
