/**
 * @file Create helping commands for do.zs/portal_spread script
 * 
 * Write /portal_spread in game for help
 * 
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

#reloadable
#modloaded zenutils
#priority -1

import crafttweaker.world.IWorld;

import scripts.do.portal_spread.config.Config;
import scripts.do.portal_spread.data.getDimsMap;
import scripts.do.portal_spread.data.getPortalDataMap;
import scripts.do.portal_spread.data.portalIdToPos;
import scripts.do.portal_spread.modifiers.getModifiers;

val cmd = mods.zenutils.command.ZenCommand.create("portal_spread");
cmd.requiredPermissionLevel = 1;

// Stylazed icon of portal
static prefix as string = scripts.do.portal_spread.message.prefix;

cmd.getCommandUsage = function(sender) { return
  prefix ~ '§7/portal_spread §8<§7status§8§8|§7debug§8>'
  ~ '\n§7status§8: show all registered portals'
  ~ '\n§7debug§8: enable debug mode'
; };

val tabCompletion as mods.zenutils.command.IGetTabCompletion = function(server, sender, pos) {
  return mods.zenutils.StringList.create([
    "status", "debug"
  ]);
};
cmd.tabCompletionGetters = [tabCompletion];

cmd.execute = function(command, server, sender, args) {
  val player = mods.zenutils.command.CommandUtils.getCommandSenderAsPlayer(sender);

  if(args.length == 1) {
    if (args[0] == 'status') {
      player.sendMessage(getStatus(player.world));
      return;
    } else if (args[0] == 'debug') {
      player.sendMessage(enableDebug());
      return;
    }
  }

  mods.zenutils.command.CommandUtils.notifyWrongUsage(command, sender);
};
cmd.register();

/**
 *  Generate status string message
 */
function getStatus(world as IWorld) as string {

  var totalCachedPoints = 0;
  for _, groups in scripts.do.portal_spread.utils.table_sum_of_two_squares_variants {
    for _, points in groups {
      totalCachedPoints += 1;
    }
  }

  var portalsStr = serializePortals(world);
  val maxRadius as int = Config.maxRadius;

  return prefix ~ '§7Maximum radius§8: §f' ~
    maxRadius ~ '\n'

  ~ prefix ~ '§7#Portals in this dim§8: §f' ~
    scripts.do.portal_spread.data.getPortalCount(world) ~ '\n'

  ~ (portalsStr == '' ? '' :
    prefix ~ '§7Portals§8:\n' ~ portalsStr ~ '\n')
  ;
}

function enableDebug() as string {
  if(!Config.debug) {
    Config.debug = true;
    return prefix ~ '§7Debug mode §2enabled§7.'
      ~'\n§8You must be in §7Creative Mode§8 to see debug messages in chat.'
      ~'\n§8Messages also repeated in file §7crafttweaker.log';
  }
  Config.debug = false;
  return prefix ~ '§7Debug mode §3disabled§7.';
}

function serializePortals(world as IWorld) as string {
  var s = '';
  for dimId, dimData in getDimsMap(world).asMap() {
    s += '§7To dim §3'~dimId~'§8:\n';
    for portalId, portalData in getPortalDataMap(dimData).asMap() {
      val portalPos = portalIdToPos(portalId);
      val loaded = world.isBlockLoaded(portalPos);
      if(loaded) {
        val portalFullId = world.dimension~':'~portalId;
        val modifiers = getModifiers(world, portalFullId, portalData);
        var modStr = '';
        for i in 0 .. modifiers.length {
          if (modifiers[i] > 0) for i in 0 .. modifiers[i] {
            modStr += '§8█';
          }
        }
        s += '§8[§f' ~ portalId.replace(':', '§8:§f') ~ '§8] ' ~ modStr;
      } else {
        s += '§8['~portalId~'] (unloaded)';
      }
      s += '\n';
    }
  }
  return s;
}
