# v1.35.0 (2024-3-27)
## Mods changes
### 🟢 Added Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/837/293/30/30/638230425147423727.png"            > |                           [**Enhanced P2P**](https://www.curseforge.com/minecraft/mc-mods/enhancedp2p)                  <sup><sub>betterp2p-1.12.2-1.2.3-extended_life.jar         </sub></sup><br>Improved Fork of Better P2P
-----------


### 🔴 Removed Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/64/742/30/30/636155881760450813.png"             > |              [**Pixel Reality - Luminance**](https://www.curseforge.com/minecraft/texture-packs/pixel-reality-luminance)<sup><sub>Pixel Reality Luminance 1.12.2.zip               </sub></sup><br>Realistic(ish) light effects without shaders! Use it on top of vanilla or your chosen pack! Needs Optifine.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/92/854/30/30/636258666554688823.png"             > |                        [**Xaero's Minimap**](https://www.curseforge.com/minecraft/mc-mods/xaeros-minimap)              | <nobr>Xaeros_Minimap_23.9.7_Forge_1.12</nobr><br><nobr>Xaeros_Minimap_24.0.1_Forge_1.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/196/654/30/30/636886857118683130.png"            > |                      [**Xaero's World Map**](https://www.curseforge.com/minecraft/mc-mods/xaeros-world-map)            | <nobr>XaerosWorldMap_1.37.8_Forge_1.12</nobr><br><nobr>XaerosWorldMap_1.38.1_Forge_1.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/289/63/30/30/637313892155541419.png"             > |                   [**Thaumic Augmentation**](https://www.curseforge.com/minecraft/mc-mods/thaumic-augmentation)        | <nobr>ThaumicAugmentation-1.12.2-2.1.13</nobr><br><nobr>ThaumicAugmentation-1.12.2-2.1.13</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/248/435/30/30/637168261428598002.png"            > |                                    [**QMD**](https://www.curseforge.com/minecraft/mc-mods/qmd)                         | <nobr>QMD-1.3-1.12.2</nobr><br><nobr>QMD-1.3.1-1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/417/700/30/30/637642020488223140.png"            > |                          [**RandomTweaker**](https://www.curseforge.com/minecraft/mc-mods/randomtweaker)               | <nobr>RandomTweaker-1.4.2</nobr><br><nobr>RandomTweaker-1.4.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.25.2</nobr><br><nobr>HadEnoughItems_1.12.2-4.25.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/799/137/30/30/638161375230095246.png"            > |                          [**File Director**](https://www.curseforge.com/minecraft/mc-mods/filedirector)                | <nobr>!mod-director-launchwrapper-1.8.1-all</nobr><br><nobr>!mod-director-launchwrapper-1.8.2-all</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/858/79/30/30/638263153200073671.png"             > |                     [**SerializationIsBad**](https://www.curseforge.com/minecraft/mc-mods/serializationisbad)          | <nobr>serializationisbad-1.5</nobr><br><nobr>serializationisbad-1.5.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/874/755/30/30/638296262646953159.png"            > |                [**Alfheim Lighting Engine**](https://www.curseforge.com/minecraft/mc-mods/alfheim-lighting-engine)     | <nobr>Alfheim-1.2</nobr><br><nobr>Alfheim-1.3-Dev-2</nobr>
-----------

## ⚡ Performance Improvements

* <img src="https://i.imgur.com/fIRFwLz.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f17bc7462d9c900b2e9000d52a26c8ca2be709ab)⚡Add config option to disable generating Aspects from recipes
  > Before this change, Thaumcraft for each item in game recursively iterated all its recipes to determine Aspect cost. This was caused lot of computation and took 10-30 seconds of game load.
  > 
  > Usually, this issue handled by `Thaumic Speedup` mod, but in some environment like Java21 its not working.
  > 
  > New config option will allow to disable this feature.
  > Side effect - most of items that doesnt have hardcoded aspects would not have aspects.
  > 
  > Note:
  > This option is harmless set to `true` if you playing on server with `false` value.
  > 
  > Related https://github.com/CleanroomMC/Cleanroom/issues/61
* <img src="https://i.imgur.com/kSR7WHw.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7be36dafd15dd4a7d4de4e7b87919b4ffb78c0ab)⚡Disable "Discord Rich Presence" by UTeamCore
  > This would save ~2 seconds of game load and probably removed some conflicts.
  > 
  > Rich Presence handled by mod `CraftPresence`
* <img src="https://i.imgur.com/oJL6CZr.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c991ed9cf3722556825a654469f6dbfe7ccca21f)⚡Disable "Pathfinder" villager trades
  > Save 1-4 seconds of game load.
  > 
  > This trades was useless anyway since Narute Compas is a thing.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/da1d943bc4e16a57606c04717a87fa1077b39237)⚡Disable Xaero map internet acces
  > Should save about 3 seconds on game load.
  > 
  > Disables parteon and update check.
  > 
  > Related to https://legacy.curseforge.com/minecraft/mc-mods/xaeros-world-map/issues/824

## ✨ New Features


#### Quest

* <img src="https://i.imgur.com/Dj3EfDu.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/64f4a167238413aff042f0232eb989304c60d6e2)📖 Improve messages "Player Obtained [...]"
  > Now it colored and have nice Discord formatting

## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6765b7f7c2990cd5d9f5f0638b4eb55c09c2a063)🌠Remove " asteroid" postfix on asteroid names to let them fit screen
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3489fd7a0f1b56baa53cdce227ead882a359a27e)💥Fix unable to connect server with port specified
  > This is nice and thrilling story about changing this option each patch.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/36d4aebed9b130c71f4417e1239f963d9db22bba)🦯Fix size-changing focus not showed in Thaumcraft researches

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ab136fef1fce96a2dfe90f5b4fd875642adc10bf)📝Add tip in Patchouli book `/bcore_util regenchunk`

#### Gear

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/49021a0292f5c0673563aedf0142ca433c915e68) ⛏️Fix Invincible Combo `Strength Of Will` + `Runic Shield`
  > There was an exploit allowing be invincible by combing this features. Now `Strength Of Will` will have 400 ticks cooldown.

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b291bc994342d77aae78baa796fbce85b3608233)🌍Add `Alien Jungle (200)` distribution

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/124e1dd28d6e49c22f34bda57ec7c306ca15d9ef)📖Fix typo in `Teleporter` quest
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8ce132b7c1c520a3c79fdd9448a52af9cd060b93)📖Improve Ru translation of `Getting Started` chapter

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/89be061867c4c589cb09c88833a7de0963adc759)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/microwavereciever__0.png "Microwave Receiver") buff output x20
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bdd2c4e4120f5e6040d4e308721ef1e1b4384485)✏️add antidupe for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/uncrafting_table__0.png "Uncrafting Table")
  > Now Uncrafting Table mechanic improved - you cant uncraft items that have several recipes with 2+ recipes output with same ID but different tags.
  > 
  > For example, you cant Uncraft Mekanism Tanks or Cubes, since before fix this was allowed to create Creative Tank from Basic one.
  > 
  > Please remember that Uncrafting Table is experemental feature and there could be still many unreported dupes.

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d06bd03177ad83c4d1a1892415ec984603eac986)🌍Fix AdvRocketry spam new planets on `Magnis Vulpes` system
  > I accidentally enabled generation of ~15 dimensions in one of planetary systems. All generated planets was called like "Magnis Vulpes xxx" and was actually mostly featureless. This bug only affected worlds created from `v1.31.0`.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d9680cccd05dd0d463ffed5a9cda0b3e63202cfa)🌍Fix Ice dragon cave chests was empty



