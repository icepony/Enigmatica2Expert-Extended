# v1.36.0 (2024-4-5)

## Mods changes

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/108/684/30/30/636374315485450120.png"            > |                            [**U Team Core**](https://www.curseforge.com/minecraft/mc-mods/u-team-core)                 | <nobr>u_team_core-1.12.2-2.2.5.255</nobr><br><nobr>u_team_core-forge-1.12.2-2.2.5.282</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/776/226/30/30/638118140112428573.png"            > |                [**Aqua Acrobatics [Forge]**](https://www.curseforge.com/minecraft/mc-mods/aqua-acrobatics)             | <nobr>AquaAcrobatics-1.15.3</nobr><br><nobr>AquaAcrobatics-1.15.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.17.1</nobr><br><nobr>zenutils-1.17.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/301/90/30/30/637360994847173146.png"             > |                       [**Particle Culling**](https://www.curseforge.com/minecraft/mc-mods/particle-culling)            | <nobr>particleculling-1.12.2-v1.4.1</nobr><br><nobr>particleculling-1.12.2-v1.4.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/417/700/30/30/637642020488223140.png"            > |                          [**RandomTweaker**](https://www.curseforge.com/minecraft/mc-mods/randomtweaker)               | <nobr>RandomTweaker-1.4.4</nobr><br><nobr>RandomTweaker-1.4.5</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.25.3</nobr><br><nobr>HadEnoughItems_1.12.2-4.25.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/827/842/30/30/638215109388605628.png"            > |                          [**ConfigAnytime**](https://www.curseforge.com/minecraft/mc-mods/configanytime)               | <nobr>!configanytime-3.0</nobr><br><nobr>!configanytime-3.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/874/755/30/30/638296262646953159.png"            > |                [**Alfheim Lighting Engine**](https://www.curseforge.com/minecraft/mc-mods/alfheim-lighting-engine)     | <nobr>Alfheim-1.3-Dev-2</nobr><br><nobr>Alfheim-1.4-Dev-1</nobr>
-----------

## ⚡ Performance Improvements

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3a2057b9e1b6c6b7e5feca34b4c54fc0bc1c8391)⚡Disable HEI `Search resources ID (prefix: &)`
  > Should speed up HEI loading a bit. Never saw anyone used that.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/62aa59e1b83508a96e8fb72ebd98a8777c73a75b)⚡Disable QMD Tungsten Carbidide tools
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6af7950053aafee863fbe5d578c6020f5b624d45)⚡Remove ~200 unused ThermalFoundation tools & armor
  > Before this change, ThermalFoundation registered about 200 items - various pickaxes, shears, horse armors with almost every metal from the mod. All this stuff was already disabled since we have TConstruct.
  > 
  > Now this items wont be registered at all, including all their Pulverizer, furnace, and other recipes, saving modpack loading time and RAM usage a little.

## ✨ New Features


#### Docs

* <img src="https://i.imgur.com/rKWWoGq.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f060a9dae2bef7fa001cdc41eee308ca6e980278)📝Add message when mods missing due wrong installation
  > This happens on third-party launchers like Prism if you skip important step.
* <img src="https://i.imgur.com/H47HHqd.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7d756d2bbc18e861c29ce3075877718753992aa8)📝Add message when player creating Skyblock world wrong
  > 

## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f59cd0acdfc6f77d64c469ebeca69e8a5bde2bb4)📄Set `The maximum height of the recipe GUI` 350=>550
  > to fit even more ricepes on small gui size
* <img src="https://i.imgur.com/itaCdBD.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f34bf345891a5ceb02c5e0826aa0c586a18879ae)🔌IC2: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__22.png "Nuclear Reactor") increase power tier to `7`
  > Now reactor's power output capped to 524,288 EU/t (was 32k).
  > 
  > This fix needed to maintain high-output reactor setups
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f2b0b1357cac845f552f4cbbd711252144026729)🧩Disable "Flaming Arrows" featire
  > Allows skeletons to shoot flaming arrows when on fire (30% chance * regional difficulty)
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5939b5d8091c3b66e4d3137d4ca4727502590add)🧩Disable Librarianlib mod options `enchantment_glow` and `potion_glow`
  > Dont know what they do so better safe than sorry.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fe386a0725071b6d3cf74929e227648c4b07c36f)🧩Disable picking up Skeleton's ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/arrow__0.png "Arrow")
  > Also disable "Whether burning arrows can set blocks on fire."
