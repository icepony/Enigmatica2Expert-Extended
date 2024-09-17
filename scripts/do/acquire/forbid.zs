#reloadable
#priority -1400

import crafttweaker.block.IBlockDefinition;
import crafttweaker.item.IItemStack;

import scripts.do.acquire.events.pushRegistry;
import scripts.do.acquire.events.blockDefRegistry;
import scripts.do.acquire.events.stringRegistry;

/*Inject_js(
(injectInFile('config/itemborders.cfg', 'S:yellow <\n', '\n     >',
  [...new Set(
    [...loadText('crafttweaker.log').matchAll(/^\[\w+\]\[\w+\]\[\w+\] Acquire +([^:]+): <([^>]+)>/gm)]
    .map(([,,item]) => `        ${item}`)
  )]
  .sort(naturalSort)
  .join('\n'))
, '// Done!')
)*/
// Done!
/**/

zenClass Forbidder {

  var stacks as IItemStack[];

  zenConstructor() {}

  function stack(stackRepresent as IItemStack) as Forbidder {
    stacks = [stackRepresent];
    return this;
  }

  function stacks(groupName as string, stacksRepresent as IItemStack[]) as Forbidder {
    stacks = stacksRepresent;
    for stack in stacks {
      scripts.do.acquire.data.groups[stack] = groupName;
    }
    return this;
  }

  function value(amount as double) as Forbidder {
    for stack in stacks {
      scripts.do.acquire.data.values[stack] = amount;
      stack.addTooltip(`§6+${amount}§e✪`);
      utils.log(`Acquire +${amount}: ${stack.commandString}`);
    }
    return this;
  }

  function events(onEvents as string) as Forbidder {
    val evts = onEvents.split('\\s+');

    // Check for existing events
    for event in evts {
     if (!(['pickup', 'open', 'look', 'craft', 'place', 'use', 'hold', 'replicate'] as string[] has event))
      logger.logWarning('Acquire error: trying to add absent acquiring event: "'~event~'"');
    }

    for stack in stacks {
      for event in evts { pushRegistry(event, stack); }

      if (evts has 'place' || evts has 'look') {
        val block = stack.asBlock();
        if (!isNull(block)) {
          val blockDef = block.definition;
          if (!isNull(blockDef)) {
            if (evts has 'place') {
              if(isNull(blockDefRegistry.place)) blockDefRegistry['place'] = {};
              blockDefRegistry.place[blockDef] = true;
            }
            if (evts has 'look') {
              if(isNull(blockDefRegistry.look)) blockDefRegistry['look'] = {};
              blockDefRegistry.look[blockDef] = true;
            }
          }
        }
      }
    }
    return this;
  }

  function onOpen(classPath as string) as Forbidder {
    for stack in stacks {
      stringRegistry[classPath] = stack;
    }
    return this;
  }
}