-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
-- TODO: Item types do not need to be specified here, they can be retrieved with JsonItem.Type as of Pop Tracker 0.23.0
ITEM_MAPPING = {
    -- Camp access
    [6] = {"lili_bracelet", "toggle"},
    [253] = {"oarsman_badge", "toggle"},
    [254] = {"sasha_button", "toggle"},
    [257] = {"squirrel_roast_dinner", "toggle"},

    -- Asylum access
    [1] = {"lungfish_call", "toggle"},
    [2] = {"gloria_trophy", "toggle"},
    [3] = {"straight_jacket", "toggle"},
    [4] = {"loboto_painting", "toggle"},

    -- PSI Powers
    -- PSI Powers are considered progressive, but the AP has each as a different ID.
    -- Additionally, we only care about the number of each, so they are treated as consumables by the tracker.
    [19] = {"marksmanship", "consumable"},
    [20] = {"marksmanship", "consumable"},
    [21] = {"marksmanship", "consumable"},
    [22] = {"pyrokinesis", "consumable"},
    [23] = {"pyrokinesis", "consumable"},
    [24] = {"confusion", "consumable"},
    [25] = {"confusion", "consumable"},
    [26] = {"levitation", "consumable"},
    [27] = {"levitation", "consumable"},
    [28] = {"levitation", "consumable"},
    [29] = {"telekinesis", "consumable"},
    [30] = {"telekinesis", "consumable"},
    [31] = {"invisibility", "consumable"},
    [32] = {"invisibility", "consumable"},
    [33] = {"clairvoyance", "consumable"},
    [34] = {"clairvoyance", "consumable"},
    [35] = {"shield", "consumable"},
    [36] = {"shield", "consumable"},
    [37] = {"shield", "consumable"},

    -- Misc progression items
    [5] = {"birthday_cake", "toggle"},
    [256] = {"cobweb_duster", "toggle"},

    -- Mind unlocks
    [258] = {"mind_coach", "toggle"},
    [259] = {"mind_sasha", "toggle"},
    [260] = {"mind_milla", "toggle"},
    [261] = {"mind_linda", "toggle"},
    [262] = {"mind_boyd", "toggle"},
    [263] = {"mind_gloria", "toggle"},
    [264] = {"mind_fred", "toggle"},
    [265] = {"mind_edgar", "toggle"},
    [266] = {"mind_oly", "toggle"},

    -- Brains
    [64] = {"brain_elton", "toggle"},
    [65] = {"brain_bobby", "toggle"},
    [66] = {"brain_dogen", "toggle"},
    [67] = {"brain_benny", "toggle"},
    [68] = {"brain_elka", "toggle"},
    [69] = {"brain_kitty", "toggle"},
    [70] = {"brain_chloe", "toggle"},
    [71] = {"brain_franke", "toggle"},
    [72] = {"brain_jt", "toggle"},
    [73] = {"brain_quentin", "toggle"},
    [74] = {"brain_vernon", "toggle"},
    [75] = {"brain_milka", "toggle"},
    [76] = {"brain_crystal", "toggle"},
    [77] = {"brain_clem", "toggle"},
    [78] = {"brain_nils", "toggle"},
    [79] = {"brain_maloof", "toggle"},
    [80] = {"brain_mikhail", "toggle"},
    [81] = {"brain_phoebe", "toggle"},
    [82] = {"brain_chops", "toggle"},

    -- Gloria's Theater
    [13] = {"gloria_candle", "consumable"},
    [14] = {"gloria_candle", "consumable"},
    [15] = {"gloria_megaphone", "toggle"},

    -- Waterloo World
    [16] = {"fred_letter", "toggle"},
    [17] = {"fred_coin", "toggle"},
    [18] = {"fred_musket", "toggle"},

    -- The Milkman Conspiracy
    [7] = {"boyd_stop_sign", "toggle"},
    [8] = {"boyd_flowers", "toggle"},
    [9] = {"boyd_plunger", "toggle"},
    [10] = {"boyd_hedge_trimmers", "toggle"},
    [11] = {"boyd_rolling_pin", "toggle"},

    -- Scavenger Hunt
    [83] = {"gold_doubloon", "toggle"},
    [84] = {"eagle_claw", "toggle"},
    [85] = {"diver_helmet", "toggle"},
    [86] = {"psychonauts_comic", "toggle"},
    [87] = {"cherry_wood_pipe", "toggle"},
    [88] = {"turkey_sandwich", "toggle"},
    [89] = {"voodoo_doll", "toggle"},
    [90] = {"miner_skull", "toggle"},
    [91] = {"pirate_scope", "toggle"},
    [92] = {"golden_acorn", "toggle"},
    [93] = {"glass_eye", "toggle"},
    [94] = {"condor_egg", "toggle"},
    [95] = {"fertility_idol", "toggle"},
    [96] = {"dinosaur_bone", "toggle"},
    [97] = {"fossil", "toggle"},
    [98] = {"gold_watch", "toggle"},

    -- Other/useless items (Feather and Watering Can from The Milkman Conspiracy)
    [255] = {"crow_feather", "toggle"},
    [12] = {"boyd_watering_can", "toggle"},
}

-- Max Ammo upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=38,43 do ITEM_MAPPING[i] = {"max_ammo_up", "consumable"} end

-- Max Lives upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=44,49 do ITEM_MAPPING[i] = {"max_lives_up", "consumable"} end

-- Confusion Ammo upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=50,53 do ITEM_MAPPING[i] = {"max_confusion_ammo_up", "consumable"} end

-- PSI Challenge Markers
-- Each item is the same, but they are currently considered different items by AP
for i=54,63 do ITEM_MAPPING[i] = {"psi_challenge_marker", "consumable"} end

-- Baggage and Baggage Tags
-- There are 10 of each item which are the same as one another, but they are currently considered different items by AP
ORDERED_BAGGAGE_CODES = {
    "suitcase_tag",
    "purse_tag",
    "hatbox_tag",
    "steamer_trunk_tag",
    "dufflebag_tag",
    "suitcase",
    "purse",
    "hatbox",
    "steamer_trunk",
    "dufflebag",
}
BAGGAGE_COUNT_PER_TYPE = 10
BAGGAGE_START = 99
--BAGGAGE_LAST = 198
for i,v in ipairs(ORDERED_BAGGAGE_CODES) do
    for j=0,(BAGGAGE_COUNT_PER_TYPE - 1) do
        ITEM_MAPPING[BAGGAGE_START + (i-1) * BAGGAGE_COUNT_PER_TYPE + j] = {v, "consumable"}
    end
end

-- Memory Vaults
-- Each item is the same, but they are currently considered different items by AP
for i=199,217 do ITEM_MAPPING[i] = {"memory_vault", "consumable"} end

-- Small Arrowhead Bundles
-- Each item is the same, but they are currently considered different items by AP
for i=218,247 do ITEM_MAPPING[i] = {"small_arrowhead_bundle", "consumable"} end

-- Large Arrowhead Bundles
-- Each item is the same, but they are currently considered different items by AP
for i=248,252 do ITEM_MAPPING[i] = {"large_arrowhead_bundle", "consumable"} end

-- PSI Cards
-- Each item is the same, but they are currently considered different items by AP
for i=267,373 do ITEM_MAPPING[i] = {"psi_card", "consumable"} end