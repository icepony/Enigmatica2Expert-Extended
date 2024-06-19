# v1.39.2-beta (2024-6-19)

## Mods changes

### 🔴 Removed Mods

Icon | Summary|Reason
----:|:-------|---
<img src="https://media.forgecdn.net/avatars/thumbnails/200/446/30/30/636913462602634216.png"            > |                         [**Random PSIdeas**](https://www.curseforge.com/minecraft/mc-mods/random-psideas)               <sup><sub>rpsideas-2.4.4.jar                               </sub></sup><br>A mod which aims to enhance your PSI experience with some useful additions | This mod had high hopes but turned out to be a disappointment. Yes, it adds cool features for PSI, but it drags a huge clunky LibrarianLib with it.
<img src="https://media.forgecdn.net/avatars/thumbnails/293/39/30/30/637327777527263486.png"             > |                           [**LibrarianLib**](https://www.curseforge.com/minecraft/mc-mods/librarianlib)                 <sup><sub>librarianlib-1.12.2-4.22.jar                     </sub></sup><br>An extensive collection of tools, utilities, and frameworks. | A lengthy study of the operation of this library, revealed several problems for which it can no longer remain.<br> - Huge file size: larger than all other mods in the modpack.<br> - Significant increase in loading time: the mod does [some calculations](https://i.imgur.com/jDl1ioX.png) during loading, which are obviously not even necessary for Rpsideas.
<img src="https://media.forgecdn.net/avatars/thumbnails/426/859/30/30/637657810753408357.png"            > |               [**Item Highlighter [Forge]**](https://www.curseforge.com/minecraft/mc-mods/item-highlighter)             <sup><sub>Highlighter-1.12.2-forge-1.1.7.jar               </sub></sup><br>Highlights newly picked-up items.  Simple and convenient. | This may sound strange, but this mod made items [run through the inventory](https://i.imgur.com/wjWFM5y.gif) in some players.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/159/374/30/30/636658415780463602.png"            > |                          [**CraftPresence**](https://www.curseforge.com/minecraft/mc-mods/craftpresence)               | <nobr>CraftPresence-2.3.9+1.12.2</nobr><br><nobr>CraftPresence-2.4.0+1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.19.0-pre3</nobr><br><nobr>zenutils-1.19.0-pre4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/334/385/30/30/637468213328449243.png"            > |                       [**Precision Mining**](https://www.curseforge.com/minecraft/mc-mods/precision-mining)            | <nobr>PrecisionMining-1.12.2-5.2</nobr><br><nobr>PrecisionMining-1.12.2-5.2.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/548/30/30/30/637882959576383371.png"             > |              [**AE2 Fluid Crafting Rework**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)   | <nobr>Fluid Craft for AE2-2.6.1-r</nobr><br><nobr>Fluid Craft for AE2-2.6.2-r</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/983/99/30/30/638491305320584710.png"             > |                                  [**Fugue**](https://www.curseforge.com/minecraft/mc-mods/fugue)                       | <nobr>+Fugue-1.12.2-0.15.3</nobr><br><nobr>+Fugue-1.12.2-0.15.5</nobr>
-----------

## ⚡ Performance Improvements

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/85309bf696d4fff561d87f7f49f2c3c04d8d08fb)⚡Improve item removal script
  > Getter `IITemStack.ores` is slow so I replaces it with static ore removal. Saved ~1 second of game load 😄
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3787d4ddfc7428a268841bb30f81087dc69ca6ba)⚡Increase ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_alloy_smelter__0.png "Alloy Smelter") performance
  > Before this change, registering recipes required iterate over big amounts if registry to find what custom recipes could be x3, like when you can smelt 3 cobblestone at once.
  > 
  > This takes 1-3 seconds on loading time for about ~16 custom recipes.
  > 
  > I removed this x3 functionality for those 16 custom recipes (mostly compressed cobble => stone ones).
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/dfb18119274125734b5e308474e98618f9f0be0e)⚡Increase HEI recipe iteration by 1-3 seconds
  > Since there is tens of thouthands HEI recipes, rapid calling of progress bar steps caused excess second of waiting.
  > 
  > https://spark.lucko.me/MRBZYLxzrN?hl=340125
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e7e352f551424bf84019b0b124e7780356e247e8)⚡Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/integrateddynamics/on_the_dynamics_of_integration__0.png "On the Dynamics of Integration")
  > This book takes 1-3 seconds on game load since make some cpu-heavy iterations https://spark.lucko.me/HlEM0qGvQZ?hl=546133
  > 
  > I never saw anyone learned ID with this book. Please report on E2EE discord if you was - i will add some kind of link to online guide in quest book.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ed6c46c7f89b965ac29bfe04a0e1565cccc37eb5)⚡Remove crafting recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/tool__3.png "Engineer's Manual")
  > This should save 2-6 seconds of game load.
  > 
  > Usually, it wont take so long for IE to make thosre 3x3 grid recipe pages. But in E2EE there is a lot of recipes. IE script made the way it need to iterate all 16000 crafting table recipes for each manual book recipe.
  > 
  > Those recipes makes sense if modpack doesnt have  HEI. But since most of the recipes are changed and was already not actual, I removed them. Text on pagest still there, just without 3x3 grid.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1cf9765f75222634e439d6f66a5c7153704be647)⚡Remove IE Orevein map villagers
  > They caused 1-3 seconds load and sell Ore Vein places, which already easy and fast to obtain with a drill.

