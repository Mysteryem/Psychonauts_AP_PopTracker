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
--     [19] = {"marksmanship1", "toggle"},
--     [20] = {"marksmanship2", "toggle"},
--     [21] = {"marksmanship3", "toggle"},
--     [22] = {"pyrokinesis1", "toggle"},
--     [23] = {"pyrokinesis2", "toggle"},
--     [24] = {"confusion1", "toggle"},
--     [25] = {"confusion2", "toggle"},
--     [26] = {"levitation1", "toggle"},
--     [27] = {"levitation2", "toggle"},
--     [28] = {"levitation3", "toggle"},
--     [29] = {"telekinesis1", "toggle"},
--     [30] = {"telekinesis2", "toggle"},
--     [31] = {"invisibility1", "toggle"},
--     [32] = {"invisibility2", "toggle"},
--     [33] = {"clairvoyance1", "toggle"},
--     [34] = {"clairvoyance2", "toggle"},
--     [35] = {"shield1", "toggle"},
--     [36] = {"shield2", "toggle"},
--     [37] = {"shield3", "toggle"},

    -- Misc items
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

    -- Max Ammo upgrades
    -- Ignored for now

    -- Max Lives upgrades
    -- Ignored for now

    -- Confusion Ammo upgrades
    -- Ignored for now

    -- Scavenger Hunt
    -- Ignored for now

    -- Suitcase Tags
    -- Ignored for now

    -- Purse Tags
    -- Ignored for now

    -- Hatbox Tags
    -- Ignored for now

    -- Steamer Trunk Tags
    -- Ignored for now

    -- Dufflebag Tags
    -- Ignored for now

    -- Suitcases
    -- Ignored for now

    -- Purses
    -- Ignored for now

    -- Hatboxes
    -- Ignored for now

    -- Dufflebags
    -- Ignored for now

    -- Vaults
    -- Ignored for now

    -- Small arrowhead bundles
    -- Ignored for now

    -- Large arrowhead bundles
    -- Ignored for now

    -- PSI Cards
    -- Ignored for now

    -- Other/useless items (Feather and Watering Can from The Milkman Conspiracy)
    -- Ignored for now
}