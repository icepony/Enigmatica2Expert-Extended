#modloaded trinity

scripts.process.fill(<trinity:empty_fusion_bomb>, <fluid:liquidfusionfuel> * 1000, <trinity:fusion_bomb>, 'only: NCInfuser Transposer');
scripts.process.fill(<trinity:empty_fusion_bomb>, <fluid:deuterium-tritium_mixture> * 1000, <trinity:fusion_bomb>, 'only: Transposer');

// Contaminated Food alt
craft.make(<rats:contaminated_food> * 8, [
  'ooo',
  'oio',
  'ooo'], {
  o: <minecraft:apple>,
  i: <trinity:radioactive_earth>,
});

// Contaminated Food alt
craft.make(<rats:contaminated_food> * 64, [
  'ooo',
  'oio',
  'ooo'], {
  o: <ore:compressedCropApple1x>,
  i: <trinity:radioactive_earth2>,
});

// Non-tech alt
# [Vitrified Sand] from [Oxidized Ferric Sand][+6]
mods.thaumcraft.Infusion.removeRecipe(<advancedrocketry:vitrifiedsand>);
mods.thaumcraft.Infusion.registerRecipe(
  "vitrifiedsand", # Name
  "INFUSION", # Research
  <advancedrocketry:vitrifiedsand>, # Output
  1, # Instability
  [<aspect:perditio> * 40, Aspect.exitium * 40],
  <advancedrocketry:hotturf>, # Central Item
  Grid(["pretty",
  "s Q s",
  "P   P",
  "s Q s"], {
  "s": <ore:compressed2xSand>, # Sand
  "Q": <immersiveengineering:stone_decoration:9>, # Quickdry Concrete
  "P": <thaumcraft:stone_porous>, # Porous Stone
}).spiral(1));

# [Trinitite-covered Sand] from [Vitrified Sand][+1]
craft.shapeless(<trinity:trinitite>, "VO", {
  "V": <advancedrocketry:vitrifiedsand>, # Vitrified Sand
  "O": <botania:overgrowthseed>,         # Overgrowth Seed
});

// Replace Trinitite drop with Luck one
// DOESNT WORK - trinitite still drop nothing.
// scripts.lib.dropt.addDrop(<trinity:trinitite>, <trinity:trinitite_shard>);
