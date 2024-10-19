#modloaded mekanism
#priority 51

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.mekanism.MekanismHelper.getGas;

import scripts.processUtils.I;
import scripts.processUtils.arrN_float;
import scripts.processUtils.arrN_ingr;
import scripts.processUtils.arrN_item;
import scripts.processUtils.arrN_liq;
import scripts.processUtils.defaultChance0;
import scripts.processUtils.defaultChance0_int;
import scripts.processUtils.defaultItem0;
import scripts.processUtils.enderioXmlRecipe;
import scripts.processUtils.info;
import scripts.processUtils.isException;
import scripts.processUtils.isStrict;
import scripts.processUtils.normalizeChances;
import scripts.processUtils.warning;

// ######################################################################
//
// All machines works in one function
//
// ######################################################################

static staticOpts as IData = {} as IData;

function getOption(options as IData, field as string) as IData {
  return (!isNull(options) && !isNull(options.memberGet(field)))
    ? options.memberGet(field)
    : ((!isNull(staticOpts) && !isNull(staticOpts.memberGet(field)))
        ? staticOpts.memberGet(field)
        : null
      );
}

function getOptionEnergy(options as IData, default as int) as int {
  return (!isNull(options) && !isNull(options.energy)) ? options.energy as int : default;
}

function getOptionTime(options as IData, default as int) as int {
  return (!isNull(options) && !isNull(options.time)) ? options.time as int : default;
}

