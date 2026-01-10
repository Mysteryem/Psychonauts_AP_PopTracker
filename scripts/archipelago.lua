ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

-- Assuming this tracks the received order of items
CUR_INDEX = -1

BRAIN_CODES = {
    "brain_elton",
    "brain_bobby",
    "brain_dogen",
    "brain_benny",
    "brain_elka",
    "brain_kitty",
    "brain_chloe",
    "brain_franke",
    "brain_jt",
    "brain_quentin",
    "brain_vernon",
    "brain_milka",
    "brain_crystal",
    "brain_clem",
    "brain_nils",
    "brain_maloof",
    "brain_mikhail",
    "brain_phoebe",
    "brain_chops",
}

BAGGAGE_TO_TAG = {
    ["suitcase"] = "suitcase_tag",
    ["purse"] = "purse_tag",
    ["hatbox"] = "hatbox_tag",
    ["steamer_trunk"] = "steamer_trunk_tag",
    ["dufflebag"] = "dufflebag_tag",
}

local tabCA = "Camp + CU"
local tabAS = "Asylum"
local tabBB = "Basic Braining"
local tabSA = "Sasha's Shooting Gallery"
local tabMI = "Milla's Dance Party"
local tabBT = "Brain Tumbler Experiment"
local tabLO = "Lungfishopolis"
local tabMM = "The Milkman Conspiracy"
local tabTH = "Gloria's Theater"
local tabWW = "Waterloo World"
local tabBV = "Black Velvetopia"
local tabMC = "Meat Circus"
local LEVEL_PREFIX_TO_TAB = {
    CA = tabCA,
    LL = tabCA,
    AS = tabAS,
    BB = tabBB,
    SA = tabSA,
    MI = tabMI,
    NI = tabBT,--NI for 'Nightmare in the Brain Tumbler'
    LO = tabLO,
    MM = tabMM,
    TH = tabTH,
    WW = tabWW,
    BV = tabBV,
    MC = tabMC,
}

-- Map locations which reference sections and have more than 1 section do not update their color correctly as the
-- referenced sections are cleared. Forcing a tracker update will cause them to update however. This may be a PopTracker
-- bug.
-- Only need to force update after clearing these when Deep Arrowhead Shuffle is enabled.
local _DEEP_AH_SHUFFLE_FORCE_UPDATE_LOCATIONS = {
    "@CAGP/(CA GPC) Near the Bear/",
    "@CAGPDeepAH/(CA GPC Deep AH) Near Bear/",
    "@CAGP/(CA GPC) Big Rock Near Ford/",
    "@CAGPDeepAH/(CA GPC Deep AH) Big Rock Near Ford/",
    "@CAGP/(CA GPC) Tree Near Geyser/",
    "@CAGPDeepAH/(CA GPC Deep AH) Near Geyser/",
    "@CAMA/(CA Main) Under the Lodge/",
    "@CAMADeepAH/(CA Main Deep AH) Under the Lodge/",
    "@CARE/(CA Reception) Collapsed Cave/",
    "@CAREDeepAH/(CA Reception Deep AH) Collapsed Cave/",
    "@CARE/(CA Reception) Mineshaft Trailer Entrance/",
    "@CAREDeepAH/(CA Reception Deep AH) Mineshaft Lower Entrance/",
    "@CARE/(CA Reception) Mineshaft Bear/",
    "@CAREDeepAH/(CA Reception Deep AH) Mineshaft Bear/",
    "@CARE/(CA Reception) Graveyard Bear/",
    "@CAREDeepAH/(CA Reception Deep AH) Graveyard Corner/",
    "@CABH/(CA Lake) Rock Wall Upper/",
    "@CABHDeepAH/(CA Lake Deep AH) Rock Wall Upper/",
}
local DEEP_AH_SHUFFLE_FORCE_UPDATE_LOCATIONS = {}
for _, v in ipairs(_DEEP_AH_SHUFFLE_FORCE_UPDATE_LOCATIONS) do
    DEEP_AH_SHUFFLE_FORCE_UPDATE_LOCATIONS[v] = true
end

