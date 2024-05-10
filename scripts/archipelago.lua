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
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            end
        end
    end
    -- reset items
    for _, item_code in pairs(ITEM_MAPPING) do
        if item_code and item_type then
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
        ["LootboxVaults"] = 1,
        ["StartingMentalMagnet"] = 1,
        ["Goal"] = 0,
        ["EasyFlightMode"] = 0,
        ["RequireMeatCircus"] = 1,
        ["StartingLevitation"] = 1,
        ["EnemyDamageMultiplier"] = 1,
        ["EasyMillaRace"] = 0,
        ["BrainsRequired"] = 10,
        ["InstantDeathMode"] = 0,
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

    -- Other
    --slot_data["LootboxVaults"]
    -- Showing this is not yet implemented.

    --print("slot data dump begin")
    --print(dump_table(slot_data))
    --print("slot data dump end")
end

function bulkUpdateFinished(duration)
    print("Finished sleeping for " .. duration .. " seconds")
    Tracker.BulkUpdate = false
    forceLogicUpdate()
end

function onClearHandler(slot_data)
    -- Disable tracker updates.
    Tracker.BulkUpdate = true
    -- Use a protected call so that tracker updates always get enabled again, even if an error occurred.
    local ok, err = pcall(onClear, slot_data)
    -- Enable tracker updates again.
    if ok then
        -- The 10ms sleep duration is entirely arbitrary, it may be better to increase it to account for slower
        -- computers.
        -- Sleep for 10ms before disabling `Tracker.BulkUpdate` to give some time for items and locations received from
        -- AP be updated in the tracker and then re-enable tracker logic updates afterwards.
        ScriptHost:RunScriptAsync("scripts/sleep.lua", 0.01, bulkUpdateFinished, nil)
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

    local v = LOCATION_MAPPING[location_id]
    if not v then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end

    local location_code = v[1]
    if not location_code then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end

    local obj = Tracker:FindObjectForCode(location_code)
    if obj then
        if location_code:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
        -- DEBUG
        print("onLocation: checked spot "..location_code)
    else
        print(string.format("onLocation: could not find object for code %s", location_code))
    end
end

--called when Get("events") returns
--function onEventsLaunch()
--end

Archipelago:AddClearHandler("clear handler", onClearHandler)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
--Archipelago:AddSetReplyHandler("event handler", onEvent)
--Archipelago:AddRetrievedHandler("event launch handler", onEventsLaunch)