# v1.30.0 (2024-2-4)


## ⚡ Performance Improvements

<img src="https://i.imgur.com/yooPob2.png">

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/974c3bfca7b5a1cb2691dd262cdbab338e842607)⚡Disable creating on ~5000 smeltery recipes
  > <img src="https://i.imgur.com/HPtCGCd.png" align=right> What removed:
  > - All `tool part => metal` recipes.
  > - All "OredictMeltingRecipes", such as clock => gold.
  > - Mostly all cast forms recipes.
  > - Clay casts.
  > 
  > What left:
  > - All brass casts can be made only from `stone` tool parts (with exceptions such as Bow String).
  > - Special casts such as Gem or Plate could be made only from subset of sources.
  > - Blocks, ingots, nuggets, ores can be melted as before.
  > 
  > Also, removed clay casts since are barely used in game - each player probably used them once in whole playthroug. Still, they created 1000+ recipes, that ofc add load time and RAM consumption.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1b524031466a99437532d3e281388aae530d818d)⚡Remove ~1500 ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/squeezer__0.png "Squeezer") capsule recipes
  > <img src="https://i.imgur.com/1mvl4Zc.png" align=right> This change related to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/can__0.png "Can") ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/capsule__0.png "Wax Capsule") ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/refractory__0.png "Refractory Capsule")
  > 
  > - Remove useless squeezer recipes, when forestry cans and capsules with every liquid in game could be squeezed.
  > - Remove all usages of those capsules and cans.
  > - Hide from JEI
  > - Also ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/honey_pot__0.png "Honey Pot") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/ambrosia__0.png "Ambrosia") cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/313706ef68390cf28dee64eb0e1685d4dc7ade50)⚡Turn `Native Clusters` into Dirty ores instead of benefication
  > <img src="https://i.imgur.com/eRMOBuG.png" align=right> Before, 46 Thaumcraft's Native Clusters could be beneficated with 17 various machines.
  > 
  > Now, 6 Clusters could be converted into 1 Dirty Ore, thus keep their 1=>2 bonus ratio, but also allowing to process them in different machines after.
  > 
  > This change will remove 782 recipes of 17 various machines, descreasing game load time and RAM usage.

## ✨ New Features


#### Recipes

* <img src="https://i.imgur.com/FflgvfX.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/25f585eb23da7f9291d9555c56e0b46cba3328c5)✏️Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/arcfurnace__0.png "Electric Arc Furnace") advanced alloy recipes
  > Add recipes for those blocks: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_alloy_endergy__1.png "Crystalline Alloy Block")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_alloy_endergy__4.png "Crystalline Pink Slime Block")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_alloy_endergy__2.png "Melodic Alloy Block")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_alloy_endergy__3.png "Stellar Alloy Block")

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3639dcb43b3324105138baf0b9918738724bf1dc)⛺EntityCulling fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/block_tele_pad__0.png "Telepad Block") culled
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ce989e5c88434d8b175d0b33d8daa96c34f24331)🤖Update LostUser to `v3.8.0`
  > - fix: `error()` not working

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/40652afb21ca7806f0457ee916c68354de3d108b)🧩Add `hose` and `tool` in whitelist for [Omniwand]
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/88275497441e8fdfc1652a984f579bb1d01b8d02)🧩Enable hotbar auto refill
  > Seems like Quark's auto refill option disabled it https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/de834ed7a5769b8447bb4bdf6175ee771746c5fb
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2e0c9d87a770aa2dbe220538707c30d3f315d1fe)🧩Make ![](https://github.com/Krutoy242/mc-icons/raw/master/i/travelersbackpack/hose__0.png "Hose") inside upgraded [Omniwand] comes pre-attached to tank 1

#### Hotkeys

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3924b71d03375a1866ec6efda5e7195ca085f989)🎹Misc default hotkey changes

#### Patchouli

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/261c410ce2f8e523a56b1847c7ab63f6f5be759d)📝Update Patchouli book uu-matter page and tips page
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/85d51f2995ec4146a237dd00c8946e961fc28340)🌿Add note `to visit Void world`

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1bccc531fe33660cf31f0b50fd9d8cb347204ce7)📖Fix `Skyblock` chapter name
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/20051c293e6d6b4ac8ad593ee6dfed32784471de)📖Fix wrong color of `!` symbol in Capacitor quest
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7285b08912af95a05013060229a13f462c7d017e)📖Whenever quest rewards gives you Inventory System storage its come up precharged

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e33282ac9dbc3d92d0be34cdd41d88ae30540700)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/deepmoblearning/data_model_guardian__0.png "Guardian Data Model (Faulty)") now not requre Elder Guardian
* <img src="https://i.imgur.com/ltyNrXC.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b034a50d76f37e4c64237563714503c7798d486f)✏️Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/metal__4.png "Block of Pigiron") high-tech recipe
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/68e128d722a963331113a367d589625948cfa8e0)🐜Balance Myrmex trades
  > - Some recipes output more resin
  > - Some require less input
  > - Add new trades for Serum, Pollen and Butterflies

#### Server

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/47b678f0315671d9e17c306fba34d88f14fc94e1)💻Fix server-starter script malfunctioned
  > I forgot to remove test `overrides/` folder copy that caused unable to startup server.

#### Tooltips

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e6dfc1718d9ef2e37b6ec0ed1d5fc88af1c287ad)📝Fix some tooltips doesnt have new line
  > I have de ja vu, because it feels I already fixed this before 🤔