-- Only need to force update after clearing these when Mental Cobweb Shuffle is enabled.
local _MENTAL_COBWEB_SHUFFLE_FORCE_UPDATE_LOCATIONS = {
    "@BBA2Duster/(BB Area 2) Trapeze Cobweb/",
    "@BBA2Cobweb/(BB Area 2 Cobweb) Trapeze Cobweb/",
    "@BBA2/(BB Finale) Basic Braining Complete/",
    "@BBA2Cobweb/(BB Finale Cobweb) Bunny Room Door/",
    "@NIMPMark/(BT Main) Forest High Platform/",
    "@NIMPCobweb/(BT Main Cobweb) Forest High Platform/",
    "@LOMA/(LO Main) Skyscraper before Dam/",
    "@LOMACobweb/(LO Main Cobweb) Skyscraper Before Dam/",
    "@LOMAShield/(LO Main) End of Dam Platform/",
    "@LOMAShieldCobweb/(LO Main Cobweb) End of Dam/",
    "@MMI1AfterSign/(MM Neighborhood) Post Office Lobby/",
    "@MMI1AfterSignCobweb/(MM Neighborhood Cobweb) Post Office Lobby/",
    "@MMI1Duster_optional/(MM Neighborhood) Inside Webbed Garage/",
    "@MMI1AfterSignCobweb/(MM Neighborhood Cobweb) Webbed Garage/",
    "@THMSStorage/(TH Stage) Storage Room Left/",
    "@THMSStorageCobweb/(TH Stage Cobweb) Storage Room Left/",
    "@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Lower",
    "@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Upper",
    "@THMSStorageCobweb/(TH Stage Cobweb) Storage Room Right/",
    "@THMSDuster_optional/(TH Stage) Behind Stage Cobweb/",
    "@THMSCobweb/(TH Stage Cobweb) Behind Stage/",
    "@WWMA/(WW Main) Small Arch Top/",
    "@WWMACobweb/(WW Main Cobweb) Beneath Small Arch/",
}
local MENTAL_COBWEB_SHUFFLE_FORCE_UPDATE_LOCATIONS = {}
for _, v in ipairs(_MENTAL_COBWEB_SHUFFLE_FORCE_UPDATE_LOCATIONS) do
    MENTAL_COBWEB_SHUFFLE_FORCE_UPDATE_LOCATIONS[v] = true
end

-- Offset from PsychoRando ID to Archipelago ID
AP_ITEM_OFFSET = 42690000
AP_LOCATION_OFFSET = AP_ITEM_OFFSET

-- The "Goal" yaml option's value retrieved through AP slot_data is provided as a numeric value.
BRAIN_TANK_ONLY = 0
BRAIN_HUNT_ONLY = 1
BRAIN_TANK_AND_HUNT = 2

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return true end
    end
    return false
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function forceLogicUpdate()
    local update = Tracker:FindObjectForCode("force_logic_update")
    update.Active = not update.Active
end