## ✨ New Features

* <img src="https://i.imgur.com/jv72ldu.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9016586767a7c11fbaa18aeaf63ae185db92815e)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/table_basic__0.png "Basic Crafting Table") expansion into Engineering Table
  > > Contributed by [TrashboxBobylev](trashbox.bobylev@gmail.com)
  >
  > Expand Basic table's purpose and recipe set.
  > 
  > - Flavor-transforms Basic Crafting Table into Engineering Table (texture and name)
  > - Add 15 Engineering recipes, that provide more essential blocks and crafting materials per craft at cost of slightly increasing the difficulty of base crafting recipe.

## 🐛 Fixes


#### Balance

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9ee5e4ba65101c29322a864e88ac9f9e856c5f5d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/cyclicmagic/block_fragile_weak__0.png "Replaceable Scaffolding") add recycling
  > Also ![](https://github.com/Krutoy242/mc-icons/raw/master/i/cyclicmagic/block_fragile_auto__0.png "Responsive Scaffolding") cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c8edf76bb739dca0ac399732c8525a62b7099f4b)✏️fix `steam`=>`ic2steam` conversion too powerful
  > now its x10 steam versus x1 ic2steam

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/21d2cf7d1954ecfb3b2ef793a2ed261e3119f242)🧩Disable Quark's `Burried Treasure` feature
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9eca865c853daa263bf83ccf49a06cc337ccf0e1)🧩Fix `Infernal Furnace` not working
  > Also this fix other Thaumcraft-like furnaces from Thaumic Wonders.
  > 
  > Related https://github.com/fonnymunkey/RLMixins/issues/16
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/efd88118e83696769e06d7217f124729673ce682)🧩Disable some `RLMixins` tweak/fix options
  > More info https://github.com/fonnymunkey/RLMixins/issues/16#issuecomment-2177437447

#### Difficulty_rework

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a6bfa8adc7905b8d8e420894208b2d234c1fe500)💙![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crystal_memory__0__3d4c3242.png "Crystal Memory") when clicking over ![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator") shows difficulty of Owner first
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2b78a720b2c56da59728de2c653515973ac05fcb)💙`creative` and `spectator` players cant acquire

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2130a90c1af3275d7e5ad14fb8d859d45ef2f535)📝![](https://github.com/Krutoy242/mc-icons/raw/master/i/avaritia/singularity__1.png "Woodweave Singularity") add power required value to desc
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7fc61396533a3c4aaf052ba6d6d9f23f251d2b29)📝Show message about wrong installation when either of two mods is not installed

#### Hei

* <img src="https://i.imgur.com/PW118AA.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e100523e42b3865ece7ed6be6003c89fd413c3df)🧻Add HEI hints ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rats/marbled_cheese_raw__0.png "Raw Marbled Cheese") skyblock source
  > 

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/52f3f8ec3d7e9793c7c5fb4fbcdf19f2781d40e2)✏️fix not all vis seeds was hidden in HEI
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/eb9dd5003f5c3b044338c897a614c12e24ea851e)🧻Add info that ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/twilight_sapling__4.png "Robust Twilight Oak Sapling") can spawn [Lootr Chest] and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/mob_spawner__0.png "Monster Spawner")

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d5546605ca0bb27ce441934fc30514238a2c7612)📖Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crop_seed_bag__0.png "Spidernip Seeds") to Crop sticks reward
  > For ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/web__0.png "Cobweb") shortcut
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d64d1346640d7a7fdf4ea6f7d4beb8b2ad1b98c0)📖Add new moderator blocks to "Moderators" quest
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/643b4c28bacebe1867d2c9f25b0945b5c21f09c4)📖Improve skyblock quests tasks and rewards

