# v1.38.0 (2024-5-27)
## Mods changes
### 🟢 Added Mods

Icon | Summary|Reason
----:|:-------|------
<img src="https://media.forgecdn.net/avatars/thumbnails/169/966/30/30/636718628509588781.png"            > |                              [**Cathedral**](https://www.curseforge.com/minecraft/mc-mods/cathedral)                    <sup><sub>Cathedral-1.12.2-1.9.9.jar                       </sub></sup><br>Extra Chisel Blocks and accessories with a cathedral theme | Provide amazing connected textures with cool looking sticking blocks.
<img src="https://media.forgecdn.net/avatars/thumbnails/208/0/30/30/636971205912405161.png"              > |                            [**OpenScreens**](https://www.curseforge.com/minecraft/mc-mods/openscreens)                  <sup><sub>openscreens-1.12.2-1.0.1.jar                     </sub></sup><br>More screens for OpenComputers! Hologram screens, flatscreens, and more to come! | Cool looking and takes less space.
<img src="https://media.forgecdn.net/avatars/thumbnails/573/873/30/30/637936076465669614.png"            > |                                 [**IC2-No**](https://www.curseforge.com/minecraft/mc-mods/ic2-no)                       <sup><sub>IC2-No-1.1.jar                                   </sub></sup><br>A Mod that fix ref and ic2 support | Fixes bugs with some Requious Fracto machines crashing like [this one](https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/369).
<img src="https://media.forgecdn.net/avatars/thumbnails/989/596/30/30/638502316680272474.png"            > |                                 [**Scalar**](https://www.curseforge.com/minecraft/mc-mods/scalar)                       <sup><sub>scalar-1.12.2-3.4.1.jar                          </sub></sup><br>The Scala 2/3 provider for Cleanroom | This mod required for experemental Java 22 setup. Do nothing on regular Java 8 minecraft runs. For more info, follow `🚀Migrating Java 8 ➜ Java 22` thread on E2E-E discord server.
-----------

### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/142/108/30/30/636546700830987709.png"            > |                           [**CraftTweaker**](https://www.curseforge.com/minecraft/mc-mods/crafttweaker)                | <nobr>CraftTweaker2-1.12-4.1.20.698</nobr><br><nobr>CraftTweaker2-1.12-4.1.20.699</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/194/704/30/30/636874517756132934.png"            > |                        [**Thaumic Wonders**](https://www.curseforge.com/minecraft/mc-mods/thaumic-wonders)             | <nobr>thaumicwonders-1.8.3</nobr><br><nobr>thaumicwonders-1.8.4</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/248/435/30/30/637168261428598002.png"            > |                                    [**QMD**](https://www.curseforge.com/minecraft/mc-mods/qmd)                         | <nobr>QMD-1.3.2-1.12.2</nobr><br><nobr>QMD-1.3.4-1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/941/669/30/30/638423283566569813.png"            > |             [**Mekanism Community Edition**](https://www.curseforge.com/minecraft/mc-mods/mekanism-ce)                 | <nobr>Mekanism-Community-Edition-1.12.2-9.12.8-Core</nobr><br><nobr>Mekanism-Community-Edition-1.12.2-9.12.10-Core</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.18.3</nobr><br><nobr>zenutils-1.18.9</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/301/90/30/30/637360994847173146.png"             > |                       [**Particle Culling**](https://www.curseforge.com/minecraft/mc-mods/particle-culling)            | <nobr>particleculling-1.12.2-v1.4.2</nobr><br><nobr>particleculling-1.12.2-v1.4.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/641/454/30/30/638043757664856777.png"            > |                       [**Universal Tweaks**](https://www.curseforge.com/minecraft/mc-mods/universal-tweaks)            | <nobr>UniversalTweaks-1.12.2-1.10.0</nobr><br><nobr>UniversalTweaks-1.12.2-1.11.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/761/180/30/30/638097412031319857.png"            > | [**Mekanism Community Edition: GENERATORS**](https://www.curseforge.com/minecraft/mc-mods/mekanism-ce-generators)      | <nobr>Mekanism-Community-Edition-1.12.2-9.12.8-Generators</nobr><br><nobr>Mekanism-Community-Edition-1.12.2-9.12.10-Generators</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/828/846/30/30/638216794274587308.png"            > |                             [**VintageFix**](https://www.curseforge.com/minecraft/mc-mods/vintagefix)                  | <nobr>vintagefix-0.4.2</nobr><br><nobr>vintagefix-0.5.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/908/439/30/30/638360340448042423.png"            > |                [**Just Enough Magiculture**](https://www.curseforge.com/minecraft/mc-mods/just-enough-magiculture)     | <nobr>justenoughmagiculture-1.12.2-1.1.3</nobr><br><nobr>justenoughmagiculture-1.12.2-1.1.5</nobr>
-----------

## ⚡ Performance Improvements

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4c72ae199532e13c1608e945b7b92b5a7f4c0183)⚡Speed up game load by ~20 seconds
  > Enable `dynamic_resources` config option of VintageFix.  
  > Enabling of this option could cause micro-second freezes when new items appear on screen.  
  > This performance improvment wasnt enabled since it caused ~30 seconds freeze when opening TConstruct Tool Forge. Now it was fixed https://github.com/embeddedt/VintageFix/issues/67

## ✨ New Features

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/affeb4422fde251fc8956eb66081c9ec026304b1)🩸`Blood Magic` expansion
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/jaopca/block_blockdilithium__0.png "Block of Dilithium") meteor now +1 bigger in radius
  > - `Meteor` ritual now required for Skyblock progression since it would be only source of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/hotturf__0.png "Oxidized Ferric Sand"). Previous source from Asteroid Mining replaced to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/moonturf__0.png "Moon Turf")
  > - All meteors now x2 times cheaper, from 300K to 1M LP
  > - Nuclear meteor now require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/immersiveengineering/storage__5.png "Block of Uranium") instead of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/ingot_block__3.png "Thorium Block")
  > - **Meteors** now leave smoke traces
  > - **Meteors** now spawning constantly at `Kepler 0119` (dim 123) and `Kepler 0118` (dim 122)
  > - Fix **Nether** meteor had stone blocks
  > - <img src="https://i.imgur.com/1zn63sa.png" align=right> `Meteor` HEI tab now shows actual numbers of blocks in each meteor
  > - All chunk benefication like ![](https://github.com/Krutoy242/mc-icons/raw/master/i/jaopca/item_rockychunkgold__0.png "Gold Rocky Chunk") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/jaopca/item_chunkgold__0.png "Gold Chunk") in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/alchemy_table__0.png "Alchemy Table") now require ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/cutting_fluid__1.png "Explosive Powder") instead of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/cutting_fluid__0.png "Basic Cutting Fluid"). Also inputs and outputs increased x2.
  > - Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/component__22.png "Plant Oil") from the game since other modded items will be used in recipes instead
  > - <img src="https://i.imgur.com/dF8K60d.png" align=right> ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/component__26.png "Antiseptic")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/cutting_fluid__0.png "Basic Cutting Fluid")![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/cutting_fluid__1.png "Explosive Powder") now using modded items in recipes
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/productsheet__1.png "Titanium Iridium Alloy Sheet") and all other Sheets can be made using Blood magic
  > - Add 12 new alloy recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/alchemy_table__0.png "Alchemy Table") unsing dusts and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/component__25.png "Neuro Toxin"). List of all added recipes: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/productdust__1.png "Titanium Iridium Alloy Dust")![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/productdust__0.png "Titanium Aluminide Dust")![](https://github.com/Krutoy242/mc-icons/raw/master/i/qmd/chemical_dust__7.png "Zinc Sulfide")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__96.png "Steel Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__96.png "Steel Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__96.png "Steel Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__97.png "Electrum Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__98.png "Invar Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__99.png "Bronze Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__100.png "Constantan Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__101.png "Signalum Blend")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/material__102.png "Lumium Blend")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4936d76c1c98ebdd588403c7f57dc98f19948e5f)🩸`Blood Magic` expansion: rituals
  > - <img src="https://i.imgur.com/U4XQB1q.png" align=right> **Imperfect zombie ritual** now spawning Blight zombie (easy ![](https://github.com/Krutoy242/mc-icons/raw/master/i/scalinghealth/crystalshard__0.png "Heart Crystal Shard") source).
  > - **Ritual of the Shepherd** animals grow x12 times faster (adult in 20 seconds), adults ready to breed again faster, ritual range increased up to 128 blocks radius.
  > - **Le Vulcanos Frigius** can be configured to generate about 30 new blocks, does not consume Alchemical Array.
  > - **Ritual of Containment** range increased.
  > - <img src="https://i.imgur.com/v3Uh0b1.png" align=right> **Ritual of the Crusher** increased range, speed and fortune level now `VIII`.
  > - **Ritual of Magnetism** Increase radius by placing blocks under Master Ritual Stone up to 255
  > - **Serenade of the Nether** Generates ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/pyrotheum.png "Blazing Pyrotheum") instead of Lava
  > - **Ritual of Containment** Maximum size increased to a 300-block radius.
  > - **Laying of the Filler** Places blocks each tick and requires only 1 LP per operation.
  > - **Call of the Zephyr** Maximum radius is 255 blocks, gathers items 2 times per second.
  > - **Mark of the Falling Tower** Raw Will actually increasing meteor radius up to 25%.
  > - Add quests describing all the changes
* <img src="https://i.imgur.com/C4GHNfl.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8f8f2efadbaedfb3433c6b50581512936bf3e9cd)⬜Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__615370d7.png "Castle Guardian [NYI] Soul") mob spawning mechanic
  > - Need to build structure to spawn mob
  > - Spawned with strong potion effects such as `Regeneration X`
  > - Drop ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/saltblock__0.png "Salt Block") when receive damage
  > - No actual usage mechanic for now. Just cool looking mob 😅

#### JEI

* <img src="https://i.imgur.com/5juX5Oz.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2d02d98dd55dfab785736c0207e1ec221d9fe45d)🧻Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/gravel__0.png "levarG") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/minecraft/sand__0.png "dnaS") sources
  > 
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/da481774025689a20a858edcaefbf034ee6229e9)🧻Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/decorativesolidwood__0.png "Magical Planks") axing hint
* <img src="https://i.imgur.com/fmZIb9e.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ea5ef609a5c632ecf3aa13a7931e83680d59a0f4)🧻Add `Spawn Egg` in addition to `Mob Soul` icon
  > 

