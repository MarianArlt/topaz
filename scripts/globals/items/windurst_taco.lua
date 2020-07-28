-----------------------------------------
-- ID: 5172
-- Item: windurst_taco
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 1
-- Ranged Accuracy % 8 (cap 10)
-- Ranged Attack +1
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 5172)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MP, 20)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.AGI, 5)
    target:addMod(tpz.mod.MPHEAL, 1)
    target:addMod(tpz.mod.RATT, 1)
    target:addMod(tpz.mod.FOOD_RACCP, 8)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 10)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MP, 20)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.AGI, 5)
    target:delMod(tpz.mod.MPHEAL, 1)
    target:delMod(tpz.mod.RATT, 1)
    target:delMod(tpz.mod.FOOD_RACCP, 8)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 10)
end