#### Recipes

* <img src="https://i.imgur.com/UkAqNe3.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/11998cc302bc6f653ebd765b7c2b4eb9d6b6d14a)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/smoker__0.png "Bee Smoker") add recycling recipe
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a69d47f29793a5afb78d41f19c733cdf4fb046a2)✏️fix Thaumcraft Nuggets cant be converted




# v1.39.1-beta (2024-6-11)


## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1111884b472300b5c3662da792a3b67209d46b1a)💙Fix server crash when ![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator") doesnt know owner player
  > Replicator always know who placed it, even if it was block placer. But in rare circumstances "owner" field could be empty what causing crash.



# v1.39.0-beta (2024-6-11)
## Mods changes
### 🟢 Added Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/163/297/30/30/636681042139242064.png"            > |     [**Proportional Destruction Particles**](https://www.curseforge.com/minecraft/mc-mods/proportional-destruction-particles)<sup><sub>ProportionalDestructionParticles-1.12.2-1.2.4.jar</sub></sup><br>A client-side mod that causes block destruction particles to only spawn in blocks&#x27; collision/bounding boxes. 
<img src="https://media.forgecdn.net/avatars/thumbnails/180/595/30/30/636793993834717165.png"            > |[**Cherished Worlds (Fabric/Forge/NeoForge/Quilt)**](https://www.curseforge.com/minecraft/mc-mods/cherished-worlds)             <sup><sub>cherishedworlds-1.12.2-1.0.1.jar                 </sub></sup><br>Favorite/pin/bookmark certain worlds, which will always be at the top of the list and cannot be deleted.
<img src="https://media.forgecdn.net/avatars/thumbnails/199/180/30/30/636905047001963968.png"            > |               [**BetterWaterSplashPotions**](https://www.curseforge.com/minecraft/mc-mods/betterwatersplashpotions)     <sup><sub>BetterWaterSplash-1.0.jar                        </sub></sup><br>Splash potions now extinguish mobs on fire
<img src="https://media.forgecdn.net/avatars/thumbnails/417/257/30/30/637640874948180814.png"            > |                   [**Item Borders [Forge]**](https://www.curseforge.com/minecraft/mc-mods/item-borders)                 <sup><sub>ItemBorders-1.12.2-forge-1.2.0.jar               </sub></sup><br>Add colored borders to inventory slots to make your rare items stand out!
<img src="https://media.forgecdn.net/avatars/thumbnails/426/859/30/30/637657810753408357.png"            > |               [**Item Highlighter [Forge]**](https://www.curseforge.com/minecraft/mc-mods/item-highlighter)             <sup><sub>Highlighter-1.12.2-forge-1.1.7.jar               </sub></sup><br>Highlights newly picked-up items.  Simple and convenient.
<img src="https://media.forgecdn.net/avatars/thumbnails/782/581/30/30/638129648817875687.png"            > |                                [**Fixeroo**](https://www.curseforge.com/minecraft/mc-mods/xp-orb-clump)                 <sup><sub>Fixeroo-2.0.jar                                  </sub></sup><br>I fix and optimize Minecraft code when i feel like it
<img src="https://media.forgecdn.net/avatars/thumbnails/648/528/30/30/638050129235150630.png"            > |                               [**RLMixins**](https://www.curseforge.com/minecraft/mc-mods/rlmixins)                     <sup><sub>RLMixins-1.3.4.jar                               </sub></sup><br>RLMixins is a tweaking utility for the modpack RLCraft to make many changes and patches.
<img src="https://media.forgecdn.net/avatars/thumbnails/802/719/30/30/638167551524327225.png"            > |                         [**Hit Indication**](https://www.curseforge.com/minecraft/mc-mods/hit-indication)               <sup><sub>hitindication-1.12.2-1.3.1.jar                   </sub></sup><br>Adds indicators to show where you where damaged from, with optional config options.
<img src="https://media.forgecdn.net/avatars/thumbnails/940/816/30/30/638421488541256874.png"            > |                          [**FermiumBooter**](https://www.curseforge.com/minecraft/mc-mods/fermiumbooter)                <sup><sub>&#x60;FermiumBooter-1.1.0.jar                         </sub></sup><br>A simplistic mixin mod utility for loading early and late mixins
-----------


### 🔴 Removed Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/84/193/30/30/636193647832736518_animated.gif"    > |                                 [**Clumps**](https://www.curseforge.com/minecraft/mc-mods/clumps)                       <sup><sub>Clumps-3.1.2.jar                                 </sub></sup><br>Clumps XP orbs together to reduce lag
<img src="https://media.forgecdn.net/avatars/thumbnails/242/972/30/30/637137035110158270.png"            > |                         [**MixinBootstrap**](https://www.curseforge.com/minecraft/mc-mods/mixinbootstrap)               <sup><sub>_MixinBootstrap-1.1.0.jar                        </sub></sup><br>MixinBootstrap is a temporary way of booting Mixin in a MinecraftForge production environment.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/152/846/30/30/636614472137003477.png"            > |       [**Thaumic Additions: Reconstructed**](https://www.curseforge.com/minecraft/mc-mods/thaumic-additions)           | <nobr>ThaumicAdditions-1.12.2-12.7.8</nobr><br><nobr>ThaumicAdditions-1.12.2-12.7.9</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/49/603/30/30/636079972364045115.png"             > |                            [**Controlling**](https://www.curseforge.com/minecraft/mc-mods/controlling)                 | <nobr>Controlling-3.0.12.3</nobr><br><nobr>Controlling-3.0.12.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/219/922/30/30/637017762381775487.png"            > |                                  [**Dropt**](https://www.curseforge.com/minecraft/mc-mods/dropt)                       | <nobr>dropt-1.12.2-1.19.3</nobr><br><nobr>dropt-1.12.2-1.19.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/180/855/30/30/636796143936766724.png"            > |                           [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto)                | <nobr>PackagedAuto-1.12.2-1.0.13.47</nobr><br><nobr>PackagedAuto-1.12.2-1.0.13.49</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/248/435/30/30/637168261428598002.png"            > |                                    [**QMD**](https://www.curseforge.com/minecraft/mc-mods/qmd)                         | <nobr>QMD-1.3.4-1.12.2</nobr><br><nobr>QMD-1.3.5-1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/483/123/30/30/637782695232246251.png"            > |           [**AE2 Unofficial Extended Life**](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life)           | <nobr>ae2-uel-v0.56.4</nobr><br><nobr>ae2-uel-v0.56.6</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/548/30/30/30/637882959576383371.png"             > |              [**AE2 Fluid Crafting Rework**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)   | <nobr>Fluid Craft for AE2-2.5.13-r</nobr><br><nobr>Fluid Craft for AE2-2.6.1-r</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/582/719/30/30/637948923198368494.png"            > |                      [**Tweaked Petroleum**](https://www.curseforge.com/minecraft/mc-mods/tweaked-petroleum)           | <nobr>tweakedpetroleum-2.0.0</nobr><br><nobr>tweakedpetroleum-2.0.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/843/993/30/30/638240773247477634.png"            > |   [**Neeve's AE2: Extended Life Additions**](https://www.curseforge.com/minecraft/mc-mods/nae2)                        | <nobr>nae2-1.6.2</nobr><br><nobr>nae2-1.6.4</nobr>
-----------

## ⚡ Performance Improvements

* <img src="https://i.imgur.com/ncPyPc6.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/13dda7b12d3c126578e95504b7d5e16ddf890469)⚡Increase performance of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator")
  > Now, instead of searching for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crystal_memory__0__3d4c3242.png "Crystal Memory") in adjascent inventories, there will be special slot for the Memory. This will make idle Replicators require x10 times less CPU time.
* <img src="https://i.imgur.com/0EHvNUV.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/16d12972d266d3c39b91391475f4dba45206d6e1)⚡Mak HEI ignore ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/anvil__0.png "Anvil") enchantment recipes to save on memory
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ba551c81ea0ffcc0220afaf8496ea48e90979d5b)⚡Remove ~100 unused IronChest recipes
  > Silver and Copper chests was disabled, so their usages and recipes was removed.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/58b3af68656c5b258acff84ea0fe4bfbc93c1390)⚡Remove 82 Pam crop => seed recipes
  > seeds doesnt have actual usage except planting, and planting available directly, without turning into seed.

## ✨ New Features


#### Difficulty Rework

* <img src="https://i.imgur.com/nNDhXGU.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7294a13966c41e921508e91b2c879477f3c158f4)💙Add difficulty when player acquire items
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/scalinghealth/difficultychanger__0.png "Enchanted Heart")![](https://github.com/Krutoy242/mc-icons/raw/master/i/scalinghealth/difficultychanger__1.png "Cursed Heart") sources removed
  > - Difficulty not increasing with time ⌚ anymore
  > - Add tooltips on items that increase Difficulty
  > - Items with difficulty effect have yellow borders
  > 
  > Read all other changes in respective quest.
* <img src="https://i.imgur.com/Lfmkemv.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8afbd46a9f9b2f28ebc3f7b923502f2d96773761)💙![](https://github.com/Krutoy242/mc-icons/raw/master/i/requious/replicator__0.png "Replicator") add `difficulty` functionality
  > - UU matter cost on tooltip now displayed two times - for current player difficulty level and for base cost
  > - Add new stat "Spent UU Matter buckets"
  > - Improved and added new quests
  > - Changed Replicator GUI
  > - Add particle FX and sound to working Replicator
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/216f1fab6d4343d024446207b8d1f856ce8e98b7)📖Amount of Loot Crates based on player's difficulty
  > - +1 crate if have 0 difficulty✪
  > - 1 crate if your difficulty✪ on max
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d0c7006bdfc1fea1b4178b100f032d37a3a0d428)💙Replace `Difficulty` TCon trait to new `Challenger`
  > Now, higher Difficulty⭐ increases mining speed, damage, and defense/toughness.

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b8dc235ab266be3741d914698a82d0de534c99cc)📝![](https://github.com/Krutoy242/mc-icons/raw/master/i/avaritia/singularity__1.png "Woodweave Singularity") make formula more readable

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/91832041ede445f3c5dcfe5fe2617bdafc3207b4)🧻Add Dragon Skull drop
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ff647dd47a784c62db5c856378a4724dd3d128b9)🧻Add HEI hints for Rats entity creation
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9443ba7c6aa15473b703dd3f727499870d4db93d)🧻Now ingredients in various HEI hints show soul and egg
  > Was only soul before

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bb1f69c89a51e284186722f3cd0a4922b0c5e6da)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/repeater__0.png "Redstone Repeater") fix duplicate recipe
* <img src="https://i.imgur.com/xybbEBa.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/523c01d92de63a4abcf942f2fdaee94fb5ede60d)✏️Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/spawn_egg__0__95b04845.png "Spawn Greater Crimson Portal") spawning mechanic
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1c7cd727cb4e1f695068b8cf614b5112014b90e7)✏️add new NC Moderator blocks
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/aurora_block__0.png "Aurora Block"): 26, ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/biomeglass__0.png "Biome Glass"): 40, ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/basalt__0.png "Basalt Sediment"): 44, ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/infused_obsidian__0.png "Draconium Infused Obsidian"): 46, ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/draconium_block__1.png "Charged Draconium Block"): 52, ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/draconic_block__0.png "Awakened Draconium Block"): 80
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ed0e87c30ff5323a50f88e3a29ec628a1923a838)✏️add unbreakable ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/frame_proven__0.png "Proven Frame") recipe

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/03bfec5e8e45367f32da5a5e985e2f19c50bff65)🧩![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania/elementiumsword__32767.png "Elementium Sword") return to registry but make uncraftable
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/378  
  > Also should fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/363
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4baf31fd9a7a21c4a68f3c635326a45a37e6d7d5)🧩Enable lot of `RLMixins` tweak/fix options
  > See commit details to see what was enabled.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9a992516b39bfbf0b4557a38b2f98a85ce228951)🧩Rustic's brews give better buffs
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rustic/fluid_bottle__0__e4e64b16.png "Bottle of Cider"): Reach
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rustic/fluid_bottle__0__2e8468cc.png "Bottle of Mead"): Climb
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c60f702b1f800b1117fecb2b7f7561499d097a90)🧩Disable RLTweaker option "Less Collisions"
  > Since this changes controlled by Universal Tweaks.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7f22b06959ccc7091d10b004843cd2867dc87798)🧩![](https://github.com/Krutoy242/mc-icons/raw/master/i/mctsmelteryio/machine__3.png "Advanced Seared Drain") make same mining level as Seared Bricks

#### Blood_magic

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7c3a21a55cddcf5fef9e359c1adfe19d76b2da25)🩸Fix alloy recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/alchemy_table__0.png "Alchemy Table") unsing dusts and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/component__25.png "Neuro Toxin")
  > They didnt consumed ingredients more than 1.
  > Sadly, but to fix this i was need to remove feature of mass-mixing.

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/60bb33358fe050524148b49f2efa0d8d7ad6ba0d)🧩![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/enchanting_table__0.png "Enchantment Table") level up book Enchantability x2
* <img src="https://i.imgur.com/Lne1QVH.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/769fa1713d95a4f2003e424f02663994d951a25d)🧩Potion effects actually display their values above amplifier 3
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e717176e5fa4f2a5568cd98cc9aef2ac7601a9cb)🧩Rebalance Conflux level chunk restrictions
  > Now `Conflux` levels provide this amount of `max claimed` / `max loaded` chunks:
  > 
  > 0. 9 / 1
  > 1. 80 / 9
  > 2. 150 / 25
  > 3. 300 / 50
  > 4. 400 / 60
  > 5 500 / 100
  > 
  > Remember, that if you are updating from older modpack version, you should manually edit file `local/ftbutilities/ranks.txt`.
