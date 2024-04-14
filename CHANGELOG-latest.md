# v1.37.0 (2024-4-14)

### If you update from `v1.26.0` or older versions:
Many players reported that after update their world freezed.
I [already written that](https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases/tag/v1.29.1), but players who update from `v1.26.0` or older versions must delete the file `saves/[world name]/data/biometweaker_asmtweakdata.dat`.

## Mods changes
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/92/854/30/30/636258666554688823.png"             > |                        [**Xaero's Minimap**](https://www.curseforge.com/minecraft/mc-mods/xaeros-minimap)              | <nobr>Xaeros_Minimap_24.0.1_Forge_1.12</nobr><br><nobr>Xaeros_Minimap_24.1.0_Forge_1.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/159/374/30/30/636658415780463602.png"            > |                          [**CraftPresence**](https://www.curseforge.com/minecraft/mc-mods/craftpresence)               | <nobr>CraftPresence-2.3.7+1.12.2</nobr><br><nobr>CraftPresence-2.3.7+1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/196/654/30/30/636886857118683130.png"            > |                      [**Xaero's World Map**](https://www.curseforge.com/minecraft/mc-mods/xaeros-world-map)            | <nobr>XaerosWorldMap_1.38.1_Forge_1.12</nobr><br><nobr>XaerosWorldMap_1.38.3_Forge_1.12</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/358/827/30/30/637520208754289091.png"            > |                            [**CensoredASM**](https://www.curseforge.com/minecraft/mc-mods/lolasm)                      | <nobr>censoredasm5.19</nobr><br><nobr>censoredasm5.20</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/807/535/30/30/638176807291603882.png"            > |                 [**Not Enough Energistics**](https://www.curseforge.com/minecraft/mc-mods/not-enough-energistics)      | <nobr>NotEnoughEnergistics-1.12.2-2.0.7</nobr><br><nobr>NotEnoughEnergistics-1.12.2-2.0.7</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/548/30/30/30/637882959576383371.png"             > |              [**AE2 Fluid Crafting Rework**](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)   | <nobr>Fluid Craft for AE2-2.5.9-r</nobr><br><nobr>Fluid Craft for AE2-2.5.10-r</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/799/138/30/30/638161375254345080.png"            > |                     [**Roughly Enough IDs**](https://www.curseforge.com/minecraft/mc-mods/reid)                        | <nobr>RoughlyEnoughIDs-2.0.8</nobr><br><nobr>RoughlyEnoughIDs-2.1.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/827/842/30/30/638215109388605628.png"            > |                          [**ConfigAnytime**](https://www.curseforge.com/minecraft/mc-mods/configanytime)               | <nobr>!configanytime-2.0</nobr><br><nobr>!configanytime-3.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/828/846/30/30/638216794274587308.png"            > |                             [**VintageFix**](https://www.curseforge.com/minecraft/mc-mods/vintagefix)                  | <nobr>vintagefix-0.4.2</nobr><br><nobr>vintagefix-0.4.2</nobr>
-----------

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5acf4713dea0e3bc0a30deb30b2a3fefb8705e44)🧟‍♂️fix mobs with Arctic Fur armor sometimes spawn without shield

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/dfb9d10b3091f23c3ada85440c383c63fb5f2ffc)🌠Fix "Iridium Enriched" asteroid sometimes give only Air
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e8e50803a9267959b6061e6d5ff65a9e1749a43b)🐝 Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/soulstone__0.png "Soulstone") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/quark/soul_sandstone__0.png "Soul Sandstone") into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/builder_bag__0.png "Building Backpack")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/597b9a705dbc5057450c87f8438b7cea7cb139f0)🤖Default Robot ![](https://github.com/Krutoy242/mc-icons/raw/master/i/astralsorcery/blockportalnode__0.png "Robot") move and turn speed
  > On some servers too fast movement speed causing glitches
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d71d88be01243bb115ef30974e51eaf79caddb52)🧩Cleanup ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/dispenser__0.png "Dispenser") block placement
  > This change do nothing. Its disable MysticalAgriculture, Quark and UniversalTweaks features to add seed/block placements for Dispenser.
  > 
  > Now, seeds placement controlled by Cyclic and Block placement controlled only by Quark
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/58c9e3520a51d47978dd824deed664f6c37c2932)🧩Disable EnderIO `recipeButtonInMachineGuis`
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/df872bc5f85c226e88919d499f74f451be5d5224)🧩Increase Schematica speed x2