function onClear(slot_data)
    CUR_INDEX = -1
    -- reset locations
    for _, location_section_name in pairs(LOCATION_MAPPING) do
        if location_section_name then
            local location = Tracker:FindObjectForCode(location_section_name)
            if location then
                location.AvailableChestCount = location.ChestCount
            end
        end
    end
    -- reset items
    for _, item_code in pairs(ITEM_MAPPING) do
        if item_code then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", item_code, item_type))
            end
            local obj = Tracker:FindObjectForCode(item_code)
            if obj then
                local item_type = obj.Type
                if item_type == "toggle" then
                    obj.Active = false
                elseif item_type == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif item_type == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", item_type, item_code))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", item_code))
            end
        end
    end
    -- reset brain count
    clearBrainCount()

    if slot_data == nil  then
        -- Even when empty, slot_data should still exist, so unsure if/how this could happen.
        print("warning: slot data is missing")
        return
    end

    -- Read AP slot_data to set settings based on the player's yaml options.
    -- slot_data value example:
    --[[
    {
        ["BrainsRequired"] = 16,
        ["DeepArrowheadShuffle"] = 0,
        ["EasyFlightMode"] = 0,
        ["EasyMillaRace"] = 1,
        ["EnemyDamageMultiplier"] = 3,
        ["Goal"] = 2,
        ["InstantDeathMode"] = 0,
        ["LootboxVaults"] = 1,
        ["MentalCobwebShuffle"] = 1,
        ["RequireMeatCircus"] = 0,
        ["StartingLevitation"] = 0,
        ["StartingMentalMagnet"] = 1,
    }
    ]]--

    print("Reading slot_data")

    -- Older apworld versions that don't have anything in slot_data are protected against by checking for nil values.

    -- Goals
    local brains_required = slot_data["BrainsRequired"]
    local goal = slot_data["Goal"]

    if goal ~= nil and brains_required ~= nil then
        local brain_tank_toggle = Tracker:FindObjectForCode("setting_brain_tank_goal")
        local brains_required_consumable = Tracker:FindObjectForCode("setting_brains_required")

        brain_tank_toggle.Active = goal == BRAIN_TANK_ONLY or goal == BRAIN_TANK_AND_HUNT

        -- BrainsRequired and Goal are combined together to only display a non-zero number of required brains when the
        -- brain hunt goal is enabled.
        if goal == BRAIN_HUNT_ONLY or goal == BRAIN_TANK_AND_HUNT then
            brains_required_consumable.AcquiredCount = brains_required
        else
            brains_required_consumable.AcquiredCount = 0
        end
    end

    local require_meat_circus = slot_data["RequireMeatCircus"]
    if require_meat_circus ~= nil then
        local require_meat_circus_toggle = Tracker:FindObjectForCode("setting_require_meat_circus")
        require_meat_circus_toggle.Active = require_meat_circus == 1
    end

    -- Starting items
    local starting_mental_magnet = slot_data["StartingMentalMagnet"]
    if starting_mental_magnet ~= nil then
        local starting_mental_magnet_toggle = Tracker:FindObjectForCode("setting_starting_mental_magnet")
        starting_mental_magnet_toggle.Active = starting_mental_magnet == 1
    end

    local starting_levitation = slot_data["StartingLevitation"]
    local starting_levitation_toggle = Tracker:FindObjectForCode("setting_starting_levitation")
    -- Toggle off first to reset the internal StartingLevitation counter (_internal_setting_starting_levitation_counter)
    -- because the current count of "levitation" will have been set to zero earlier in this function.
    starting_levitation_toggle.Active = false
    if starting_levitation ~= nil then
        starting_levitation_toggle.Active = starting_levitation == 1
    end

    -- Difficulty
    local easy_flight_mode = slot_data["EasyFlightMode"]
    if easy_flight_mode ~= nil then
        -- Note that EasyFlightMode is not considered by any out-of-logic access to locations.
        -- For example, it would allow for skipping almost all of The Milkman Conspiracy.
        local easy_flight_mode_toggle = Tracker:FindObjectForCode("setting_easy_flight_mode")
        easy_flight_mode_toggle.Active = easy_flight_mode == 1
    end

    local easy_milla_race = slot_data["EasyMillaRace"]
    if easy_milla_race ~= nil then
        -- Removes Bobby from the race and makes Raz 1.5 times faster.
        local easy_milla_race_toggle = Tracker:FindObjectForCode("setting_easy_milla_race")
        easy_milla_race_toggle.Active = easy_milla_race == 1
    end

    local enemy_damage_multiplier = slot_data["EnemyDamageMultiplier"]
    local damage_multiplier_progressive = Tracker:FindObjectForCode("setting_damage_multiplier")
    if enemy_damage_multiplier ~= nil then
        -- Clamp the value in the [0,5] range.
        -- If the range for EnemyDamageMultiplier is changed in the future, this and the setting_damage_multiplier item
        -- will need to be adjusted.
        damage_multiplier_progressive.CurrentStage = math.max(0, math.min(enemy_damage_multiplier, 5))
    end

    local instant_death_mode = slot_data["InstantDeathMode"]
    if instant_death_mode == 1 then
        -- When enabled, InstantDeathMode overrides the EnemyDamageMultiplier option.
        -- The last stage of setting_damage_multiplier shows an infinity symbol.
        damage_multiplier_progressive.CurrentStage = 6
    end

    -- Shuffle/sanity options
    local deep_arrowhead_shuffle = slot_data["DeepArrowheadShuffle"]
    if deep_arrowhead_shuffle ~= nil then
        local deep_arrowhead_shuffle_toggle = Tracker:FindObjectForCode("setting_deep_arrowhead_shuffle")
        deep_arrowhead_shuffle_toggle.Active = deep_arrowhead_shuffle == 1
    end

    local mental_cobweb_shuffle = slot_data["MentalCobwebShuffle"]
    if mental_cobweb_shuffle ~= nil then
        local mental_cobweb_shuffle_toggle = Tracker:FindObjectForCode("setting_mental_cobweb_shuffle")
        mental_cobweb_shuffle_toggle.Active = mental_cobweb_shuffle == 1
    end

    local ranksanity = slot_data["RankSanity"] or 0
    local ranksanity_toggle = Tracker:FindObjectForCode("setting_ranksanity")
    ranksanity_toggle.Active = ranksanity == 1

    local progressive_baggage_enabled = slot_data["ProgressiveBaggage"] or 0 -- 0 or 1
    local progressive_baggage_count = slot_data["MaximumProgressiveBaggage"] or 0 -- [0, 10]
    local progressive_baggage_setting = Tracker:FindObjectForCode("setting_progressive_baggage_count")
    progressive_baggage_setting.AcquiredCount = progressive_baggage_enabled * progressive_baggage_count

    -- Other
    --slot_data["LootboxVaults"]
    -- Showing this is not yet implemented.

    --print("slot data dump begin")
    --print(dump_table(slot_data))
    --print("slot data dump end")