* <img src="https://i.imgur.com/3a3BjCH.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/377a0f567ab4b3440ea7d1a3e669cd24a515353d)🧩Stop ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/anvil__0.png "Anvil") from displaying "Too Expensive"
  > 

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/69c8b97fdc102240eb8b2e3262f6830f3d43a7f4)📝Add tip `Splash Water Bottle
  > can extinguish entities on fire`

#### Mods

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/18423be08f73c3c5140145eeffa7954f70fdea8e)🔴Prepare `XTones` and `Environmental Materials` mods to removal
  > This change will only remove recipes for blocks, hide them from HEI and remove all usages in world generation or quest rewards..
  > 
  > ⚠️In one of the next E2EE versions those mods will be removed completely. Retain yourself from using blocks from this mods if you want to keep updating without losing structures.

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/194791cbae5e4f195aabb0f26f4095318c55ccd8)📖`"Grand=>Grant" access to the Nether` fix typo
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/40cc4c5df70465ed1fa95e794c3be58aa25e827a)📖Disable toasts for Manganese quest

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ae233d612bc374e3b7d9497be52473e5e0ac3c68)✏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/appliedenergistics2/charged_quartz_ore__0.png "Charged Certus Quartz Ore") wrong result with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumicwonders/alchemist_stone__0.png "Alchemist's Stone")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6a9279ff51ea49ceeacf6819f8a44cab98f5e274)✏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/gravel__0.png "levarG") fix recipe

