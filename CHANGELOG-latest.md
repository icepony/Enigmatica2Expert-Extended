# v1.33.0 (2024-3-11)

## Mods changes
### 🟡 Updated Mods

Icon | Summary | Old / New
----:|:--------|:---------
<img src="https://media.forgecdn.net/avatars/thumbnails/49/603/30/30/636079972364045115.png"             > |                            [**Controlling**](https://www.curseforge.com/minecraft/mc-mods/controlling)                 | <nobr>Controlling-3.0.12.2</nobr><br><nobr>Controlling-3.0.12.3</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/200/673/30/30/636914940710758684.png"            > |                          [**Village Names**](https://www.curseforge.com/minecraft/mc-mods/village-names)               | <nobr>VillageNames-1.12.2-4.4.7</nobr><br><nobr>VillageNames-1.12.2-4.4.8</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/159/374/30/30/636658415780463602.png"            > |                          [**CraftPresence**](https://www.curseforge.com/minecraft/mc-mods/craftpresence)               | <nobr>CraftPresence-2.3.0+1.12.2</nobr><br><nobr>CraftPresence-2.3.5+1.12.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/180/855/30/30/636796143936766724.png"            > |                           [**PackagedAuto**](https://www.curseforge.com/minecraft/mc-mods/packagedauto)                | <nobr>PackagedAuto-1.12.2-1.0.11.40</nobr><br><nobr>PackagedAuto-1.12.2-1.0.11.41</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/292/428/30/30/637325593905195388.png"            > |                              [**Zen Utils**](https://www.curseforge.com/minecraft/mc-mods/zenutil)                     | <nobr>zenutils-1.17.0</nobr><br><nobr>zenutils-1.17.1</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/468/506/30/30/637752171904887013.jpeg"           > |                       [**Had Enough Items**](https://www.curseforge.com/minecraft/mc-mods/had-enough-items)            | <nobr>HadEnoughItems_1.12.2-4.25.2</nobr><br><nobr>HadEnoughItems_1.12.2-4.25.2</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/557/657/30/30/637904734114975779.png"            > |                  [**Inventory Bogo Sorter**](https://www.curseforge.com/minecraft/mc-mods/inventory-bogosorter)        | <nobr>bogosorter-1.4.7</nobr><br><nobr>bogosorter-1.4.8</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/799/137/30/30/638161375230095246.png"            > |                          [**File Director**](https://www.curseforge.com/minecraft/mc-mods/filedirector)                | <nobr>!mod-director-launchwrapper-1.8.0-all</nobr><br><nobr>!mod-director-launchwrapper-1.8.1-all</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/827/842/30/30/638215109388605628.png"            > |                          [**ConfigAnytime**](https://www.curseforge.com/minecraft/mc-mods/configanytime)               | <nobr>!configanytime-2.0</nobr><br><nobr>!configanytime-2.0</nobr>
<img src="https://media.forgecdn.net/avatars/thumbnails/908/439/30/30/638360340448042423.png"            > |                [**Just Enough Magiculture**](https://www.curseforge.com/minecraft/mc-mods/just-enough-magiculture)     | <nobr>justenoughmagiculture-1.12.2-1.1.2</nobr><br><nobr>justenoughmagiculture-1.12.2-1.1.3</nobr>
-----------

## ✨ New Features

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/5552ae5ae914ec8f729872ff389b3b5c2bab5f06)🌆Add new screenshots to main meny by `thekaarlo` and `tomm2000`

## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/431f730930136e37db64e447cfbfa29decf65015)💦![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/loader__5.png "Fluid Input Hatch") actually make internal buffer 16->32 buckets
  > > Contributed by [TrashboxBobylev](trashbox.bobylev@gmail.com)
  >
  > A change made in `v1.31.0` accidentally break both ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/loader__5.png "Fluid Input Hatch") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/advancedrocketry/loader__4.png "Fluid Output Hatch"). This was intended to increase size of Fluid Hatches, but actually only made them unoperable.
  > 
  > Current change should fix it as intended.
* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/b4a8582b87d0dc1351656cd6205d942dbb8745dc)🦯Advanced Alchemical Furnace balance
  > > Contributed by [TabakaSIM](78695622+TabakaSIM@users.noreply.github.com)
  >
  > **Buffed Advanced Alchemical Furnace:**
  >   - 2x efficiency
  >   - Can smelt items with up to 3500 aspects
  > 
  > **Other changes:**
  > - fixed Invar nugget and block aspects
  > - fixed quest typo in thaumic dioptra
  > - updated information about TAR smelters and auxiliary addons

#### Configs

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/a42c2ac105ede4900b05ba0f9a2534b28a8bf010)🧩Enable back "pickUpSkeletonArrows"

#### Quest

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/4080f638f38827469228ea99b5f41bfc6983fb1f)📖FIx "You need to have at least x Hearts" message coloration

#### Recipes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/448dd9d17a09c0f1a87cd6f0abd32cc9dfc8244b)✏️![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/machine__0.png "Machine Block") fix can be replaced by ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/machine__0__bc115bab.png "Survival Generator")
  > in recipes of ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/resonator__0.png "Resonator"), ![](https://github.com/Krutoy242/mc-icons/raw/master/i/extrautils2/terraformer__9.png "Climograph Base Unit") and ![](https://github.com/Krutoy242/mc-icons/raw/master/i/rftools/crafter1__0.png "Crafter Tier 1")

#### Worldgen

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/c7b74390ec2f6efb1c5bba68c73d497fdb3c24c0)🌍Remove all Compressed BetterAnimalsPlus mobs
  > Players reporting that BAP compressed animals spawning non-stop