#### Recipes

* <img src="https://i.imgur.com/tAXu2MA.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/530203d543e00e86796ab7c81805c110fb54cdfd)✏️Add new block - [Compressed Coral]
  > - Craft with 9 any Coral
  > - Spawning ![](https://github.com/Krutoy242/mc-icons/raw/master/i/biomesoplenty/coral__0.png "Pink Coral") around when under water (corals must be able to be placed there)
  > - Turned into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/biomestone__0.png "Biome Cobblestone") if not under water
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/bc541b4ca5393a4b4128d9e3a33c7b9971a36702)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/biomestone__0.png "Biome Cobblestone")![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/biomestone__1.png "Biome Stone") add new obtainable recipes
  > There is no actual progression usage yet. But now you can use it as decoration.

## 🐛 Fixes


#### Balance ⚖️

* <img src="https://i.imgur.com/UrLgd1g.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/45a9b215235b133bbb1cf7b8870297957682c13c)⚖️Rebalance IC2 fruits and crops
  > - Mostly all crops grows about x5 times faster
  > - Special crops like Meat Rose growth x50 times faster
  > - Metal fruits cannot be squeezed into metal anymore. Instead they should be thrown into ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/stone.png "Seared Stone")
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crop_res__7.png "Oil Berry") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crop_res__8.png "Bobs-Yer-Uncle-Ranks Berry") output amount nerfed
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/88c7caca8ea65d9db79741b35eb39d71eacd1074)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__50.png "Organic Black Dye")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__49.png "Organic Brown Dye")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__48.png "Organic Green Dye") rework recipes
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__50.png "Organic Black Dye") Now using any BAP egg instead of only Goose one
  > - ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__48.png "Organic Green Dye") Now require [Uranium-238]
  > - Every dye now can be crafted non-tech way in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/bloodmagic/alchemy_table__0.png "Alchemy Table")
  > - Dye components ![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__46.png "Clippings and Trimmings")![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__47.png "Twigs and Prunings") can be bought from Myrmexes
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/29976bd51c0328eb9fce4f1d14c7d8c5cd7f8eb8)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/fertilized_essence__0.png "Fertilized Essence") cheaper, x8 output
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/26644638ae74cc107e3c41bb36ce338d32a67e84)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/draconicevolution/mob_soul__0__84ed7972.png "Ratlantean Automaton Soul") increase ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/crafting__3.png "Advanced Alloy") drop to 12-24
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/9321ecd2d8c133f96cbb7dbcac23c2626e2eb3d3)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/astralsorcery/blockcustomore__0.png "Rock Crystal Ore") make obtainable only as block in world
  > Now, you cant get Ore as item in inventory. This would keep original AS idea that block cant be silk touched.
  > 
  > - Sources of ore block would be replaced to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mysticalagriculture/rock_crystal_essence__0.png "Rock Crystal Essence")
  > - Essence have lower chance to get from sifting (50% => 10%)
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a589ab37f485405cdc5ae5d48feea8522ff2f365)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/metal0__0.png "Titanium Aluminide Block")![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/metal0__1.png "Titanium Iridium Alloy Block") add recipes in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/arcfurnace__0.png "Electric Arc Furnace") instead of ingots
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2a4f24948a5a1c9a145dcfb9b665844ef3ecb803)✏️Add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/industrialforegoing/dryrubber__0.png "Dry Rubber") => 9x![](https://github.com/Krutoy242/mc-icons/raw/master/i/industrialforegoing/plastic__0.png "Plastic") in ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/arcfurnace__0.png "Electric Arc Furnace")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/be9fc1c784e8f21edb300a696a0d3149564416f7)✏️Add magic-only recipe for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/mekanism/enrichedalloy__0.png "Enriched Alloy")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0de064c8c5a91ed7c1dc88c54a56e48d1d07bb15)✏️add recipe ![](https://github.com/Krutoy242/mc-icons/raw/master/i/psi/material__2.png "Psigem") => 16x![](https://github.com/Krutoy242/mc-icons/raw/master/i/psi/material__0.png "Psidust")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3844214eb104cdd102cca6f953d3e9efaa3c17bf)✏️Better balance catalysts
  > Since one day E2EE would have "Catalyst Singularities", Catalysts ingredients should be easier crafted and not require too much waiting or thouthands of the same resource.
  > 
  > Changed recipes for: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__14.png "Basic Component")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__15.png "Advanced Component")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__9.png "Advanced Catalyst")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__16.png "Elite Component")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extendedcrafting/material__10.png "Elite Catalyst")