#### Thaumcraft

*<img src="https://i.imgur.com/bBtYXQe.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6b3b6efd145b1ccffe6faa0c0ac3cdbba69aca14)🦯Cot mam (th add materials 🟦🟥🟪) rework
  > > Contributed by [TabakaSIM](78695622+TabakaSIM@users.noreply.github.com)
  >
  > 🟦 Mithrillim <img src="https://i.imgur.com/ns0RnlN.gif" align=right>
  >   > Vis Vacuum:
  >   > - Added Vis Vacuum trait to head part - works similar to vis siphon, but takes vis from attached chunks
  >   > 
  >   > Equilibrium:
  >   > - Increased mining speed formula
  >   > - Added effect on releasing vis on kill
  >   
  > 🟥 Adaminite <img src="https://i.imgur.com/mI5a6gl.gif" align=right> 
  >   > - If not enough warp (50 - unchanged) "sword" now make additionaly sound and player get spin 2 effect (was 1) - it will still inform player about it
  >   > - Changed debuff formula (now durration is based on warp - was 600 ticks, meaning durration is now up to 1500 ticks)
  >   > - No longer drops enemy armor, breaks it instead
  >   > - Sword will speak more frequently based on warp, updated dialoges options
  >   
  > 🟪 Mithminite
  >   > - You can now check research status on tinkers tool station
  >   > - Ore purifier does not require player to work
  >   > - Flux strike has been reworked
  >   > - Gods wraith now only works on projectiles - create lightning (unchanged) and if distance is greater then 30, it makes huge explosion
  >   > - Mithminite armor get `Robust` trait (gives 5 full hearts per armor part - meaning up to 20 full hearts)