* <img src="https://i.imgur.com/1FfHCO7.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f720aec0358ca410e0b0c1a17adfec0b2ad69b39)🧩Enable by default "Better Placement" feature
  > Now you can place lines of blocks more comfortable and faster by just holding right-click.
  > 
  > Side effect - now you can deposit all items into Drawers only when hand is empty: https://github.com/ACGaming/UniversalTweaks/issues/416
  > 
  > The majority on E2E-E server voted in favor of enabling this setting.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/952bbdc4c78803da76c4a9f1346030a32c917c6f)🧩Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/quark/monster_box__0.png "Monster Box") sometimes not working

#### Docs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bb3163a4e7d3657a51e3f66f8d23a0a10e43d24f)📝Add tip about `/tmg_deathlist [TAB] [TAB]` command
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b1c432366583e1ef8c6684654b757b4e55f0ee08)📝Move tip about High Oven to quest instead of Tips

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ada5abbb408fb2db259dc6d39fe208b47a15e8a0)🌍Add missed ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/ingredient__11.png "Golden Egg") source

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ea696710062fe58565557218c56678aa9d7ba07f)📖Fix "Obelisks" quest pos
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8df736c79be4401d3dbddd36b90a73ecee3ed461)📖Ignore NBT for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/itemcreativebuilderswand__0.png "Creative Builders Wand")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/724c100d7bd4610a52ef3e2c647e42f6ed99538e)📖Make Crafty Crates be valid task items for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/table_elite__0.png "Elite Crafting Table") quests
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/84fd14e973376cf89c948819d07daa8cc69678e7)📖Remove Pipette from reward
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/785297bc1bb44dbe4a2b03201220649e055d7803)📖Skyblock quest add other type of Creosote

#### Recipes

* <img src="https://i.imgur.com/hRPKATv.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fcaea7a86e53b3513f6d7f01868aa32b8490d008)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania_tweaks/basic_extended_crafty_crate__0.png "Basic Extended Crafty Crate")![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania_tweaks/elite_extended_crafty_crate__0.png "Elite Extended Crafty Crate")![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania_tweaks/advanced_extended_crafty_crate__0.png "Advanced Extended Crafty Crate") now have separate recipes
  > Idea is to make possible to reach endgame in magic-only playthrough.
  > 
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania_tweaks/ultimate_extended_crafty_crate__0.png "Ultimate Extended Crafty Crate") still wip and unfinished yet
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f2e86eac57711cb62833f2718112d347860c15b9)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/ore__1.png "Ardite Ore")![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/ore__0.png "Cobalt Ore") by Portal Spread harder
  > Now they require more advanced blocks to convert from. This change will interfere players to cheese Mining Level quest skipping visiting Nether.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8c970d9ff8bbbc2a586e264b1c0be59f03a5edba)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crushed__0.png "Crushed Copper Ore") add missed ![](https://github.com/Krutoy242/mc-icons/raw/master/i/libvulpes/coalgenerator__0.png "Furnace") output
  > Also add for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crushed__4.png "Crushed Silver Ore")![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crushed__5.png "Crushed Tin Ore") and their Purified variants
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2eaf56c69148b68a37659b61bd40b29c3f5a429e)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/cluster__0.png "Native Iron Cluster") now ouput ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/iron_ingot__0.png "Iron Ingot") instead of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__0.png "Pulverized Iron")
  > Also fix other Native Clusters that outputted dusts when have ingot variant.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/da1ee9f887effa21feeec72838cb26ec84bfdf70)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/omniwand/wand__0.png "Omniwand") remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/travelersbackpack/hose__0.png "Hose") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/iceandfire/dragon_horn_fire__0.png "Dragon Horn")
  > This items break Omniwand
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/74030aa95488e2d80777cc3685cb6c17eec73149)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ftbquests/chest__0.png "Quest Chest") remove fuel value
  > Just unused item
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9cff7af9d935751249f4c50c059f817df0a56acc)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/table_ultimate__0.png "Ultimate Crafting Table") harder
  > Now require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__11.png "Ultimate Catalyst")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d00cff3ff62285ee0c4dacb10e69623726343501)✏️fix 8 ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/obsidian__0.png "Obsidian") => 576 ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rats/garbage_pile__0.png "Garbage Pile") exploit
  > Weaken the contribution of block hardness to the resulting Garbage count, which would fix an exploit with Obsidian's chiseled blocks.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8b200a2fad0266cb289bde1ab4845d816faa5215)✏️fix all benefication recipes with non 100% output
  > Fix a bug, where processing recipes, such as crushing Dirty Gems in SAG Mill does not output third items because it was less than 100% chance of output.
  > 
  > Also fix some other recipes with chanced output.
  > 
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/328
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d9001640f4236da4eb33cdf42c6487e15ca89ef6)✏️Harder CAD Assembly recipes from `psideas` mod
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8242832ce54dcdede055f03da57048161e0bcd15)✏️Purge ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__0.png "Oak Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__2.png "Birch Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__4.png "Acacia Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__6.png "Framed Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__3.png "Jungle Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__1.png "Spruce Framed Chest")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bibliocraft/framedchest__5.png "Dark Oak Framed Chest")
  > Framed Chests **significantly descrease FPS**.
  > I recommend remove all Framed Chests from your base to visibly improve performance.
  > 
  > Also, Framed Chests cannot be used with many pipe types like Conduits. Cannot be used with Vaultopic and erroring when pressing "Y".
  > 
  > From now on, this chests will be hidden and uncraftable.
  > 
  > Also, this change removes Framed Chests from quest rewards.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c36ad2179d419979315e5a090aae048170ca440f)✏️Remove and hide ![](https://github.com/Krutoy242/mc-icons/raw/master/i/aeadditions/storage.casing__1.png "Fluid Storage Housing")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/87622eb59c457832c0d91754059a79b7acf34e82)✏️Remove Demonic Will melting in Magma Crucible
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d08d157d59185bc7074c02b90dc457432475b2c7)✏️Remove empty output recipe in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/altar__0.png "Blood Altar")
  > Prismarine shard turned to nothing
