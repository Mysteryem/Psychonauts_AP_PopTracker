-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/settings_items.json")
Tracker:AddItems("items/pack_settings_items.json")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/CA.json")
Tracker:AddLocations("locations/MI.json")
Tracker:AddLocations("locations/BB.json")
Tracker:AddLocations("locations/BV.json")
Tracker:AddLocations("locations/MM.json")
Tracker:AddLocations("locations/LO.json")
Tracker:AddLocations("locations/BT.json")
Tracker:AddLocations("locations/WW.json")
Tracker:AddLocations("locations/SA.json")
Tracker:AddLocations("locations/TH.json")
Tracker:AddLocations("locations/MC.json")
Tracker:AddLocations("locations/AS.json")

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/items_arrays.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/items_broadcast.json")
Tracker:AddLayouts("layouts/settings.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/archipelago.lua")
end