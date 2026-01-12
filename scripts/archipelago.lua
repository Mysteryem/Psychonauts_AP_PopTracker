ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

-- Assuming this tracks the received order of items
CUR_INDEX = -1

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

-- Offset from PsychoRando ID to Archipelago ID
AP_ITEM_OFFSET = 42690000
AP_LOCATION_OFFSET = AP_ITEM_OFFSET

-- The "Goal" yaml option's value retrieved through AP slot_data is provided as a numeric value.
BRAIN_TANK_ONLY = 0
BRAIN_HUNT_ONLY = 1
BRAIN_TANK_AND_HUNT = 2

local HINT_ENUM_VALUE_TO_HIGHLIGHT = {
    [0] = Highlight.Unspecified,
    [10] = Highlight.NoPriority,
    [20] = Highlight.Avoid,
    [30] = Highlight.Priority,
    [40] = Highlight.None,
}
local HINTS_DATASTORAGE_KEY

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
                location.Highlight = Highlight.None
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

    -- Get and subscribe to changes to the player's hints.
    if Archipelago.PlayerNumber > 0 then
        HINTS_DATASTORAGE_KEY = string.format("_read_hints_%i_%i", Archipelago.TeamNumber, Archipelago.PlayerNumber)
        Archipelago:SetNotify({HINTS_DATASTORAGE_KEY})
        Archipelago:Get({HINTS_DATASTORAGE_KEY})
    end

    -- TODO: Remove this
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

    local starting_colorizer = slot_data["StartingColorizer"]
    if starting_colorizer ~= nil then
        local starting_colorizer_toggle = Tracker:FindObjectForCode("setting_starting_colorizer")
        starting_colorizer_toggle.Active = starting_colorizer == 1
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

    local figment_percentage_checks = slot_data["FigmentPercentageChecks"] or 0  -- [0, 5], for each 20%
    local figment_percentage_setting = Tracker:FindObjectForCode("setting_figment_percentage_checks")
    figment_percentage_setting.AcquiredCount = figment_percentage_checks * 20

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
        elseif item_type == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif item_type == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
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

function onEvent(key, value, old_value)
    if value == old_value then
        return
    end
    if key == HINTS_DATASTORAGE_KEY then
        local self_player = Archipelago.PlayerNumber
        for _, hint in ipairs(value) do
            if hint.finding_player == self_player then
                local section_name = LOCATION_MAPPING[hint.location]
                if section_name ~= nil then
                    local section = Tracker:FindObjectForCode(section_name)
                    if section ~= nil then
                        local highlight = HINT_ENUM_VALUE_TO_HIGHLIGHT[hint.status]
                        if highlight ~= nil then
                            section.Highlight = highlight
                        end
                    end
                end
            end
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClearHandler)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddBouncedHandler("map handler", onBounced)
Archipelago:AddSetReplyHandler("event handler", onEvent)
Archipelago:AddRetrievedHandler("event launch handler", onEvent)