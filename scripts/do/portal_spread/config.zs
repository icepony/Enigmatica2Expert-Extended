
#priority 4500
#reloadable
#modloaded zenutils

import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;

/*
 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
*/

zenClass Config {
  // Maximum radius of portal. Must be less that 256
  // Consume maxRadius³ RAM memory
  static maxRadius as int = 64;

  // Number of ticks between block spread event
  // Can also be 0<x<1. In this case 1/spreadDelay blocks would be transformed for the same tick
  static spreadDelay as double = 1.0;

  // Number of blocks that would be checked for replacement
  static lookup as int = 50;

  // Debug mode to output all portal spread actions
  static debug as bool = false;

  // Default list of blocks and their modifiers
  // Find possible modifiers keys as scripts/do/portal_spread/modifiers.zs
  static modifBlocksKey as string[IBlockDefinition] = {};

	zenConstructor() { }
}

/**
 * Add or rewrite modifier block
 */
function setModifier(
  block as IBlock,
  modifierKey as string,
  langEntries as string[string][string] = null
) as void {
  Config.modifBlocksKey[block.definition] = modifierKey;

  // Add localisation if exist
  if(!isNull(langEntries)) {
    for lang, entries in langEntries {
      for k, v in entries {
        game.setLocalization(lang, 'portal_spread.'~k, v);
      }
    }
  }
}

setModifier(
  <blockstate:minecraft:coal_block>.block, 'slow', {
    en_us: {
      add: '§7With §6%s§7 placed, you feel the portal spreading slower.',
      red: '§7With §6%s§7 removed, you feel the portal spreading faster.',
      max: '§7Portal completely stopped spreading.',
    },
    zh_cn: {
      add: '§7有 §6%s§7 被放置了，你感到下界传送门扩散的速度正在减缓。',
      red: '§7有 §6%s§7 被移除了，你感到下界传送门扩散的速度正在加快。',
      max: '§7传送门完全停止了扩散。',
    }
});
