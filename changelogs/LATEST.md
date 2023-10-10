# v1.22.0 (2023-10-10)

## Mods changes

### 🔴 Removed Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/225/856/30/30/637041913500022836.png"            > |                        [**Mineral Tracker**](https://www.curseforge.com/minecraft/mc-mods/mineral-tracker)              <sup><sub>MineralTracker-0.9.3.jar                         </sub></sup><br>Automatic map-based tracker for your Immersive Engineering and TerraFirmaCraft minerals. Supports Immersive Petroleum and TFC:Metallum out of the box.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.14.13</nobr><br><nobr>zenutils-1.14.14</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/324/397/30/30/637440163997600019.png"            > |                    [**Kiro's Basic Blocks**](https://www.curseforge.com/minecraft/mc-mods/kiros-basic-blocks)          | <nobr>kirosblocks-1.2.1</nobr><br><nobr>kirosblocks-1.2.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/30/30/637520208754289091.png"            > |                            [**CensoredASM**](https://www.curseforge.com/minecraft/mc-mods/lolasm)                      | <nobr>censoredasm5.16</nobr><br><nobr>censoredasm5.17</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/551/59/30/30/637888242565991470.png"             > |                              [**ModularUI**](https://www.curseforge.com/minecraft/mc-mods/modularui)                   | <nobr>modularui-2.2.2</nobr><br><nobr>modularui-2.2.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/557/657/30/30/637904734114975779.png"            > |                  [**Inventory Bogo Sorter**](https://www.curseforge.com/minecraft/mc-mods/inventory-bogo-sorter)       | <nobr>bogosorter-1.4.1</nobr><br><nobr>bogosorter-1.4.3</nobr>
-----------

## ✨ New Features


#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/801237f9a188812c06a33b264f60b20dfe7ca6f0)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/wooden_door__0.png "Oak Door") now just destroyed with `Portal Spread`
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a69d321605780fd5760bdbbb4fd07a07d0187098)✏️Myrmex Royal now selling ![](https://github.com/Krutoy242/mc-icons/raw/master/i/gendustry/honey_drop__16.png "Narcissistic Honey Drop") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/gendustry/honey_drop__15.png "Selfish Honey Drop")
* <img src="https://i.imgur.com/ERnDTc2.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c0f97e5ee894b94efc4f062e0822832f96031e4a)✏️rework Myrmex Worker's trades
  > Now they buy modded items instead of only vanilla.

#### Worldgen

* <img src="https://i.imgur.com/i0dZhxm.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a4ed0996fe815470bfc62775988c5b8bd3d1a0bf)🌍![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/block_depleted_curium__0.png "Curium-246 Block") now generates in Deep Dark
  > 

## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4a19e5c345c28cd52e6ec17c13692e8014b5c4ed)💻![](https://github.com/Krutoy242/mc-icons/raw/master/i/opencomputers/tool__5.png "Nanomachines") attempt to fix dissapear on server rejoin
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0f8f818f3f4e57b4004e7254a3ffd330475fbf65)🧩Disable notifications for XaeroMinimap update
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6117c04bf2bc213852a7e0ce806dc12843026809)🧩Do not forbid Torcherino
  > PlusTweaks was unable to place Torcherino. Why not, if player want.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fd621b86910747b22512334afcdaf66ecfc758c5)🧩Fallback config for `serializationisbad`
  > > Contributed by [ZZZank](47418975+ZZZank@users.noreply.github.com)
  >
  > Currently `SerializationIsBad` will download latest configs, which works fine in most cases.
  > But if the internet connection is bad, and no pre-made configs for SerializationIsBad, a hard crash will happen:
  > ```
  > RuntimeException: You are currently using SerializationIsBad without any patch modules configured.
  > ```
  > 
  > We provide a pre-made config for SerializationIsBad, so that when the internet is down, the game can still launch using provided fallback config.
  > 
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/269
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bad65cbdd97c943432d807f1576f9b1001e9e755)🧩XaeroMinimap tweak some configs
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6bb01ad9e6b7a118a805619be41a39e90dd2dff6)Improve zh_cn localization
  > > Contributed by [ZZZank](47418975+ZZZank@users.noreply.github.com)
  >
  > - Fix `hand over your items` messages
  > - Add some localizations for custom ContentTweaker blocks and fluids
  > - Add portal spread Chinese localization

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0729b8a9b7c8ba6e139488fbf5fe60fa66408068)📖![](https://github.com/Krutoy242/mc-icons/raw/master/i/buildinggadgets/buildingtool__0.png "Building Gadget") fix quest name
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/74920e4b52884828a558a2ea36ed6e020c4ab63e)📖Remove tip about removed Mineral Tracker mod
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8aaec6da1712f1bb05cc3c3774d11d9b7c2df7ee)📖Warning for maxing ic2 crop stats
  > > Contributed by [Gabisan2](47882171+Gabisan2@users.noreply.github.com)
  >

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ac68cc76b1f18d3d7bc46db7cfc3ce34570282e4)✏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/conglomerate_of_life__0.png "Conglomerate Of Life") sometimes drop x64 fur balls
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f6c3f152392b5896b20f8849785e9cd9d135f231)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/oreblock__0.png "Osmium Ore") fix "require silktouch" in JER tab
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1df0ef5b41f3c0dd8ee5e0b4e6cf49e68f315bab)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/astralsorcery/blockcustomore__0.png "Rock Crystal Ore") remove from `Portal Spread`
  > Somehow, it wont transform.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7898702d8d0a7006cf279ac9dad7946b9f11a3ba)✏️add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/endreborn/block_wolframium_ore__0.png "Tungsten Ore") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/endreborn/item_ingot_wolframium__0.png "Tungsten Ingot") recipe in Arc Furnace
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1a54541ddb23503e46b1e3ec092798682f5920f7)✏️Add alt ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crafting__15.png "Carbon Plate") recipe
  > Also make [Compressed Charcoal Blocks] hight resistant to explosions
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/67bad41e06ce4957a79181d7cad3d8b82ecd7d5e)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/harvestcraft/soggygarden__0.png "Soggy Garden") not drop Rice
* <img src="https://i.imgur.com/7NPfVrN.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bad6b156f4990cc8c3b9b2c10acf663b832b3412)✏️fix heads of some mobs when killing with `Beheading`
  > - Wither
  > - Llama
  > - Bat
  > - Horse
  > - Skeleton Horse
  > - Zombie Horse
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/76b8b0bd20781afd8426d4d34783a19a424626d1)✏️prevent dupe of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/lzh_condensator__0.png "LZH-Condensator")![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/rsh_condensator__0.png "RSH-Condensator")

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/749c045bb3d327632b64b0f39e64ea943729e770)🌍![](https://github.com/Krutoy242/mc-icons/raw/master/i/twilightforest/aurora_block__0.png "Aurora Block") fix ingredient in recipe
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f98b66088467844b476c86752dc6d86b43bf0a47)🌍Add hint about turning `UU-Metal Ore` into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconevo/metal_block__8.png "UU-Metal Block")