// Picks one machine to inject recipe in it
// Function receive all possible combinations of input and outputs of one machine
// Any argument can be null except machine name
// Returns name of machine if recipe was added. If not, returns empty string
function workEx(machineNameAnyCase as string, exceptionsAnyCase as string,
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[] = null,
  extra as IItemStack[] = null, extraChance as float[] = null, options as IData = null) as string {
  // Prepare machine name
  val machineName = machineNameAnyCase.toLowerCase();
  val exceptions = isNull(exceptionsAnyCase) ? '' : exceptionsAnyCase.toLowerCase();

  // Machine is exception -> exit function
  if (isException(exceptions, machineName)) { return ''; }

  // Strict indicates that old recipe should be removed first
  val strict as bool = isStrict(exceptions, machineName);

  // ------------
  // Inputs
  // ------------
  val inputIngr0 = arrN_ingr(inputItems, 0);
  val haveItemInput = !isNull(inputIngr0);
  val inputIsSingle = haveItemInput && inputItems.length == 1;
  val inputHasTag = haveItemInput && inputIngr0.itemArray.length > 0 && !isNull(inputIngr0.itemArray[0]) && inputIngr0.itemArray[0].hasTag;

  val inputLiquid0 = arrN_liq(inputLiquids, 0);
  val haveLiquidInput = !isNull(inputLiquid0);
  val inputLiquidIsSingle = haveLiquidInput && inputLiquids.length == 1;

  // ------------
  // Outputs
  // ------------
  val outputItem0 = arrN_item(outputItems, 0);
  val haveItemOutput = !isNull(outputItem0);
  val outputIsSingle = haveItemOutput && outputItems.length == 1;

  val outputLiquid0 = arrN_liq(outputLiquids, 0);
  val haveLiquidOutput = !isNull(outputLiquid0);
  val outputLiquidIsSingle = haveLiquidOutput && outputLiquids.length == 1;

  val haveGasOutput = D(options).check('gasOutput');
  val outputGasAmount = D(options).getInt('gasOutputAmount', 600);
  val outputGas = haveGasOutput ? getGas(options.gasOutput.asString()) * outputGasAmount : null;

  // ------------
  // Extra
  // ------------
  val extra0 = arrN_item(extra, 0);
  val haveExtra = !isNull(extra0);
  val outputItem0orExtra0 = haveItemOutput ? outputItem0 : extra0;

  // ------------
  // Relations
  // ------------
  val item_to_item = haveItemInput && haveItemOutput;

  // ------------
  // List Length
  // ------------
  val lenInItem = haveItemInput ? inputItems.length : 0;
  val lenInLiqs = haveLiquidInput ? inputLiquids.length : 0;
  val lenOutItem = haveItemOutput ? outputItems.length : 0;
  val lenOutLiqs = haveLiquidOutput ? outputLiquids.length : 0;

  // ------------
  // Combined
  // ------------
  var combinedOutput as IItemStack[] = null;
  var combinedChances as float[] = null;
  if (haveItemOutput) {
    for i in 0 .. outputItems.length {
      if (isNull(combinedOutput)) { combinedOutput = []; combinedChances = []; }
      combinedOutput += outputItems[i];
      combinedChances += 1.0f;
    }
  }
  if (haveExtra) {
    for i in 0 .. extra.length {
      if (isNull(combinedOutput)) { combinedOutput = []; combinedChances = []; }
      combinedOutput += extra[i];
      combinedChances += ((!isNull(extraChance) && extraChance.length > i) ? extraChance[i] : 1.0f);
    }
  }
  val havecombinedOutput = !isNull(combinedOutput) && combinedOutput.length > 0;

  // Machines with one item slot for input and output
  // 📦 → 📦
  if (item_to_item && inputIsSingle && outputIsSingle) {
    if (machineName == 'blockcutter') {
      // mods.ic2.BlockCutter.addRecipe(IItemStack output, IIngredient input, @Optional int hardness default 0);
      val hardness = getOption(options, 'hardness');
      if (!isNull(hardness))
        mods.ic2.BlockCutter.addRecipe(outputItem0, inputIngr0, hardness.asInt());
      else
        mods.ic2.BlockCutter.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == 'compressor') {
      mods.ic2.Compressor.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == 'macerator') {
      mods.ic2.Macerator.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == 'extractor') {
      mods.ic2.Extractor.addRecipe(outputItem0, inputIngr0);
      return machineName;
    }

    if (machineName == 'grindstone') {
      // mods.astralsorcery.Grindstone.addRecipe(IItemStack input, IItemStack output, float doubleChance);
      if (inputIngr0.amount == 1) {
        for ii in inputIngr0.itemArray {
          mods.astralsorcery.Grindstone.addRecipe(ii, outputItem0, defaultChance0(extraChance, 0.0f) / outputItem0.amount);
        }
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can only work with 1 item as input');
      }
      return machineName;
    }

    if (machineName == 'compactor') {
      for ii in inputIngr0.itemArray {
        mods.thermalexpansion.Compactor.addPressRecipe(outputItem0, ii, 4000);
      }
      return machineName;
    }

    if (machineName == 'pulverizer') {
      // mods.thermalexpansion.Pulverizer.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
      for ii in inputIngr0.itemArray {
        if (strict) { mods.thermalexpansion.Pulverizer.removeRecipe(ii); }
        if (haveExtra) {
          mods.thermalexpansion.Pulverizer.addRecipe(outputItem0, ii, 4000, extra[0], defaultChance0_int(extraChance, 100));
        }
        else {
          mods.thermalexpansion.Pulverizer.addRecipe(outputItem0, ii, 4000);
        }
      }
      return machineName;
    }

    if (machineName == 'mekenrichment') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      // # mods.mekanism.enrichment.addRecipe(IIngredient inputStack, IItemStack outputStack);
      mods.mekanism.enrichment.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == 'mekpurification') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      mods.mekanism.purification.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == 'mekinjection') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      mods.mekanism.chemical.injection.addRecipe(inputIngr0, <gas:hydrogenchloride>, outputItem0);
      return machineName;
    }

    if (machineName == 'meksawmill') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      if (strict) { mods.mekanism.sawmill.removeRecipe(inputIngr0); }
      // mods.mekanism.sawmill.addRecipe(IIngredient inputStack, IItemStack outputStack, @Optional IItemStack bonusOutput, @Optional double bonusChance);
      if (haveExtra) {
        mods.mekanism.sawmill.addRecipe(inputIngr0, outputItem0, extra[0], defaultChance0(extraChance, 1.0f) as double);
      }
      else {
        mods.mekanism.sawmill.addRecipe(inputIngr0, outputItem0);
      }
      return machineName;
    }

    if (machineName == 'mekcrusher') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      // mods.mekanism.crusher.addRecipe(IIngredient inputStack, IItemStack outputStack);
      // mods.mekanism.crusher.removeRecipe(IIngredient outputStack, @Optional IIngredient inputStack);
      if (strict) { mods.mekanism.crusher.removeRecipe(outputItem0); }
      mods.mekanism.crusher.addRecipe(inputIngr0, outputItem0);
      return machineName;
    }

    if (machineName == 'tesawmill') {
      // mods.thermalexpansion.Sawmill.addRecipe(IItemStack output, IItemStack input, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);
      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          mods.thermalexpansion.Sawmill.addRecipe(outputItem0, ii, 1000, extra[0], defaultChance0_int(extraChance, 100));
        }
        else {
          mods.thermalexpansion.Sawmill.addRecipe(outputItem0, ii, 1000);
        }
      }
      return machineName;
    }

    if (machineName == 'eu2crusher') {
      // mods.extrautils2.Crusher.add(IItemStack output, IItemStack input, @Optional IItemStack secondaryOutput, @Optional float secondaryChance);

      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          mods.extrautils2.Crusher.add(outputItem0, ii, extra[0], extraChance[0]);
        }
        else {
          mods.extrautils2.Crusher.add(outputItem0, ii);
        }
      }
      return machineName;
    }

    if (machineName == 'aacrusher') {
      if (strict) { mods.actuallyadditions.Crusher.removeRecipe(outputItem0); }
      // mods.actuallyadditions.Crusher.addRecipe(IItemStack output, IItemStack input, @Optional IItemStack outputSecondary, @Optional int outputSecondaryChance);

      if (inputIngr0.amount != 1) {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]),
          'received work, but this machine can only work with 1 item as input');
      }

      for ii in inputIngr0.itemArray {
        if (haveExtra) {
          mods.actuallyadditions.Crusher.addRecipe(outputItem0, ii, extra[0], defaultChance0_int(extraChance, 100));
        }
        else {
          mods.actuallyadditions.Crusher.addRecipe(outputItem0, ii);
        }
      }
      return machineName;
    }

    if (machineName == 'aegrinder') {
      // Grinder.removeRecipe(IItemStack input);
      // Grinder.addRecipe(IItemStack output, IItemStack input, int turns, @Optional IItemStack secondary1Output, @Optional float secondary1Chance, @Optional IItemStack secondary2Output, @Optional float secondary2Chance);

      for ii in inputIngr0.itemArray {
        if (strict) { mods.appliedenergistics2.Grinder.removeRecipe(ii); }
        if (haveExtra) {
          if (extra.length == 1) {
            mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2, extra[0], extraChance[0]);
          }
          else if (extra.length >= 2) {
            mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2, extra[0], extraChance[0], extra[1], extraChance[1]);
          }
        }
        else {
          mods.appliedenergistics2.Grinder.addRecipe(outputItem0, ii, 2);
        }
      }
      return machineName;
    }

    if (machineName == 'metalpress') {
      // mods.immersiveengineering.MetalPress.addRecipe(IItemStack output, IIngredient input, IItemStack mold, int energy, @Optional int inputSize);

      val molds as IItemStack[string] = {
        plate : <immersiveengineering:mold:0>,
        gear  : <immersiveengineering:mold:1>,
        rod   : <immersiveengineering:mold:2>,
        unpack: <immersiveengineering:mold:7>,
      } as IItemStack[string];

      val mold = !isNull(options.mold) ? molds[options.mold.asString()] : null;
      mods.immersiveengineering.MetalPress.addRecipe(outputItem0, inputIngr0, !isNull(mold) ? mold : molds.plate, 2000, inputIngr0.amount);
      return machineName;
    }
  }

  // Machines with ONE item INPUT
  // 📦 → [📦+]
  if (item_to_item && inputIsSingle) {
    if (machineName == 'thermalcentrifuge') {
      // mods.ic2.ThermalCentrifuge.addRecipe([IItemStack[] outputs, IIngredient input, @Optional int minHeat);
      mods.ic2.ThermalCentrifuge.addRecipe(outputItems, inputIngr0);
      return machineName;
    }

    if (machineName == 'massspectrometer') {
      mods.qmd.mass_spectrometer.addRecipe(
        inputIngr0, !isNull(inputLiquids) && inputLiquids.length > 0 ? inputLiquids[0] : null,
        combinedOutput[0],
        combinedOutput.length > 1 ? combinedOutput[1] : null,
        combinedOutput.length > 2 ? combinedOutput[2] : null,
        combinedOutput.length > 3 ? combinedOutput[3] : null,
        null, null, null, null, 1.0
      );
      return machineName;
    }
  }

  // Machines with ONE item INPUT and unknown output
  // 📦 → ?
  if (inputIsSingle) {
    if (machineName == 'rockcrusher') {
      // mods.nuclearcraft.RockCrusher.addRecipe(itemInput, itemOutput1, itemOutput2, itemOutput3, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation);
      mods.nuclearcraft.RockCrusher.addRecipe(inputIngr0,
        mods.nuclearcraft.ChanceItemIngredient.create(arrN_item(combinedOutput, 0), (combinedChances[0] * 100) as int),
        mods.nuclearcraft.ChanceItemIngredient.create(arrN_item(combinedOutput, 1), (combinedChances[1] * 100) as int),
        mods.nuclearcraft.ChanceItemIngredient.create(arrN_item(combinedOutput, 2), (combinedChances[2] * 100) as int),
        2.0, 1.5);
      return machineName;
    }

    if (machineName == 'crushingblock') {
      // addCrushingBlockRecipe(IItemStack input, IItemStack[] outputs, double[] probs)

      if (inputIngr0.amount != 1) {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]),
          'received work, but this machine can only work with 1 item as input');
      }

      for ii in inputIngr0.itemArray {
        mods.mechanics.addCrushingBlockRecipe(ii, combinedOutput, normalizeChances(combinedChances));
      }
      return machineName;
    }

    if (machineName == 'squeezer') {
      // Squeezer.addRecipe(IItemStack inputStack,
      //   @Optional IItemStack outputStack1, @Optional float outputStackChance1,
      //   @Optional IItemStack outputStack2, @Optional float outputStackChance2,
      //   @Optional IItemStack outputStack3, @Optional float outputStackChance3,
      //   @Optional ILiquidStack outputFluid);
      for ii in inputIngr0.itemArray {
        mods.integrateddynamics.Squeezer.addRecipe(ii,
          arrN_item(outputItems, 0), arrN_float(combinedChances, 0),
          arrN_item(outputItems, 1), arrN_float(combinedChances, 1),
          arrN_item(outputItems, 2), arrN_float(combinedChances, 2),
          outputLiquid0);
      }
      return machineName;
    }

    if (machineName == 'mechanicalsqueezer') {
      // MechanicalSqueezer.addRecipe(IItemStack inputStack,
      //   @Optional IItemStack outputStack1, @Optional float outputStackChance1,
      //   @Optional IItemStack outputStack2, @Optional float outputStackChance2,
      //   @Optional IItemStack outputStack3, @Optional float outputStackChance3,
      //   @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      for ii in inputIngr0.itemArray {
        mods.integrateddynamics.MechanicalSqueezer.addRecipe(ii,
          arrN_item(outputItems, 0), arrN_float(combinedChances, 0),
          arrN_item(outputItems, 1), arrN_float(combinedChances, 1),
          arrN_item(outputItems, 2), arrN_float(combinedChances, 2),
          outputLiquid0);
      }
      return machineName;
    }

    if (machineName == 'tecentrifuge') {
      // mods.thermalexpansion.Centrifuge.addRecipe(WeightedItemStack[] outputs, IItemStack input, ILiquidStack fluid, int energy);
      if (!havecombinedOutput)
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine MUST have item output');

      // Calculate chanced output from combined
      var chancedCombined = [] as WeightedItemStack[];
      for i, out in combinedOutput {
        chancedCombined += out % ((combinedChances[i] * 100) as int);
      }

      for ii in inputIngr0.itemArray {
        mods.thermalexpansion.Centrifuge.addRecipe(chancedCombined, ii, outputLiquid0, 2000);
      }
      return machineName;
    }

    if (machineName == 'centrifuge') {
      // mods.forestry.Centrifuge.addRecipe(WeightedItemStack[] output, IItemStack ingredients, int packagingTime);
      if (!havecombinedOutput)
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine MUST have item output');

      // Calculate chanced output from combined
      var chancedCombined = [] as WeightedItemStack[];
      for i, out in combinedOutput {
        chancedCombined += out % ((combinedChances[i] * 100) as int);
      }

      for ii in inputIngr0.itemArray {
        mods.forestry.Centrifuge.addRecipe(chancedCombined, ii, 200);
      }
      return machineName;
    }

    if (machineName == 'sagmill') {
      if (inputIngr0.amount != 1) {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]),
          'received work, but this machine can only work with 1 item as input');
      }

      if (combinedOutput.length > 0 && combinedChances.length >= combinedOutput.length) {
        val bonusType = getOption(options, 'bonusType');
        if (isNull(bonusType))
          mods.enderio.SagMill.addRecipe(combinedOutput, combinedChances, inputIngr0);
        else
          mods.enderio.SagMill.addRecipe(combinedOutput, combinedChances, inputIngr0, bonusType.asString());
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but no output or extra was found');
      }
      return machineName;
    }

    if (machineName == 'iecrusher') {
      // mods.immersiveengineering.Crusher.removeRecipe(IItemstack output);
      if (strict) { mods.immersiveengineering.Crusher.removeRecipe(outputItem0); }
      // mods.immersiveengineering.Crusher.addRecipe(IItemStack output, IIngredient input, int energy, @Optional IItemStack secondaryOutput, @Optional double secondaryChance);
      if (haveExtra) {
        mods.immersiveengineering.Crusher.addRecipe(outputItem0, inputIngr0, 2048, extra[0], extraChance[0]);
      }
      else {
        mods.immersiveengineering.Crusher.addRecipe(outputItem0, inputIngr0, 2048);
      }
      return machineName;
    }

    if (machineName == 'infernalfurnace') {
      if (!haveExtra) {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]),
          'received work, but this machine need extra output');
      }
      // mods.thaumcraft.SmeltingBonus.addSmeltingBonus(IIngredient input, WeightedItemStack stack)
      mods.thaumcraft.SmeltingBonus.addSmeltingBonus(inputIngr0, extra0 % defaultChance0_int(extraChance, 20));

      return machineName;
    }
  }

  // Machines with ONE item output
  // [📦+] → 📦
  if (item_to_item && outputIsSingle) {
    if (machineName == 'shapeless') {
      if (inputItems.length <= 9) {
        if (strict) {
          if (inputItems.length <= 3) { recipes.removeShaped(<*>, [inputItems]); }
          recipes.removeShapeless(<*>, inputItems);
        }
        recipes.addShapeless('shapeless ' ~ getRecipeName(inputIngr0.itemArray[0], outputItem0), outputItem0, inputItems);
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but input more than 9');
      }
      return machineName;
    }

    if (machineName == 'arcfurnace') {
      if (strict) { mods.immersiveengineering.ArcFurnace.removeRecipe(outputItem0); }
      if (inputItems.length > 1) {
        // Reduce all ingredients to additives
        var additives = [] as IIngredient[];
        for i in 1 .. inputItems.length {
          additives = additives + inputItems[i];
        }
        mods.immersiveengineering.ArcFurnace.addRecipe(outputItem0, inputIngr0, defaultItem0(extra, I('immersiveengineering:material', 7)), 200, 512, additives, 'Alloying');
      }
      else {
        mods.immersiveengineering.ArcFurnace.addRecipe(outputItem0, inputIngr0, defaultItem0(extra, I('immersiveengineering:material', 7)), 200, 512);
      }
      return machineName;
    }

    if (machineName == 'alloysmelter') {
      if (strict) { mods.enderio.AlloySmelter.removeRecipe(outputItem0); }
      enderioXmlRecipe('alloying', inputItems, inputLiquids, outputItems, outputLiquids, extraChance);
      return machineName;
    }

    if (machineName == 'kiln') {
      if (strict) { mods.immersiveengineering.AlloySmelter.removeRecipe(outputItem0); }
      if (inputItems.length == 2) {
        mods.immersiveengineering.AlloySmelter.addRecipe(outputItem0, inputItems[0], inputItems[1], 400);
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but number of inputs != 2');
      }

      return machineName;
    }

    if (machineName == 'alloyfurnace') {
      if (strict) { mods.nuclearcraft.AlloyFurnace.removeRecipeWithOutput(outputItem0); }
      if (inputItems.length == 2) {
        mods.nuclearcraft.AlloyFurnace.addRecipe(inputItems[0], inputItems[1], outputItem0);
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but number of inputs != 2');
      }
      return machineName;
    }

    if (machineName == 'induction') {
      // mods.thermalexpansion.InductionSmelter.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

      val additions as IItemStack[] = [
        <minecraft:sand>, I('thermalfoundation:material', 864), I('thermalfoundation:material', 865), I('thermalfoundation:material', 866),
      ] as IItemStack[];

      if (inputItems.length == 1) {
        // Only one input - add automatically scalled output based on catalyst
        for ii in inputIngr0.itemArray {
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[0], 4000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[2], 6000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 10));
          mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, additions[3], 8000, haveExtra ? extra[0] : additions[2], defaultChance0_int(extraChance, 10));
        }
      }
      else if (inputItems.length == 2) {
        for ii in inputItems[0].itemArray {
          for jj in inputItems[1].itemArray {
            mods.thermalexpansion.InductionSmelter.addRecipe(outputItem0, ii, jj, 4000, haveExtra ? extra[0] : additions[1], defaultChance0_int(extraChance, 15));
          }
        }
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but number of inputs 3 or more');
      }
      return machineName;
    }

    if (machineName == 'insolator') {
      // mods.thermalexpansion.Insolator.addRecipe(IItemStack primaryOutput, IItemStack primaryInput, IItemStack secondaryInput, int energy, @Optional IItemStack secondaryOutput, @Optional int secondaryChance);

      val energy = getOptionEnergy(options, 4800);

      if (inputItems.length == 2) {
        for ii in inputItems[0].itemArray {
          for jj in inputItems[1].itemArray {
            mods.thermalexpansion.Insolator.addRecipe(outputItem0, ii, jj, energy, extra0, defaultChance0_int(extraChance, 100));
          }
        }
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but number of inputs != 2');
      }
      return machineName;
    }
  }

  // Machines with any item s input and output
  // [📦+] → [📦+]
  if (item_to_item) {
    if (machineName == 'advrockarc') {
      val b = mods.advancedrocketry.RecipeTweaker.forMachine('ElectricArcFurnace').builder();
      for o in inputItems { b.input(o); }
      for o in outputItems { b.outputs(o); }
      b.power(getOptionEnergy(options, 100000));
      b.timeRequired(getOptionTime(options, 5));
      b.build();
      return machineName;
    }

    if (machineName == 'advrockcutter') {
      val b = mods.advancedrocketry.RecipeTweaker.forMachine('CuttingMachine').builder();
      for o in inputItems { b.input(o); }
      for o in outputItems { b.outputs(o); }
      b.power(getOptionEnergy(options, 100000));
      b.timeRequired(getOptionTime(options, 5));
      b.build();
      return machineName;
    }

    if (machineName == 'starlightinfuser') {
      // mods.astralsorcery.StarlightInfusion.addInfusion(IItemStack input, IItemStack output, boolean consumeMultiple, float consumptionChance, int craftingTickTime);

      if (inputIngr0.amount != 1) {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]),
          'received work, but this machine can only work with 1 item as input');
      }

      if (inputItems.length == 1 && outputItems.length == 1) {
        for ii in inputIngr0.itemArray {
          mods.astralsorcery.StarlightInfusion.addInfusion(ii, outputItem0, false, 0.7, 60);
        }
      }
      else {
        return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but number of inputs or outputs != 1');
      }
      return machineName;
    }
  }

  // ONE item to one liquid
  // 📦 → 💧
  if (inputIsSingle && outputLiquidIsSingle) {
    if (machineName == 'crushingtub') {
      // mods.rustic.CrushingTub.addRecipe(output as ILiquidStack, byproduct as IItemStack, input as IItemStack);
      for ii in inputIngr0.itemArray {
        mods.rustic.CrushingTub.addRecipe(outputLiquid0, outputItem0orExtra0, ii);
      }
      return machineName;
    }

    if (machineName == 'industrialsqueezer') {
      // mods.immersiveengineering.Squeezer.addRecipe(IItemStack output, ILiquidStack fluid, IIngredient input, int energy);
      mods.immersiveengineering.Squeezer.addRecipe(outputItem0, outputLiquid0, inputIngr0, 2048);
      return machineName;
    }

    if (machineName == 'crucible') {
      // mods.thermalexpansion.Crucible.addRecipe(ILiquidStack output, IItemStack input, int energy);
      val energy = getOptionEnergy(options, 5600);
      for ii in inputIngr0.itemArray {
        mods.thermalexpansion.Crucible.addRecipe(outputLiquid0 * min(10000, outputLiquid0.amount), ii, energy);
      }
      return machineName;
    }

    if (machineName == 'smeltery') {
      // mods.tconstruct.Melting.addRecipe(ILiquidStack output, IIngredient input, @Optional int temp);
      mods.tconstruct.Melting.addRecipe(outputLiquid0, inputIngr0);
      return machineName;
    }

    if (machineName == 'melter') {
      mods.nuclearcraft.Melter.addRecipe(inputIngr0, outputLiquid0);
      return machineName;
    }
  }

  // ONE item to one liquid
  // 💧 → 📦
  if (inputLiquidIsSingle && outputIsSingle) {
    if (machineName == 'evaporatingbasin') {
      mods.rustic.EvaporatingBasin.addRecipe(outputItem0, inputLiquid0);
      return machineName;
    }
  }

  // ONE item + ONE liquid -> item
  // 📦💧 → 📦
  if (inputIsSingle && inputLiquidIsSingle && outputIsSingle) {
    if (machineName == 'casting') {
      mods.tconstruct.Casting.addTableRecipe(outputItem0, inputIngr0, inputLiquid0, inputLiquid0.amount, true);
      return machineName;
    }

    if (machineName == 'ncinfuser') {
      mods.nuclearcraft.Infuser.addRecipe(inputIngr0, inputLiquid0, outputItem0);
      return machineName;
    }

    if (machineName == 'transposer') {
      // mods.thermalexpansion.Transposer.addFillRecipe(IItemStack output, IItemStack input, ILiquidStack fluid, int energy);
      for ii in inputIngr0.itemArray {
        mods.thermalexpansion.Transposer.addFillRecipe(outputItem0, ii, inputLiquid0, 6000);
      }
      return machineName;
    }
  }

  // ONE item + ONE liquid -> ONE liquid
  // 📦💧 → 💧
  if (inputIsSingle && inputLiquidIsSingle && outputLiquidIsSingle) {
    if (machineName == 'canner') {
      // mods.ic2.Canner.addEnrichRecipe(ILiquidStack output, ILiquidStack input, IIngredient additive);
      mods.ic2.Canner.addEnrichRecipe(outputLiquid0, inputLiquid0, inputIngr0);
      return machineName;
    }

    if (machineName == 'fluidenricher') {
      // mods.nuclearcraft.Enricher.addRecipe(itemInput, fluidInput, fluidOutput, @Optional double timeMultiplier, @Optional double powerMultiplier, @Optional double processRadiation);
      mods.nuclearcraft.Enricher.addRecipe(inputIngr0, inputLiquid0, outputLiquid0);
      return machineName;
    }
  }

  // ONE liquid -> 1+ liquid
  // 💧 → [💧+]
  if (inputLiquidIsSingle && haveLiquidOutput) {
    if (machineName == 'electrolyticcrucible') {
      if (inputLiquids.length == 1 && outputLiquids.length > 0 && outputLiquids.length <= 3) {
        mods.immersivetechnology.ElectrolyticCrucibleBattery.addRecipe(
          outputLiquids[0],
          outputLiquids.length >= 2 ? outputLiquids[1] : null,
          outputLiquids.length >= 3 ? outputLiquids[2] : null,
          null, // Output item
          inputLiquid0,
          getOptionEnergy(options, 60000), // Total energy for 1 run
          getOptionTime(options, 20) // Time
        );
      }
      else {
        return info(machineNameAnyCase, inputLiquid0.name, 'received work, but not match inputs and outputs amount');
      }
      return machineName;
    }

    if (machineName == 'electrolyticseparator') {
      if (inputLiquids.length == 1 && outputLiquids.length == 2) {
        val gas1 = getGas(outputLiquids[0].name);
        val gas2 = getGas(outputLiquids[1].name);
        if (isNull(gas1) || isNull(gas2))
          return info(machineNameAnyCase, inputLiquid0.name, 'unable to turn outputs into gases');
        mods.mekanism.separator.addRecipe(
          inputLiquid0 * (inputLiquid0.amount / 10), 800,
          gas1 * (outputLiquids[0].amount / 10),
          gas2 * (outputLiquids[1].amount / 10)
        );
      }
      else {
        return info(machineNameAnyCase, inputLiquid0.name, 'received work, but not match inputs and outputs amount');
      }
      return machineName;
    }
  }

  // 1+ liquid -> 1+ liquid
  // [💧+] → [💧+]
  if (haveLiquidInput && haveLiquidOutput) {
    if (machineName == 'advrockelectrolyzer') {
      val b = mods.advancedrocketry.RecipeTweaker.forMachine('Electrolyser').builder();
      for o in inputLiquids { b.input(o); }
      for i in 0 .. min(2, outputLiquids.length) { b.outputs(outputLiquids[i]); }
      b.power(getOptionEnergy(options, 100000));
      b.timeRequired(getOptionTime(options, 5));
      b.build();
      return machineName;
    }
  }

  // ONE liquid + 1+ item -> ONE liquid
  // 💧[📦+] -> 💧
  if (inputLiquidIsSingle && outputLiquidIsSingle && haveItemInput) {
    if (machineName == 'highoven') {
      if (inputItems.length <= 3) {
        // Using input items array as Oxidiser, Reducer and Purifier
        val in0 = inputIngr0;
        val in1 = arrN_ingr(inputItems, 1);
        val in2 = arrN_ingr(inputItems, 2);

        // Uses extra chance array last element as temperature
        // Default temperature is 500
        val lastIndex as int = isNull(extraChance) ? 999999 : (extraChance.length - 1);
        var temp as int = arrN_float(extraChance, lastIndex) as int;
        if (temp <= 0) { temp = 500; }

        // Computing chance of consuming additionals
        // Last chance should determine temperature
        //   if no chance provided, its 100%
        var v = (arrN_float(extraChance, 0) * 100) as int;
        val exChLen = !isNull(extraChance) ? extraChance.length : 0;
        val ch0 as int = (exChLen > 1 && v > 0) ? v : 100;

        v = (arrN_float(extraChance, 1) * 100) as int;
        val ch1 as int = (exChLen > 2 && v > 0) ? v : 100;

        v = (arrN_float(extraChance, 2) * 100) as int;
        val ch2 as int = (exChLen > 3 && v > 0) ? v : 100;

        // Create recipe
        val builder = mods.tcomplement.highoven.HighOven.newMixRecipe(outputLiquid0, inputLiquid0, temp);

        // Add additionals
        if (!isNull(in0)) { builder.addOxidizer(in0, ch0); }
        if (!isNull(in1)) { builder.addReducer (in1, ch1); }
        if (!isNull(in2)) { builder.addPurifier(in2, ch2); }
        builder.register();

        return machineName;
      }
      else {
        return info(machineNameAnyCase, inputLiquid0.name, 'received work, but amount of inputs > 3');
      }
    }

    if (machineName == 'vat') {
      if (inputItems.length <= 2) {
        enderioXmlRecipe('fermenting', inputItems, inputLiquids, outputItems, outputLiquids, null);
        return machineName;
      }
      else {
        return info(machineNameAnyCase, inputLiquid0.name, 'received work, but amount of inputs > 2');
      }
    }

    if (machineName == 'mixer') {
      if (inputItems.length > 6) return info(machineNameAnyCase, inputLiquid0.name, 'received work, but amount of inputs > 6');

      // mods.immersiveengineering.Mixer.addRecipe(ILiquidStack output, ILiquidStack fluidInput, IIngredient[] itemInputs, int energy);
      mods.immersiveengineering.Mixer.addRecipe(outputLiquid0, inputLiquid0, inputItems, 2048);

      return machineName;
    }
  }

  // Complicated input & output
  // 📦|💧 → [📦+]|💧
  if ((inputIsSingle || inputLiquidIsSingle) && (haveItemOutput || outputLiquidIsSingle)) {
    if (machineName == 'dryingbasin') {
      // DryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].itemArray {
          mods.integrateddynamics.DryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      }
      else {
        mods.integrateddynamics.DryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }

    if (machineName == 'mechanicaldryingbasin') {
      // MechanicalDryingBasin.addRecipe(@Optional IItemStack inputStack, @Optional ILiquidStack inputFluid, @Optional IItemStack outputStack, @Optional ILiquidStack outputFluid, @Optional(10) int duration);
      if (inputIsSingle) {
        for ii in inputItems[0].itemArray {
          mods.integrateddynamics.MechanicalDryingBasin.addRecipe(ii, inputLiquid0, outputItem0, outputLiquid0, 80);
        }
      }
      else {
        mods.integrateddynamics.MechanicalDryingBasin.addRecipe(null, inputLiquid0, outputItem0, outputLiquid0, 80);
      }
      return machineName;
    }
  }

  // Complicated input
  // [📦+]|[💧+] → [📦+]|💧
  if ((haveItemInput || haveLiquidInput) && (haveItemOutput || outputLiquidIsSingle)) {
    if (machineName == 'chemicalreactor') {
      if (lenInItem > 4 || lenInLiqs > 2 || lenOutItem > 4 & lenOutLiqs > 1)
        return info(machineNameAnyCase, inputLiquid0.name, "received work, but input and output amounts can't fit in machine");
      val b = mods.advancedrocketry.RecipeTweaker.forMachine('ChemicalReactor').builder();
      if (!isNull(inputItems)) for o in inputItems { b.input(o); }
      if (!isNull(inputLiquids)) for o in inputLiquids { b.input(o); }
      if (!isNull(outputItems)) for o in outputItems { b.outputs(o); }
      if (!isNull(outputLiquids)) for o in outputLiquids { b.outputs(o); }
      b.power(getOptionEnergy(options, 100000));
      b.timeRequired(getOptionTime(options, 5));
      b.build();
      return machineName;
    }

    if (machineName == 'forestrysqueezer') {
      // mods.forestry.Squeezer.addRecipe(ILiquidStack fluidOutput, IItemStack[] ingredients, int timePerItem, @Optional WeightedItemStack itemOutput);
      var inputItemStacks = [] as IItemStack[];
      for inIngr in inputItems {
        inputItemStacks = inputItemStacks + inIngr.itemArray[0];
      }
      val wOut as WeightedItemStack = !isNull(outputItem0) ? outputItem0 % defaultChance0_int(extraChance, 20) : null;
      mods.forestry.Squeezer.addRecipe(outputLiquid0, inputItemStacks, 20, wOut);
      return machineName;
    }
  }

  // ONE item to one gas
  // 📦 → 🟡
  if (inputIsSingle && haveGasOutput) {
    if (machineName == 'mekdissolution') {
      if (inputHasTag) return info(machineNameAnyCase, getItemName(inputIngr0.itemArray[0]), 'received work, but this machine can not work with input contain NBT tags');
      mods.mekanism.chemical.dissolution.addRecipe(inputIngr0, outputGas);
      return machineName;
    }
  }

  return warning(machineNameAnyCase,
    !isNull(inputIngr0)
      ? getItemName(inputIngr0.itemArray[0])
      : (!isNull(inputLiquid0) ? ('💧' ~ inputLiquid0.name) : '[unknown input]'),
    "received work, but machine with this name can't be found");
}

function work(machineNameAnyCase as string[], exceptions as string,
  inputItems as IIngredient[], inputLiquids as ILiquidStack[],
  outputItems as IItemStack[], outputLiquids as ILiquidStack[],
  extra as IItemStack[], extraChance as float[], options as IData = null) as string {
  for machine in machineNameAnyCase {
    workEx(machine, exceptions, inputItems, inputLiquids, outputItems, outputLiquids, extra, extraChance, options);
  }
}
