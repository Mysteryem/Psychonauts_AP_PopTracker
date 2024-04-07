ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

-- Assuming this tracks the received order of items
CUR_INDEX = -1
--SLOT_DATA = nil

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

-- Offset from PsychoRando ID to Archipelago ID
AP_ITEM_OFFSET = 42690000
AP_LOCATION_OFFSET = AP_ITEM_OFFSET

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


function onClear(slot_data)
    --SLOT_DATA = slot_data
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
    for _, v in pairs(ITEM_MAPPING) do
        item_code = v[1]
        item_type = v[2]
        if item_code and item_type then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", item_code, item_type))
            end
            local obj = Tracker:FindObjectForCode(item_code)
            if obj then
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
        print("welp")
        return
    end

    -- ahit important slot_data variables
    --[[
    slot_data["RandomizeHatOrder"]  --not handling this atm, assuming it's on
    ["Hat5"]
    ["Hat2"]
    ["Hat4"]
    ["Hat1"]
    ["Hat3"]
    ["SprintYarnCost"]
    ["BrewingYarnCost"]
    ["IceYarnCost"]
    ["DwellerYarnCost"]
    ["TimeStopYarnCost"]

    ["ShuffleActContracts"]  --not handling this atm, assuming it's on
    ["ShuffleStorybookPages"]  --not handling this atm, assuming it's on
    ["CTRWithSprint"]
    ["SDJLogic"]

    -- I think the above marked variables don't even need handling, they'd
    -- still get tracked but are just hidden from view - so no changes necessary
    -- also I believe the Hat1..5 slot data still exists with hat rando off
    -- (just populated 0..4) so that would still work too
    ]]--

    --print(dump_table(slot_data))
end

function clearBrainCount()
    local obj = Tracker:FindObjectForCode("camper_brain")
    obj.AcquiredCount = 0
end

function updateBrainCount(received_item_code)
    if has_value(BRAIN_CODES, received_item_code) then
        print(string.format("updateBrainCount: %s is a brain, incrementing brain count", received_item_code))
        --count = 0
        --for _, v in ipairs(BRAIN_CODES) do
        --    local obj = Tracker:FindObjectForCode(v)
        --    if obj.Active then
        --        count = count + 1
        --    end
        --end
        local obj = Tracker:FindObjectForCode("camper_brain")
        obj.AcquiredCount = obj.AcquiredCount + obj.Increment
    else
        print(string.format("updateBrainCount: %s is not a brain, doing nothing", received_item_code))
    end
end

function onItem(index, ap_item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;

    local item_id = ap_item_id - AP_ITEM_OFFSET

    local v = ITEM_MAPPING[item_id]
    if not v then
        --DEBUG
        print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end

    local item_code = v[1]
    if not item_code then
        --DEBUG
        print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end

    local obj = Tracker:FindObjectForCode(item_code)
    if obj then
        item_type = v[2]
        if item_type == "toggle" then
            obj.Active = true
            -- Extra handling for the fake consumable brain item used to show the current total number of brains
            updateBrainCount(item_code)
        elseif item_type == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif item_type == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
        --DEBUG
        print("onItem: Updated item check "..v[1])
    else
        print(string.format("onItem: could not find object for code %s", v[1]))
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

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
--Archipelago:AddSetReplyHandler("event handler", onEvent)
--Archipelago:AddRetrievedHandler("event launch handler", onEventsLaunch)