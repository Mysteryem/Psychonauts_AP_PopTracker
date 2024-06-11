-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
-- TODO: Item types do not need to be specified here, they can be retrieved with JsonItem.Type as of Pop Tracker 0.23.0
ITEM_MAPPING = {
    -- Camp access
    [6] = "lili_bracelet",
    [253] = "oarsman_badge",
    [254] = "sasha_button",
    [257] = "squirrel_roast_dinner",

    -- Asylum access
    [1] = "lungfish_call",
    [2] = "gloria_trophy",
    [3] = "straight_jacket",
    [4] = "loboto_painting",

    -- PSI Powers
    -- PSI Powers are considered progressive, but the AP has each as a different ID.
    -- Additionally, we only care about the number of each, so they are treated as consumables by the tracker.
    [19] = "marksmanship",
    [20] = "marksmanship",
    [21] = "marksmanship",
    [22] = "pyrokinesis",
    [23] = "pyrokinesis",
    [24] = "confusion",
    [25] = "confusion",
    [26] = "levitation",
    [27] = "levitation",
    [28] = "levitation",
    [29] = "telekinesis",
    [30] = "telekinesis",
    [31] = "invisibility",
    [32] = "invisibility",
    [33] = "clairvoyance",
    [34] = "clairvoyance",
    [35] = "shield",
    [36] = "shield",
    [37] = "shield",

    -- Misc progression items
    [5] = "birthday_cake",
    [256] = "cobweb_duster",

    -- Mind unlocks
    [258] = "mind_coach",
    [259] = "mind_sasha",
    [260] = "mind_milla",
    [261] = "mind_linda",
    [262] = "mind_boyd",
    [263] = "mind_gloria",
    [264] = "mind_fred",
    [265] = "mind_edgar",
    [266] = "mind_oly",

    -- Brains
    [64] = "brain_elton",
    [65] = "brain_bobby",
    [66] = "brain_dogen",
    [67] = "brain_benny",
    [68] = "brain_elka",
    [69] = "brain_kitty",
    [70] = "brain_chloe",
    [71] = "brain_franke",
    [72] = "brain_jt",
    [73] = "brain_quentin",
    [74] = "brain_vernon",
    [75] = "brain_milka",
    [76] = "brain_crystal",
    [77] = "brain_clem",
    [78] = "brain_nils",
    [79] = "brain_maloof",
    [80] = "brain_mikhail",
    [81] = "brain_phoebe",
    [82] = "brain_chops",

    -- Gloria's Theater
    [13] = "gloria_candle",
    [14] = "gloria_candle",
    [15] = "gloria_megaphone",

    -- Waterloo World
    [16] = "fred_letter",
    [17] = "fred_coin",
    [18] = "fred_musket",

    -- The Milkman Conspiracy
    [7] = "boyd_stop_sign",
    [8] = "boyd_flowers",
    [9] = "boyd_plunger",
    [10] = "boyd_hedge_trimmers",
    [11] = "boyd_rolling_pin",

    -- Scavenger Hunt
    [83] = "gold_doubloon",
    [84] = "eagle_claw",
    [85] = "diver_helmet",
    [86] = "psychonauts_comic",
    [87] = "cherry_wood_pipe",
    [88] = "turkey_sandwich",
    [89] = "voodoo_doll",
    [90] = "miner_skull",
    [91] = "pirate_scope",
    [92] = "golden_acorn",
    [93] = "glass_eye",
    [94] = "condor_egg",
    [95] = "fertility_idol",
    [96] = "dinosaur_bone",
    [97] = "fossil",
    [98] = "gold_watch",

    -- Other/useless items (Feather and Watering Can from The Milkman Conspiracy)
    [255] = "crow_feather",
    [12] = "boyd_watering_can",
}

-- Max Ammo upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=38,43 do ITEM_MAPPING[i] = "max_ammo_up" end

-- Max Lives upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=44,49 do ITEM_MAPPING[i] = "max_lives_up" end

-- Confusion Ammo upgrades
-- Each item is the same, but they are currently considered different items by AP
for i=50,53 do ITEM_MAPPING[i] = "max_confusion_ammo_up" end

-- PSI Challenge Markers
-- Each item is the same, but they are currently considered different items by AP
for i=54,63 do ITEM_MAPPING[i] = "psi_challenge_marker" end

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
for i,baggage_code in ipairs(ORDERED_BAGGAGE_CODES) do
    for j=0,(BAGGAGE_COUNT_PER_TYPE - 1) do
        ITEM_MAPPING[BAGGAGE_START + (i-1) * BAGGAGE_COUNT_PER_TYPE + j] = baggage_code
    end
end

-- Memory Vaults
-- Each item is the same, but they are currently considered different items by AP
for i=199,217 do ITEM_MAPPING[i] = "memory_vault" end

-- Small Arrowhead Bundles
-- Each item is the same, but they are currently considered different items by AP
for i=218,247 do ITEM_MAPPING[i] = "small_arrowhead_bundle" end

-- Large Arrowhead Bundles
-- Each item is the same, but they are currently considered different items by AP
for i=248,252 do ITEM_MAPPING[i] = "large_arrowhead_bundle" end

-- PSI Cards
-- Each item is the same, but they are currently considered different items by AP
for i=267,373 do ITEM_MAPPING[i] = "psi_card" end