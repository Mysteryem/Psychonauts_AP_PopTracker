-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
-- TODO: Item types do not need to be specified here, they can be retrieved with JsonItem.Type as of Pop Tracker 0.23.0
ITEM_MAPPING = {
    -- Camp access
    [6] = "lili_bracelet",
    [7] = "oarsman_badge",
    [8] = "sasha_button",
    [10] = "squirrel_roast_dinner",

    -- Asylum access
    [1] = "lungfish_call",
    [2] = "gloria_trophy",
    [3] = "straight_jacket",
    [4] = "loboto_painting",

    -- PSI Powers
    [30] = "marksmanship",
    [31] = "pyrokinesis",
    [32] = "confusion",
    [33] = "levitation",
    [34] = "telekinesis",
    [35] = "invisibility",
    [36] = "clairvoyance",
    [37] = "shield",

    -- Misc progression items
    [5] = "birthday_cake",
    [9] = "cobweb_duster",
    [93] = "dowsing_rod",

    -- Mind unlocks
    [21] = "mind_coach",
    [22] = "mind_sasha",
    [23] = "mind_milla",
    [24] = "mind_linda",
    [25] = "mind_boyd",
    [26] = "mind_gloria",
    [27] = "mind_fred",
    [28] = "mind_edgar",
    [29] = "mind_oly",

    -- Brains
    [46] = "brain_elton",
    [47] = "brain_bobby",
    [48] = "brain_dogen",
    [49] = "brain_benny",
    [50] = "brain_elka",
    [51] = "brain_kitty",
    [52] = "brain_chloe",
    [53] = "brain_franke",
    [54] = "brain_jt",
    [55] = "brain_quentin",
    [56] = "brain_vernon",
    [57] = "brain_milka",
    [58] = "brain_crystal",
    [59] = "brain_clem",
    [60] = "brain_nils",
    [61] = "brain_maloof",
    [62] = "brain_mikhail",
    [63] = "brain_phoebe",
    [64] = "brain_chops",

    -- Gloria's Theater
    [16] = "gloria_candle",
    [17] = "gloria_megaphone",

    -- Waterloo World
    [18] = "fred_letter",
    [19] = "fred_coin",
    [20] = "fred_musket",

    -- The Milkman Conspiracy
    [11] = "boyd_stop_sign",
    [12] = "boyd_flowers",
    [13] = "boyd_plunger",
    [14] = "boyd_hedge_trimmers",
    [15] = "boyd_rolling_pin",

    -- Scavenger Hunt
    [65] = "gold_doubloon",
    [66] = "eagle_claw",
    [67] = "diver_helmet",
    [68] = "psychonauts_comic",
    [69] = "cherry_wood_pipe",
    [70] = "turkey_sandwich",
    [71] = "voodoo_doll",
    [72] = "miner_skull",
    [73] = "pirate_scope",
    [74] = "golden_acorn",
    [75] = "glass_eye",
    [76] = "condor_egg",
    [77] = "fertility_idol",
    [78] = "dinosaur_bone",
    [79] = "fossil",
    [80] = "gold_watch",

    -- Other/useless items (Feather and Watering Can from The Milkman Conspiracy)
    [91] = "crow_feather",
    [92] = "boyd_watering_can",
    [94] = "super_palm_bomb",

    -- Max Ammo upgrades
    [38] = "max_ammo_up",
    -- Max Lives upgrades
    [39] = "max_lives_up",
    -- Confusion Ammo upgrades
    [40] = "max_confusion_ammo_up",
    -- PSI Challenge Markers
    [41] = "psi_challenge_marker",
    -- Baggage and Baggage Tags
    [81] = "suitcase_tag",
    [82] = "purse_tag",
    [83] = "hatbox_tag",
    [84] = "steamer_trunk_tag",
    [85] = "dufflebag_tag",
    [86] = "suitcase",
    [87] = "purse",
    [88] = "hatbox",
    [89] = "steamer_trunk",
    [90] = "dufflebag",
    -- Memory Vaults
    [42] = "memory_vault",
    -- Small Arrowhead Bundles
    [43] = "small_arrowhead_bundle",
    -- Large Arrowhead Bundles
    [44] = "large_arrowhead_bundle",
    -- PSI Cards
    [45] = "psi_card",
}