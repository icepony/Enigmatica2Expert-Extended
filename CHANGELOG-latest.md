# v1.28.0-beta (2024-1-20)
## Mods changes
### 🟢 Added Mods

Icon | Summary
----:|:-------
<img src="https://media.forgecdn.net/avatars/thumbnails/843/993/30/30/638240773247477634.png"            > |   [**Neeve's AE2: Extended Life Additions**](https://www.curseforge.com/minecraft/mc-mods/nae2)                         <sup><sub>nae2-1.6.1.jar                                   </sub></sup><br>Adding convenience for whatever frustrates me.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.16.3</nobr><br><nobr>zenutils-1.16.5</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/334/385/30/30/637468213328449243.png"            > |                       [**Precision Mining**](https://www.curseforge.com/minecraft/mc-mods/precision-mining)            | <nobr>PrecisionMining-1.12.2-5.2</nobr><br><nobr>miningspeed2-1.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/483/123/30/30/637782695232246251.png"            > |           [**AE2 Unofficial Extended Life**](https://www.curseforge.com/minecraft/mc-mods/ae2-extended-life)           | <nobr>appliedenergistics2-rv6-stable-7-extended_life-v0.55.29</nobr><br><nobr>ae2-uel-v0.56.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/548/30/30/30/637882959576383371.png"             > |              [**AE2 Fluid Crafting Rework**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)   | <nobr>Fluid Craft for AE2-2.5.3-r</nobr><br><nobr>Fluid Craft for AE2-2.5.5-r</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/676/130/30/30/638066753607299461.png"            > |                     [**Deep Mob Evolution**](https://www.curseforge.com/minecraft/mc-mods/dme)                         | <nobr>DeepMobEvolution-1.12.2-1.2.1</nobr><br><nobr>DeepMobEvolution-1.12.2-1.2.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/875/257/30/30/638297518410895292.png"            > |                        [**ZenRecipeReload**](https://www.curseforge.com/minecraft/mc-mods/zenrecipereload)             | <nobr>zenrecipereloading-1.2.1</nobr><br><nobr>zenrecipereloading-1.2.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/908/439/30/30/638360340448042423.png"            > |                [**Just Enough Magiculture**](https://www.curseforge.com/minecraft/mc-mods/just-enough-magiculture)     | <nobr>justenoughmagiculture-1.12.2-1.1.0</nobr><br><nobr>justenoughmagiculture-1.12.2-1.1.2</nobr>
-----------

## 🐛 Fixes


#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bcf42aed436a476e08a2caa102c756c3b54f462f)💥Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/colossalchests/chest_wall__0.png "Colossal Chest Wall") crash server when pushed with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/piston__0__c44316ae.png "Piston")
  > Now its forbidden to push them
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/cd04e73113e6a957b3fcba9cf4b4d2ffaebc7573)💨![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanismgenerators/generator__6.png "Wind Generator") fix higher => more power
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d32bce25404dccf28bdad7808918a3cf2127126f)🤖Remove Robot names visible in world
  > This caused huge strings floating on heavy LostUser usage
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bc83a1307e9b008b56c61c2aacb798f1fe0a27f4)🧰Remove Quark's inventory sorting button from creative inventory

#### JEI

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5d29f0d95e1c9e4bd0fdfcf5970442e9a8914ffd)🧟Disable Ice And Fire JER villagers
  > Because villages was already removed
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2d49a4565df15ec8398bb77fd3c24e244783414b)🧟Fix some JER entries (like Myrmexes) duplicates
  > Related https://github.com/Invadermonky/JustEnoughMagiculture/issues/1

#### Mods

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a16a6f3a20161a77d1ffc26c6e8e1efe0e3ab386)🔵Try to disable `Get Bogod!` message again
  > Seems like 0.0 value won't help.

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e69619dc3f266f9c57c6f3394bc5195a3707c6e1)📖Add note about ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/mithminite_hood__0__2df9032b.png "Mithminite Hood") degrade tools
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/072d8803e8aa3c94efa6d6ede138fb78b64bb4b8)📖Temporary fix *chapter finishing message* on servers

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/38eb0d69059c7ad9fdf7878b905df8d2279bae08)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/cover__0.png "Pump Attachment (LV)")![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/cover__1.png "Pump Attachment (MV)") way cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/fa05bcf131d285f4488f6a322855c7a60d895885)✏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advgenerators/turbine_adv_alloy__0.png "Steel Turbine") upgr => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advgenerators/turbine_manyullyn__0.png "Manyullyn Turbine")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/6f0bdb3f02dc81bab7ee03a163221e380f4f2855)✏️fix Wood=>Planks recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/machine__2__45e2e59d.png "Sawmill (Basic)")
  > This fix removed some deprecated Forestry recipes that somehow fix issues with Sawmill.

#### Skyblock

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0137502ddab58f73ad9b55afd37368d1689927fb)✏️Fix teleportation with Enigmatica book into Skyblock dimension