* <img src="https://i.imgur.com/FkPOfpa.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b2e6f7d772848c5cd7fe5057a3b3cd704a7f2953)✏️Use unstackable tank where was a Bucket
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__101.png "Signalum Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/rftools/booster__0.png "Booster")![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/firewood__1.png "Firewood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/actuallyadditions/block_xp_solidifier__0.png "Experience Solidifier")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/drum__3__4b753a04.png "Demonically Gargantuan Drum")![](https://github.com/Krutoy242/mc-icons/raw/master/i/industrialforegoing/crop_recolector__0.png "Plant Gatherer")![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/machineblock2__6.png "Chemical Dissolution Chamber")![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/fertilizeddirt__0.png "Fertilized Dirt")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/crystal_vitium__0.png "Flux Crystal")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e0af39eaceec03ee1b7be1fe2fbd9a9de2ec1ece)🍇Remove "End/Nether Explorer" villagers
  > They had only 1-2 trades so looked unfinished. Their trades now merged to "Tinkerer" villager
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6124ed5f107f5d8d3f879c5a145fd66535fe69f8)👃![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_decoration2__4.png "Creative Buffer (decoration block)") add trade to "Tinkerer"
  > This is highly expert trade to get ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/table_elite__0.png "Elite Crafting Table") without a single RF or magic.

#### Server

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/17e973f50af8ec5617f1341ac0bdf371a59826e8)💽Remove "remove folders" server update guide step
  > You dont need to remove folders anymore - **Server Starter** can do it for you.

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2fd5a8fd37fe2bccdfc5ac77dd6acfe854efdea4)🌍![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__66a99e1c.png "Zotzpyre Soul") keep only TwilightForest in spawn biome list
  > This should not change anything because they already spawn only in TF
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b2899eeade145cc1a3cdb008b5cb069c24763091)🌍Add loot to all village chests
  > Before, about 20 structures from villagers had no loot in their chests. This happened because Village houses doesnt had loot in chests at all - this feature just wasnt added.
  > 
  > Remember, only newly generated houses will be fixed.
  > 
  > Many players considered this as a bug. So I spend 5 hours to reload all the village houses without loot and add it.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0a8f84d86eb6b6d9c7ad1e06e841dc89143399d8)🌍Discrease amount of Sandwiches in village chests
  > There was unreasonable amount of sendwiches (around 32 average).
  > Now it would be only 5 average.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9b4ac9faa7713d5f91d1c63ead1f741aad337fac)🌍Fix "SavannaEdge" had no mob spawn in it
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e1360a409af8bb2f667aa77c8f57c76aa924f3b2)🧰Disable ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/minecart__0.png "Minecart") => [Lootr Chest] conversion
  > fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/326