#### Gear

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bf8ec5f62c4d2c4673c812799a3faff0b6d6758b)🔨Nerf ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/heavy_metal.png "Molten Heavy Metal") damage 25 => 15
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d25f8c0704797ffa5413367406df86edb4dde2d1)🪓Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/iceandfire/weezer_blue_album__0.png "Weezer") material
  > Its traits bugged and caused crashes

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/19de94a84f95f506b6d41bfe478d4bb5457d9b31)👩‍💻 Reduce `Circular Miner` circle size
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/cd745e45d0f02adf86f1b29990b050a75b914214)📖Fix chapter and conflux achievment messages not showing in server discord integration
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/359de9c9124ed428c758c21aa583cb7a690c7825)📖Fix quest reward had removed TE equipment

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5c5fdaea56cc07eaac28836e7d1204e9ed7292bf)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/cf_pack__1__2af53e98.png "CF Backpack") add durability 27 => 4000
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e410fcf668c8e55b07fa1ab394497dd89b80b89a)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/arcfurnace__0.png "Electric Arc Furnace") add alloy recipes
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/metal__2.png "Block of Manyullyn")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/storage_alloy__4.png "Block of Constantan")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/storage_alloy__3.png "Block of Bronze")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/479b82449f5d76bcb93bd678231e71f32ce48e71)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/arcfurnace__0.png "Electric Arc Furnace")[Alloy Kiln][Arc Furnace] add NC alloy recipes
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/alloy__6.png "Ferroboron Alloy Ingot")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/alloy__1.png "Tough Alloy Ingot")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/alloy__2.png "Hard Carbon Alloy Ingot")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/alloy__10.png "Extreme Alloy Ingot")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/136f8b7fbfde8203e786862cbc52d6e28e6c3fe3)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/colytra/elytra_bauble__0.png "Elytra") cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/abe821d1268dcd04be9cc3d3c42bb628c320affa)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__36.png "Ender Ingot") change recipe to require machines instead of crafting table
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/92372fdde5e46d0b155eec299bc61a3308c2a77d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/upgrade__2.png "Energy Storage Upgrade") cheaper
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b3c272d046a17e82eccefd1d319f955a4e2bb336)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advgenerators/turbine_controller__0.png "Gas Turbine controller") buff energy output x4
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a1124e7c01de0e2de4faf4b3a46f4434497517a4)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/stone_decoration__8.png "Insulating Glass") fix beneficial recipe not worked in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/fabricator__0.png "Thermionic Fabricator")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/68a9977ca79889f6702b81410e6f8141f06a3d6d)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/plustic/laser_gun__0__4f33f71b.png "Laser Gun") cheaper, move quest earlier
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f3aed0950aba636906ead8981860c3bb0bec3108)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/soulstone__0.png "Soulstone") add chiseling
* <img src="https://i.imgur.com/Gz3Uy7R.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c328fab660354f08963f439ed68cfbe4aa1926b4)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/storagedrawers/upgrade_template__0.png "Upgrade Template") now require only 1 ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/deadbush__0.png "Dead Bush")
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/1246fcd16ed4f6777f3c935e70898ea43ec69635)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/ingots__5.png "Aluminum Brass Ingot") in [Arc Furnace] recipe not consuming aluminium
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/7c2e94fa6716a816a94b8643a6d55543ea283f9e)✏️Fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/tconstruct/stone_ladder__0.png "Stone Ladder") recipe
* <img src="https://i.imgur.com/Sxj3V1W.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9fcca280cdebb51c44f6d83da3196595d7aa272e)✏️Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/upgrade__4.png "Ejector Upgrade") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/upgrade__6.png "Pulling Upgrade")
  > This upgrades tend to cause strong lags when stuck on pushing/pulling items from inventory.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/cf42db8ff7026c686f1cf6dc732757efb8d6a2db)✏️Replace ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rftoolsdim/material_absorber__0.png "Material Absorber") in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__10.png "Elite Catalyst") recipe with ~x100 cheaper variant
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/da2356f8e19a6e3836f915bcdfded3afc44773fd)✏️Return ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/bow__0__9890fbf1.png "Bow")![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/fishing_rod__0__e217dd86.png "Fishing Rod") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__800.png "Sawdust") recipe in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalexpansion/machine__1__45e2e59d.png "Pulverizer (Basic)")

#### Schematic

* <img src="https://i.imgur.com/n3Tom3T.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/cabe055d804b3c9b0235e4e283c82661da23f07e)👷‍♀️Improve NC Irradiator schematica
  > Now its bigger and way faster

## Misc

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e4c4160d7af37fb283536854b4a6af85a8df7cb9)Fix(config):🪐Return Black Hole in Magnis Vulpes solar system
  > Black Hole was accidentally removed in `v1.31.0`