* <img src="https://i.imgur.com/Ym0XIUP.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b21e77cf187e710e21b934a0d0207605700f1ecc)✏️Buff ![](https://github.com/Krutoy242/mc-icons/raw/master/i/astralsorcery/blockchalice__0.png "Containment Chalice") liquid interaction
  > - Chance to get secondary and third block is higher - 11% and 1% respectively. Before this change, it was 5% and 0.15%.
  > - Now fluids would not be consumed if common block generated (same as when fluid blocks touch without Chalice).
  > - Otherwise consumed 10mb and 100mb of fluids at 20% and 40% chance.
  > - Add weights for HEI tab
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/36801d8149971145797134955d86f10b91d73690)✏️Increase x10 size of Fluid reserviours on `Stella` and `KELT-6a`
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/8139a89ba788fc851c7f7b8f89df15d51d7262be)✏️Merge Platinum and Iridium meteors, add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/environmentaltech/mica__0.png "Mica")
  > <img src="https://i.imgur.com/0ZDaVBQ.png" align=right> - Remove low-level ores from Meteor
  > <img src="https://i.imgur.com/80R7Bdh.png" align=right> - Now there would be no-tech source of Mica
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d30b03a8d4b08ef859191c320b718837e6626743)✏️Nerf **Mineralis** ritual
  > - Remove NuclearCraft ores from spawn list: ![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/ore__5.png "Boron Ore")![](https://github.com/Krutoy242/mc-icons/raw/master/i/contenttweaker/sub_block_holder_7__3.png "Lithium Ore")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/ore__7.png "Magnesium Ore")![](https://github.com/Krutoy242/mc-icons/raw/master/i/nuclearcraft/ore__3.png "Thorium Ore")
  > - Remove ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thermalfoundation/ore__6.png "Platinum Ore")
