#modloaded travelersbackpack

// Prevent to accidentally destroy backpack
val backpackBlock = <blockstate:travelersbackpack:travelers_backpack>.block.definition;
backpackBlock.setUnbreakable();
backpackBlock.resistance = 340282346638528860000000000000000000000.0f;

// *======= Traveler's Backpacks =======*
recipes.remove(<travelersbackpack:hose>);
recipes.addShaped(<travelersbackpack:hose>, [
  [<travelersbackpack:hose_nozzle>, <ore:itemRubber>, <ore:itemRubber>],
  [null, null, <ore:itemRubber>],
  [null, null, <ore:dyeGreen>]]);

// Remake Sleeping bag (prevent conflict)
remakeEx(<travelersbackpack:sleeping_bag_bottom>, [[<ore:woolRed>, <ore:woolRed>, <ore:woolWhite>]]);
