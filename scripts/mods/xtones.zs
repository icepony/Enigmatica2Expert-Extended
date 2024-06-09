#modloaded xtones

// Make all blocks uncraftable since mod is going to be removed
for item in loadedMods['xtones'].items {
  Purge(item);
}