end

function onClearHandler(slot_data)
    -- Disable tracker updates.
    Tracker.BulkUpdate = true
    -- Use a protected call so that tracker updates always get enabled again, even if an error occurred.
    local ok, err = pcall(onClear, slot_data)
    -- Enable tracker updates again.
    if ok then
        -- Defer re-enabling tracker updates until the next frame, which doesn't happen until all items/locations
        -- received/cleared from AP have been processed.
        local handlerName = "AP onClearHandler"
        local function frameCallback()
            ScriptHost:RemoveOnFrameHandler(handlerName)
            Tracker.BulkUpdate = false
            forceLogicUpdate()
        end
        ScriptHost:AddOnFrameHandler(handlerName, frameCallback)
    else
        Tracker.BulkUpdate = false
        print("Error: onClear failed:")
        print(err)
    end
end

function clearBrainCount()
    local obj = Tracker:FindObjectForCode("camper_brain")
    obj.AcquiredCount = 0
end

function updateBrainCount(received_item_code)
    if has_value(BRAIN_CODES, received_item_code) then
        -- DEBUG
        print(string.format("updateBrainCount: %s is a brain, incrementing brain count", received_item_code))
        local obj = Tracker:FindObjectForCode("camper_brain")
        obj.AcquiredCount = obj.AcquiredCount + obj.Increment
    end
end

function decrementBaggageTagCount(received_item_code)
    local tag_code = BAGGAGE_TO_TAG[received_item_code]
    if tag_code then
        -- DEBUG
        print(string.format("decrementBaggageTagCount: %s is baggage, decrementing tag count", received_item_code))
        local obj = Tracker:FindObjectForCode(tag_code)
        obj.AcquiredCount = obj.AcquiredCount - obj.Increment
    end
end

function onMap(levelName)
    if not levelName then
        return
    end

    if levelName == "CABU" then
        -- Ignore the file select menu.
        return
    end

    local levelPrefix = string.sub(levelName, 1, 2)
    local tabName = LEVEL_PREFIX_TO_TAB[levelPrefix]
    if tabName then
        Tracker:UiHint("ActivateTab", tabName)
    end
end

function onItem(index, ap_item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;

    local item_id = ap_item_id - AP_ITEM_OFFSET

    local item_code = ITEM_MAPPING[item_id]
    if not item_code then
        --DEBUG
        print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end

    local obj = Tracker:FindObjectForCode(item_code)
    if obj then
        item_type = obj.Type
        if item_type == "toggle" then
            obj.Active = true
            -- Extra handling for the fake consumable items used to show the current total
            updateBrainCount(item_code)
        elseif item_type == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif item_type == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
            -- If the item is baggage, decrement the count of the corresponding baggage tag
            decrementBaggageTagCount(item_code)
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", item_type, item_code))
        end
        --DEBUG
        print("onItem: Updated item check "..item_code)
    else
        print(string.format("onItem: could not find object for code %s", item_code))
    end
end

--called when a location gets cleared
function onLocation(ap_location_id, location_name)
    local location_id = ap_location_id - AP_LOCATION_OFFSET

    local location_section_name = LOCATION_MAPPING[location_id]
    if not location_section_name then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end

    local location = Tracker:FindObjectForCode(location_section_name)
    if location then
        location.AvailableChestCount = location.AvailableChestCount - 1
        -- DEBUG
        print("onLocation: checked spot "..location_section_name)
    else
        print(string.format("onLocation: could not find object for code %s", location_section_name))
    end
end

--called when receiving a Bounced message
function onBounced(value)
    if not value then
        return
    end

    local slots = value["slots"]
    -- Lua does not support `slots ~= {Archipelago.PlayerNumber}`, so check the first and second values in the table.
    if not slots or not (slots[1] == Archipelago.PlayerNumber and slots[2] == nil) then
        -- All Bounced messages to be processed by this tracker are expected to target the player's slot specifically.
        return
    end

    local data = value["data"]
    if not data then
        return
    end

    -- The key is specified in the AP client.
    onMap(data["psychonauts_level_name"])
end

--called when Get("events") returns
--function onEventsLaunch()
--end

Archipelago:AddClearHandler("clear handler", onClearHandler)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddBouncedHandler("map handler", onBounced)
--Archipelago:AddSetReplyHandler("event handler", onEvent)
--Archipelago:AddRetrievedHandler("event launch handler", onEventsLaunch)