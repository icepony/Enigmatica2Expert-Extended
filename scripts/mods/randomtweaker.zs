#modloaded randomtweaker

for matName, power in scripts.equipment.equipData.defaultWeaponMats {
  mods.randomtweaker.tconstruct.IBook.setMaterialPriority(matName, power);
}