* <img src="https://i.imgur.com/jbqyaRe.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4a55e0e0667abae48d586d9967461357167a897f)✏️Replace all usages of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/biomesoplenty/coral__0.png "Pink Coral") to ![](https://github.com/Krutoy242/mc-icons/raw/master/i/randomthings/ingredient__5.png "Luminous Powder")
  > Now Luminous Powder crafted from the corals and then can be used for crafts

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/91fb4858657cbb43a3f470025f45e46f29e34379)✏️Lower ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/log_greatwood__0.png "Greatwood Log") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/log_silverwood__0.png "Silverwood Log") mining levels
  > This would make them be able to harvested with ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumcraft/golem__0__1e89c015.png "Golem")
  > 
  > Also fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/368
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/2306d4df5dc4f63566f82dcddfa2f072feb405a6)📄![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/butterfly_ge__0__554c2567.png "Comma Butterfly") => ![](https://github.com/Krutoy242/mc-icons/raw/master/i/forestry/serum_ge__0__554c2567.png "Comma Serum") add HEI hint
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/07b99177dff431534d6a64e7cfa02b056e7ea3ab)🧩Enable some `Universal Tweaks` configs
  > List of enabled things:
  > - Weaken Golem Structure Requirements
  > - Weaken Wither Structure Requirements
  > - Keep Sent Messages
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/21d215f80ba5d4c5f5d2146f73ed92790b9d0749)📝Remove "Deep" from "Deep Ocean Oil Reservoir" name
* <img src="https://i.imgur.com/sqexbzY.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/0fb2451afb8f70ce648574aa8189e2c6e1f493a2)🪐Move Kepler 0119 (dim 123) and Kepler 0118 (dim 122) closer to the Black Hole
  > Allow beautiful views

