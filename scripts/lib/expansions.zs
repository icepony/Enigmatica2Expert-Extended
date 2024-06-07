#priority 5000
#ignoreBracketErrors

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityDefinition;

$expand IEntityDefinition$asSoul() as IItemStack {
  return <draconicevolution:mob_soul>.withTag({EntityName: this.id});
}

$expand IEntityDefinition$asEgg() as IItemStack {
  return <minecraft:spawn_egg>.withTag({EntityTag: {id: this.id}});
}

$expand IEntityDefinition$asStack() as IItemStack {
  val soul = this.asSoul();
  if (isNull(soul)) return this.asEgg();
  return soul;
}

$expand IEntityDefinition$asIngr() as IIngredient {
  val soul = this.asSoul();
  val egg = this.asEgg();
  if (isNull(soul)) return egg;
  return soul | egg;
}
