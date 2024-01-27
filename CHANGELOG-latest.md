# v1.29.0 (2024-1-27)

If you update from latest release version `v1.26.0`, you might need to read this changelogs too:
- [`v1.27.0-alpha` Performance improvments](https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/tag/v1.27.0-alpha)
- [`v1.28.0-beta` Add NAE2](https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/tag/v1.28.0-beta)

## Mods changes

### 🔴 Removed Mods

Icon | Summary | Reason
----:|:------- | ------
<img src="https://media.forgecdn.net/avatars/thumbnails/149/435/30/30/636589195848287973.png"            > |                            [**Lilliputian**](https://www.curseforge.com/minecraft/mc-mods/lilliputian)                  <sup><sub>lilliputian-1.0.jar                              </sub></sup><br>Configurable mob sizes | Caused lot of lags
-----------



## ⚡ Performance Improvements

* <img src="https://i.imgur.com/xj5QE2p.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3cf4d66c8b78bc27a23797e55e1cc97915a39a78)⚡Disable transparent rendering of Mekanism's Cables
  > Just 20-100 blocks of this cables could cause ~5% FPS lag

## ✨ New Features

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/cfb1137fb442406e71b56ae63138e166901e14a5)🌳Significantly buff ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/magic_log_core__0.png "Timewood Clock")
  > Before this change, each second Tree of Time chose 72 blocks in 16 blocks radius and called additional TileEntity tick and RandomUpdate tick
  > 
  > Now its:
  > 
  > - **Radius** reduced to 8 blocks that makes random ticks ~150 times more likely happen
  > - **Blocks count** each second 72 => 144
  > - **Random updates** now happens 8 times in a row
  > - **TE updates** now called 64 times at once
  > 
  > This would make ![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/magic_log_core__0.png "Timewood Clock") possible to use even for IC2 crops or some machines.
  > 
  > Also, since its effectively increasing RandomTicks updates, it open doors for unique new automations - there is no other blocks that could increase random ticks.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7742d94b58a748ab53a372236d5688b74764b6ff)🌿Patchouli: Add note about book let you visit skyblock

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bc04e20adf33084e86d90e156102e21596900010)📖Completing Harvest Level 7 will grand The Nether access for every team member

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/53e889b9786da14c3c181e0fda25ff2e53c8f8d9)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/jackhammer__0.png "Jackhammer") add built-in excavator
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a8cf1af3c3f1dc510c0862fce5e9ed03e8093a22)✏️[Omniwand] add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/iceandfire/myrmex_desert_staff__0.png "Desert Myrmex Staff")![](https://github.com/Krutoy242/mc-icons/raw/master/i/iceandfire/myrmex_jungle_staff__0.png "Jungle Myrmex Staff")![](https://github.com/Krutoy242/mc-icons/raw/master/i/travelersbackpack/hose__0.png "Hose")
* <img src="https://i.imgur.com/vTPgMgr.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3f3ee714ab2691c4148d951861a7e27ba5731f01)✏️Add lot of new trades for 6 villagers
  > New trades for:
  > - Alchemist
  > - Farmer
  > - Necromancer
  > - Outfitter
  > - Red Mechanic
  > - Redstoner
* <img src="https://i.imgur.com/KBPCryO.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0dab3e48bf8fc151bca7aed25c83d9d073fdfafd)🐜Rework many Myrmex trades for `Sentinel` and `Royal`
  > Now Sentinels sell lot of Resin for rare resources and Royals buy it for goods.

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a910f5214e864e93a68b0dda5129ec3b3aeb56fb)⚡Return ![](https://github.com/Krutoy242/mc-icons/raw/master/i/endreborn/food_ender_flesh__0.png "Mysical Flesh") since its causing crashes on ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__52a80bc3.png "Enderman Soul") killing
  > Fixing https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/323
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/40a2b69020790bf31843a630f4bb870d39bcbe09)🐛Disable almost all Random Patches features
  > Random Patches causing crashes more and more times. Also, I fund many fixes that actually was fixed by other mods or not used at all.
  > 
  > So I kept only important ones, disabling all other features.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d4cc44cf220cac1785e418c84fe3410f238ca7d1)🦯Misc Thaumcraft fixes
  > > Contributed by [TabakaSIM](78695622+TabakaSIM@users.noreply.github.com)
  >
  > * Fix [Mithrillium Scythe] augmenting (+ lore validation)
  > * Changed quest rewards for thaumcraft focus tiers
  > * Update pills textures
  > * Added some mithminite scythe effects as exception to bosses
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8f99b63ebe5d90a804ce96fa5da79a9f88d69ca6)🧤Fix some items activated when giving other player
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/78e4506d2ec40608c77ee4635ff5a387cf3fce96)Increase `Packet Size` twice
  > Dont know if this actually works, but could fix some disconnects

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0a405f686a842213b97f4644709e12a949d49045)🧟Fix `Ice And Fire` JER trades integration
  > Was accidentally removed Myrmex trades last patch.

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/34d369a2ba37532dbf0b311887d329b308ef159b)📖Add `Crafting` upgrade requirments for `Compressing` LostUser program
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c95f25e6a3070aa8bf915d62a44bd142c8198faa)📖Add note about Assembler+Battery+Bottle
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c3cbdb8f583fa1e529e2690fe45fb66e087b0ef4)📖Fix chose rewards icons match actual amounts
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2a451684e87d1c133583cd8bd976acddd01ca244)📖Fix RU desc of quest
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c886a72efeb4674630c6d9613fe62035eb9b4d1a)📖Piston Rewards add amount of reward
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4812634e4d72b96f71b56f4d0218e3a9eb38b604)📖Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/curio__3.png "Eldritch Curiosity") rewards since newbies eat them all at once
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f59957e36af161c70a49c96a8b1a1682cf77c33b)📖Remove `Morphin Tool` mention

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ea5e04e333a4bcaeb40c06bb3e8bb5d68a9100d9)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/appliedenergistics2/crafting_accelerator__0.png "Crafting Co-Processing Unit") harder
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0cbd787e64315566b74c6cc580f8c09ac839d0c1)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/stone_ancient__0.png "Ancient Stone") make skyblock recipe output x64 blocks
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/229cd60d44e3407b42af5a1623174872f7abc1fa)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/clear_glass__0.png "Clear Glass") add alt recipe
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/99462c8d0e98963e190ef103acf5e66c2e08fc3f)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/gastank__0__12ff18c8.png "Creative Gas Tank") replace ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/fluid_exhaust_steam__0.png "Exhaust Steam") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/fluid_high_pressure_steam__0.png "High Pressure Steam")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e22670fe6f4a8195725c5fac527488de12269ff8)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/oak_stick__0.png "Impregnated Stick") add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/opencomputers/transposer__0.png "Transposer") recipe
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7ada2499aae307212a31522e8a7cc21dafdd3bee)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/pech_wand__0.png "Pech Wand") add peaceful alt recipe
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ae3cac9579584334b12e1fa63b0f9ac483f2430a)✏️[Reconstruction Chamber] harder
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d23024c8ef794d17570050c254d59252cf1e183c)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/botania/rune__2.png "Rune of Earth") replace ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/peat__0.png "Peat") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/biomesoplenty/ash__0.png "Pile of Ashes")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7b492aba0c790f2741825831c5b03d49e9990076)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__30a66b29.png "System Glitch Soul") make unable to spawn with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/actuallyadditions/item_spawner_changer__0.png "Spawner Changer")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c79f81fb992a2ddd9566064a2404961f24c556d4)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/trinity/trinitite__0.png "Trinitite-covered Sand") add magic-only alt
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1c73bd982df6a81aba40524643106b57c9dfe13c)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/item_ore_tungsten__1.png "Tungsten Ore Chunk") make conversion into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/endreborn/block_wolframium_ore__0.png "Tungsten Ore")
  > This would fix weird bug when ![](https://github.com/Krutoy242/mc-icons/raw/master/i/environmentaltech/void_ore_miner_cont_1__0.png "Void Ore Miner Controller Tier 1") mining Ore Chunks instead of Ore only on servers
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/def288efddbe5c4e34ba3e967d400053b0d02107)✏️Buff `Inventory System Storages`
  > - Significantly buff inventory size (up to 5000 slots)
  > - Recipe come up with already precharged block, enough to run 1.5 realtime years
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/aea91c37ca292a09f28d587f1f37c893c9d7ef3f)✏️Fix amount of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/alloy__1.png "Tough Alloy Ingot") in Platings recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/precisionlaseretcher__0.png "Precision Laser Etcher")
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/part__3.png "Elite Plating")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/part__2.png "DU Plating")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/part__1.png "Advanced Plating")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bc7f64449ba85820eea18530ffd62ce8ce9e74a9)✏️IC2 pipes way cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8c964f33e1f0d7fff18a6bd349919e5044d66085)✏️Improve ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/californium__0.png "Californium-249") and [Californium-252] dragon loot
  > Now 249 and 252 isotopes spawn in those chests that will effectively allow to craft fuel pellet.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1874c959889c92d346779b8fbb441bc3f6dc5af3)✏️Move 256+ Storage Cells from AE2Additions to NAE2