#### Mods

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/3eea9f425a6059e520edb46b9f01a0f240b6f929)💬Remove `mc2discod` server-side Bansoukou patch
  > Since error fixed already https://github.com/DenisD3D/Mc2Discord/issues/103

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/ce2a86ed47d22b60809a060e23c9490f8f6fd28f)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/exnihilocreatio/item_ore_cobalt__2.png "Cobalt Ore Dust")![](https://github.com/Krutoy242/mc-icons/raw/master/i/exnihilocreatio/item_ore_ardite__2.png "Ardite Ore Dust") add ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__47.png "Macerator") recipes
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4095dc113e2324f6a4b4142475dc61635f9e0702)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/decorativesolidwood__1.png "Magical Wood")![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/decorativesolidwood__0.png "Magical Planks") add Villager trade
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/f8ac4ff164906bc609542f787cd5ddb0a4acef5c)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/enderio/item_material__0.png "Simple Machine Chassis") make 1 recycle recipe instead of 4
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c1094359712da7e059cc6c45f8f17b5c36a659d5)✏️Add ThAdds plates recipes for ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__55.png "Metal Former") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/ic2/te__51.png "Block Cutting Machine")
  > ![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/mithrillium_plate__0.png "Mithrillium Plate")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/adaminite_plate__0.png "Adaminite Plate")![](https://github.com/Krutoy242/mc-icons/raw/master/i/thaumadditions/mithminite_plate__0.png "Mithminite Plate")
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/717ef261493d3ef524b7386062c02303b4701b23)✏️fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/integrateddynamics/menril_torch_stone__0.png "Menril Stone Torch") have removed item ingredient
  > Fix https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues/373
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c94aa1048300c3a85fbe6ffc0dd5daba6e64106a)✏Fix some Cathedral recipe conflicts with Quark
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/681a7bc286e00f4c4d012659ef67a97caad54fd1)🦯Thaumcraft: Remove recipes for missing items
  > > Contributed by [TabakaSIM](78695622+TabakaSIM@users.noreply.github.com)
  >
  > * Fix name typo
  > * Added hint to Thaumatorium about heat source
  > * Fixed bad research knownledge type
  > * Remove recipes for missing items



