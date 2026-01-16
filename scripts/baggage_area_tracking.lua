require("scripts/constants")
require("scripts/autotracking/item_mapping")
require("scripts/autotracking/location_mapping")

local AREA_TO_ITEM_SUFFIX = {
    ["CA Lab+Ford"] = "_in_ca_lab+ford",
    ["CA GPC"] = "_in_ca_gpc",
    ["CA Main"] = "_in_ca_main",
    ["CA Cabins"] = "_in_ca_cabins",
    ["CA Reception"] = "_in_ca_reception",
    ["CA Lake"] = "_in_ca_lake",
    ["AS Grounds+Courtyard"] = "_in_as_grounds+courtyard",
    ["AS Upper"] = "_in_as_upper",
    ["AS Lab"] = "_in_as_lab",
    ["BB"] = "_in_bb",
    ["SA"] = "_in_sa",
    ["MI"] = "_in_mi",
    ["BT"] = "_in_bt",
    ["LO"] = "_in_lo",
    ["MM"] = "_in_mm",
    ["TH"] = "_in_th",
    ["WW"] = "_in_ww",
    ["BV"] = "_in_bv",
    ["MC"] = "_in_mc",
}
local BAGGAGE_CODE_TO_ITEM_PREFIX = {
    dufflebag="dufflebags",
    hatbox="hatboxes",
    purse="purses",
    steamer_trunk="steamertrunks",
    suitcase="suitcases",
}
local AREAS = {
    ["CA Lab+Ford"] = {
        "@CASA/(CA Lab) Behind Furniture/",
        "@CASA/(CA Lab) Staircase Ledges/",
        "@CASA/(CA Lab) Upper Ledge/",
        "@CAJA/(CA Ford) Top of Sanctuary/",
        "@CAJA/(CA Ford) Bottom of Sanctuary/",
    },
    ["CA GPC"] = {
        "@CAGP/(CA GPC) Top of GPC/",
        "@CAGP/(CA GPC) Under GPC/",
        "@CAGP/(CA GPC) Mountain Lion Log Bridge/",
        "@CAGP/(CA GPC) Above Entrance to Lake/",
        "@CAGP/(CA GPC) Rock Wall Behind Tree/",
        "@CAGP/(CA GPC) Rock Wall Top/",
        "@CAGP/(CA GPC) Tree Near Fence/",
        "@CAGP/(CA GPC) Tree Near Geyser/",
        "@CAGP/(CA GPC) Fence Behind GPC/",
        "@CAGP/(CA GPC) Near the Bear/",
        "@CAGP/(CA GPC) Rocky Platforms Behind GPC Right/",
        "@CAGP/(CA GPC) Rocky Platforms Behind GPC Left/",
        "@CAGP/(CA GPC) Top of Log Flume/",
        "@CAGP/(CA GPC) Ride the Log Flume/",
        "@CAGP/(CA GPC) Bottom of Log Flume/",
        "@CAGP/(CA GPC) Big Rock Near Ford/",
        "@CAGP/(CA GPC) Inside the Ruined Cabin/",
        "@CAGP/(CA GPC) Branch Swinging Course Start/",
        "@CAGP/(CA GPC) Branch Swinging Course Mid/",
        "@CAGP/(CA GPC) Branch Swinging Course End/",
        "@CAGP/(CA GPC) Branch Above Squirrel/",
        "@CAGP/(CA GPC) Creek Grate/",
        "@CAGPSquirrel/(CA GPC) Squirrel's Acorn/",
        "@CAGPGeyser/(CA GPC) Wedged in the Geyser/",
    },
    ["CA Main"] = {
        "@CAMA/(CA Main) Fence Near Kids' Cabins/",
        "@CAMA/(CA Main) Under Lodge Front Steps/",
        "@CAMA/(CA Main) Behind Tree Near Lodge/",
        "@CAMA/(CA Main) Under the Lodge/",
        "@CAMA/(CA Main) Loudspeaker 1 Platform/",
        "@CAMA/(CA Main) Under Lodge Metal Roof/",
        "@CAMA/(CA Main) Loudspeaker Tightrope Walk/",
        "@CAMA/(CA Main) Loudspeaker 2 Platform/",
        "@CAMA/(CA Main) Lodge Roof/",
        "@CAMA/(CA Main) Metal Roof Outcropping/",
        "@CAMA/(CA Main) Loudspeaker Above Stump/",
        "@CAMA/Tree Platform/(CA Main) Tree Platform Left",
        "@CAMA/Tree Platform/(CA Main) Tree Platform Right",
        "@CAMA/(CA Main) Rock Wall Top/",
        "@CAMA/(CA Main) Parking Lot Arch/",
        "@CAMA/(CA Main) Parking Lot Small Log/",
        "@CAMA/(CA Main) Oleander's Car/",
        "@CAMA/(CA Main) Parking Lot Basketball Hoop/",
        "@CAMALev/(CA Main) Parking Lot History Board/",
        "@CAMA/(CA Main) Parking Lot Outhouse/",
        "@CAMA/(CA Main) Rock Near Bench/",
    },
    ["CA Cabins"] = {
        "@CAKC/(CA Cabins) Grinding on the Roots/",
        "@CAKC/(CA Cabins) Under Stairs/",
        "@CAKC/(CA Cabins) Top of Loudspeaker/",
        "@CAKC/(CA Cabins) Cabin Roof 1/",
        "@CAKC/(CA Cabins) Trampoline Above Outhouse/",
        "@CAKC/(CA Cabins) Trampoline Platform/",
        "@CAKC/(CA Cabins) Cabins Outhouse/",
        "@CAKC/(CA Cabins) Behind Cabin/",
        "@CAKC/(CA Cabins) Roof of Cabin 2/",
        "@CAKC/(CA Cabins) Cave Entrance/",
        "@CAKC/(CA Cabins) Deep Cave Path/",
        "@CAKC/(CA Cabins) Deep Cave Ladder/",
        "@CAKCLev/(CA Cabins) High-Up Tightrope/",
        "@CAKCPyro/(CA Cabins) Cave Refrigerator/",
    },
    ["CA Reception"] = {
        "@CARE/(CA Reception) Graveyard Bear/",
        "@CARE/(CA Reception) Near Beehive/",
        "@CARE/(CA Reception) Mineshaft Trailer Entrance/",
        "@CARE/(CA Reception) Tightrope Start/",
        "@CARE/(CA Reception) Tightrope End/",
        "@CARE/(CA Reception) Rocks Near Trailer/",
        "@CARELev_optional/(CA Reception) Fireplace Tree Lower/",
        "@CARE/(CA Reception) Fireplace Tree Rock/",
        "@CARELev/(CA Reception) Swamp Skinny Poles/",
        "@CARE/(CA Reception) Big Log Platform/",
        "@CARE/(CA Reception) Above Waterfall Left/",
        "@CARE/(CA Reception) Above Waterfall Right/",
        "@CARE/(CA Reception) Behind the Waterfall/",
        "@CARE/(CA Reception) Weird Tree Left/",
        "@CARE/(CA Reception) Weird Tree Right/",
        "@CARE/(CA Reception) Log Hill Top/",
        "@CARE/(CA Reception) Log Hill Behind/",
        "@CARE/(CA Reception) Mineshaft Grind Rail/",
        "@CARE/Mineshaft Upper Entrance/(CA Reception) Mineshaft Upper Entrance",
        "@CARE/Mineshaft Upper Entrance/(CA Reception) Mineshaft Above Upper Entrance",
        "@CARE/(CA Reception) Inside Mineshaft/",
        "@CARE/(CA Reception) Mineshaft Bear/",
        "@CARE/(CA Reception) Swamp Bird's Nest/",
        "@CARE/(CA Reception) Collapsed Cave/",
        "@CARELev/(CA Reception) Fireplace Tree Top/",
        "@CAREMark/(CA Reception) Hornet Nest/",
    },
    ["CA Lake"] = {
        "@CABH/(CA Lake) Under the First Bridge/",
        "@CABH/(CA Lake) Behind Stump/",
        "@CABH/(CA Lake) Left of Entrance Rock Wall/",
        "@CABH/(CA Lake) Poles on Lake/",
        "@CABH/Bathysphere/(CA Lake) Bathysphere Roof",
        "@CABH/(CA Lake) Bathysphere Dock/",
        "@CABH/(CA Lake) Metal Roof Above Docks/",
        "@CABH/(CA Lake) Above Ford Ropes/",
        "@CABH/(CA Lake) Above Ford Cabin Platform/",
        "@CABH/(CA Lake) Outside Cougar Cave/",
        "@CABH/(CA Lake) Inside Cougar Cave/",
        "@CABH/(CA Lake) Bulletin Board Bushes/",
        "@CABH/Pink Tree Platform/(CA Lake) Pink Trees Platform Left",
        "@CABH/Pink Tree Platform/(CA Lake) Pink Trees Platform Right",
        "@CABH/(CA Lake) Rock Wall Upper/",
        "@CABH/(CA Lake) Lake Shore/",
        "@CABH/(CA Lake) Tiny Island/",
        "@CABHLev/(CA Lake) Top of Big Rock/",
        "@CABH/(CA Lake) Rock Wall Gap/",
        "@CABH/Bathysphere/(CA Lake) Lungfish Boss Complete",
    },
    ["AS Grounds+Courtyard"] = {
        "@ASGR/(AS Grounds) Rock Wall Bottom/",
        "@ASGR/(AS Grounds) Rock Wall Ladder/",
        "@ASGRLev/(AS Grounds) Outside Front Gate/",
        "@ASGRLev/(AS Grounds) Pillar Above Gate/",
        "@ASGR/(AS Grounds) Fountain Top/",
        "@ASGR/(AS Grounds) Hedge Alcove/",
        "@ASGR/(AS Grounds) Asylum Doors Right/",
        "@ASGR/(AS Grounds) Asylum Doors Left/",
        "@ASGR/(AS Grounds) Corner Near Fence/",
        "@ASGR/(AS Grounds) Ledge Before Gloria/",

        "@ASCO/(AS Courtyard) Above Elevator/",
        "@ASCOInvis/(AS Courtyard) Crow's Basket/",
        "@ASCO/(AS Courtyard) Ledge Above Fred Left/",
        "@ASCO/(AS Courtyard) Ledge Above Fred Right/",
        "@ASCO/(AS Courtyard) Ledge Opposite Elevator/",
        "@ASCO/(AS Courtyard) Edgar's Room/",
        "@ASCO/(AS Courtyard) Behind Elevator/",
        "@ASCO/(AS Courtyard) Junk Corner/",
        "@ASCOLev/(AS Courtyard) Above Edgar/",
    },
    ["AS Upper"] = {
        "@ASUP/(AS Upper) Behind Mattress Wall/",
        "@ASUP/(AS Upper) Checkered Bathroom/",
        "@ASUP/(AS Upper) Room Near Checkered Bathroom/",
        "@ASUP/(AS Upper) Elevator Shaft/",
        "@ASUP/(AS Upper) Room Left of Pipe Slide/",
        "@ASUP/(AS Upper) Floating in Hole/",
        "@ASUP/(AS Upper) Next to Hole/",
        "@ASUP/(AS Upper) Crumbling Outer Wall Planks/",
        "@ASUP/(AS Upper) Crumbling Outer Wall Pillar/",
        "@ASUP/(AS Upper) Crumbling Outer Wall Below Platform/",
        "@ASUPLev_optional/(AS Upper) Crumbling Outer Wall Platform/",
        "@ASUPLev_optional/(AS Upper) Room Above Tilted Stairs/",
        "@ASUPLev_optional/(AS Upper) Acid Room Floor/",
        "@ASUPLev_optional/(AS Upper) Acid Room Table/",
        "@ASUPLev_optional/(AS Upper) Acid Room Window/",
        "@ASUPLev_optional/(AS Upper) Acid Room Overhang/",
        "@ASUPLev_optional/(AS Upper) Small Windows Ledge/",
        "@ASUPLev_optional/(AS Upper) Round Wood Platform/",
        "@ASUPLev_optional/(AS Upper) Grate Climb Bottom/",
        "@ASUPLev_optional/(AS Upper) Grate Climb Mid/",
        "@ASUPLev_optional/Sink Platform/(AS Upper) Sink Platform Left",
        "@ASUPLev_optional/Sink Platform/(AS Upper) Sink Platform Right",
        "@ASUPLev/(AS Upper) Pipes Below Chair Door/",
        "@ASUPTele_optional/(AS Upper) Room Opposite Chair Door/",
        "@ASUPTele/(AS Upper) Pipe Slide Near Chair Door/",
        "@ASUPTele/(AS Upper) Rafters Above Chair Door/",
    },
    ["AS Lab"] = {
        "@ASLB/(AS Lab) Lab Caged Crow Left/",
        "@ASLB/(AS Lab) Lab Caged Crow Right/",
        "@ASLB/(AS Lab) Next to Pokeylope/",
        "@ASLB/(AS Lab) Lab Top Railing Left 1/",
        "@ASLB/(AS Lab) Lab Top Railing Left 2/",
        "@ASLB/(AS Lab) Lab Top Elevator/",
        "@ASLB/(AS Lab) Lab Top Railing Right/",
        "@ASLB/(AS Lab) Tea Room/",
    },
    ["BB"] = {
        "@BBA1/(BB Area 1) Jumping Tutorial 1/",
        "@BBA1/(BB Area 1) Jumping Tutorial 2/",
        "@BBA1/(BB Area 1) Pole-Climbing Tutorial Floor/",
        "@BBA1/(BB Area 1) Below the Triple Trampolines/",
        "@BBA2/(BB Area 2) Giant Soldier Cut-Out/",
        "@BBA2/(BB Area 2) Dodging Bullets 1/",
        "@BBA2/(BB Area 2) Dodging Bullets 2/",
        "@BBA2/(BB Area 2) Machine Gun Turret/",
        "@BBA2/(BB Area 2) Pole-Swinging Tutorial/",
        "@BBA2Duster/(BB Area 2) Trapeze Cobweb/",
        "@BBA2/(BB Area 2) Trapeze Platform/",
        "@BBA2/(BB Area 2) Inside Plane Wreckage/",
        "@BBA2/End of Obstacle Course/(BB Finale) End of Obstacle Course Left",
        "@BBA2/End of Obstacle Course/(BB Finale) End of Obstacle Course Right",
        "@BBA2/(BB Finale) Basic Braining Complete/",
    },
    ["SA"] = {
        "@SACU/(SA Main) On the Bed/",
        "@SACU/(SA Main) On the Pillow/",
        "@SACU/Building Blocks Left/(SA Main) Building Blocks Left",
        "@SACU/Building Blocks Left/(SA Main) Building Blocks Below",
        "@SACU/(SA Main) Building Blocks Right/",
        "@SACU/(SA Main) Top of Bed Frame/",
        "@SACU/(SA Main) Round Platforms Bottom/",
        "@SACU/(SA Main) Round Platforms Near Valve/",
        "@SACULev/(SA Main) Round Platforms Far from Valve/",
        "@SACU/(SA Main) Side of Cube Face 3/",
        "@SACU/(SA Main) Bottom of Shoebox Ladder/",
        "@SACU/(SA Main) Shoebox Pedestal/",
        "@SACU/(SA Main) Shoebox Tower Top/",
        "@SACU/(SA Main) Flame Tower Steps/",
        "@SACU/(SA Main) Flame Tower Top 1/",
        "@SACU/(SA Main) Flame Tower Top 2/",
        "@SACU/(SA Main) Sasha's Shooting Gallery Complete/",
    },
    ["MI"] = {
        "@MIFL/(MI Area 1) Intro Rings Tutorial/",
        "@MIFL/(MI Area 1) Dancing Camper Platform 1/",
        "@MIFL/(MI Area 1) Demon Room/",
        "@MIFL/(MI Area 1) Windy Ladder Bottom/",
        "@MIFL/(MI Area 1) Pinball Plunger/",
        "@MIFL/(MI Area 1) Plunger Party Ledge/",
        "@MIFL/(MI Area 1) Grindrail Rings/",
        "@MIFL/(MI Area 1) Censor Hallway/",
        "@MIFL/(MI Area 1) Pink Bowl Bottom/",
        "@MIFL/(MI Area 1) Pink Bowl Small Platform/",
        "@MIFL/(MI Finale) Bubbly Fan Bottom/",
        "@MIFL/(MI Finale) Bubbly Fan Platform/",
        "@MIFL/(MI Finale) Bubbly Fan Top/",
        "@MIFL/(MI Finale) Milla's Party Room/",
        "@MIFL/(MI Finale) Milla's Dance Party Complete/",
    },
    ["BT"] = {
        "@NIMP/(BT Main) Outside Caravan/",
        "@NIMP/(BT Main) Behind the Egg/",
        "@NIMP/(BT Main) Shadow Monster Path/",
        "@NIMPMark/(BT Main) Shadow Monster Blue Mushrooms/",
        "@NIMPMark/(BT Main) Ledge Behind Shadow Monster/",
        "@NIMPMark/(BT Main) Below the Steep Ledge/",
        "@NIMPMark/(BT Main) Forest Path Blue Mushrooms/",
        "@NIMPMark/(BT Main) Forest Blue Ledge/",
        "@NIMPMark/(BT Main) Forest High Platform/",
        "@NIMPMark/(BT Main) Forest Path Thorns/",
        "@NIMPMark/(BT Main) Behind Thorn Tower Left/",
        "@NIMPMark/(BT Main) Behind Thorn Tower Mid/",
        "@NIMPMark/(BT Main) Behind Thorn Tower Right/",
        "@NIBA/(BT Boss) Brain Tumbler Experiment Complete/",
    },
    ["LO"] = {
        "@LOMA/(LO Main) Skyscraper Start/",
        "@LOMA/(LO Main) Corner Near First Jail/",
        "@LOMA/(LO Main) Skyscraper before Dam/",
        "@LOMAShield/(LO Main) Behind Lasers Left 1/",
        "@LOMAShield/(LO Main) Behind Lasers Left 2/",
        "@LOMAShield/(LO Main) Behind Lasers Right/",
        "@LOMAShield/(LO Main) Blimp Hop/",
        "@LOMAShield/(LO Main) End of Dam/",
        "@LOMAShield/(LO Main) End of Dam Platform/",
        "@LOMAShield/(LO Main) Skyscraper after Dam/",
        "@LOMAShield/(LO Main) Near Battleships/",
        "@LOMAShield/(LO Main) On the Bridge/",
        "@LOMAShield/(LO Main) Ground after Bridge/",
        "@LOMAShield/(LO Main) Skyscraper after Bridge/",
        "@LOMAShield/(LO Main) Train Tunnel/",
        "@LOMAShield/(LO Main) Final Skyscrapers Left/",
        "@LOMAShield/(LO Main) Final Skyscrapers Right/",
        "@LOMAShield/(LO Boss) Kochamara Intro Left/",
        "@LOMAShield/(LO Boss) Kochamara Intro Right/",
        "@LOMAShield/(LO Boss) Lungfishopolis Complete/",
    },
    ["MM"] = {
        "@MMI1/(MM Neighborhood) Boyd's Fridge/",
        "@MMI1BeforeSign/(MM Neighborhood) Inside First House/",
        "@MMI1BeforeSign/(MM Neighborhood) Inside Second House/",
        "@MMI1BeforeSign/(MM Neighborhood) Car Trunk 1 (Stop Sign)/",
        "@MMI1AfterSign/(MM Neighborhood) Roof after Road Crew/",
        "@MMI1AfterSign/(MM Neighborhood) Car Trunk 2/",
        "@MMI1AfterSign/(MM Neighborhood) Car House Backyard/",
        "@MMI1Duster_optional/(MM Neighborhood) Inside Webbed Garage/",
        "@MMI1AfterSign/(MM Neighborhood) Graveyard Patio/",
        "@MMI1AfterSign/(MM Neighborhood) Graveyard Behind Tree/",
        "@MMI1AfterSign/(MM Neighborhood) Behind Graveyard/",
        "@MMI1AfterSign/(MM Neighborhood) Hedge Maze/",
        "@MMI1AfterSign/(MM Neighborhood) Car Trunk 3/",
        "@MMI1AfterSign/(MM Neighborhood) Post Office Roof/",
        "@MMI1AfterSign/(MM Neighborhood) Post Office Lobby/",
        "@MMI1Duster/(MM Neighborhood) Post Office Basement/",
        "@MMI1HedgeTrimmers/Landscapers House/(MM Neighborhood) Landscapers House Backyard",
        "@MMI1HedgeTrimmers/Landscapers House/(MM Neighborhood) Landscapers House Table",
        "@MMI1RollingPin/(MM Neighborhood) Landscapers House Kitchen/",
        "@MMI1Powerlines/(MM Neighborhood) Powerline Island Sandbox/",
        "@MMI1Powerlines/(MM Neighborhood) Powerline Island Left/",
        "@MMI1Powerlines/(MM Neighborhood) Powerline Island Right/",
        "@MMI2/(MM Depository) Behind Book Depository/",
        "@MMDM/(MM Depository) Milkman Complete/",
    },
    ["TH"] = {
        "@THMS/(TH Stage) Near the Critic/",
        "@THMSLev/(TH Stage) In the Audience/",
        "@THMS/(TH Stage) Below the Spotlight/",
        "@THMS/(TH Stage) Behind Stage/",
        "@THMSDuster_optional/(TH Stage) Behind Stage Cobweb/",
        "@THMSStorage/(TH Stage) Storage Room Floor/",
        "@THMSStorage/(TH Stage) Storage Room Left/",
        "@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Lower",
        "@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Upper",
        "@THMSBonita/(TH Stage) Bonita's Room/",
        "@THCW/(TH Catwalks) Doghouse Slicers/",
        "@THCW/(TH Catwalks) Big Platform 1/",
        "@THCW/(TH Catwalks) Big Platform 2/",
        "@THCW/Big Platform Corner/(TH Catwalks) Big Platform 3",
        "@THCW/Big Platform Corner/(TH Catwalks) Big Platform Above",
        "@THCW/(TH Catwalks) Next to Oatmeal/",
        "@THCW/(TH Catwalks) Candle Basket/",
        "@THCW/(TH Catwalks) Curtain Slide/",
        "@THFB/(TH Catwalks) Gloria's Theater Complete/",
    },
    ["WW"] = {
        "@WWMA/(WW Main) Fred's Room/",
        "@WWMA/(WW Main) The Fireplace/",
        "@WWMA/(WW Main) Game Board/",
        "@WWMACarpRoof/(WW Main) Carpenter's Roof/",
        "@WWMACarpRoof/(WW Main) Tightrope Room/",
        "@WWMA/(WW Main) Outside Villager 1 House/",
        "@WWMA/(WW Main) Small Arch Top/",
        "@WWMA/(WW Main) Small Arch Below/",
        "@WWMA/(WW Main) Top of Villager 2's House/",
        "@WWMALev/(WW Main) Top of Villager 3's House/",
        "@WWMALev/(WW Main) Top of Knight's House/",
        "@WWMA/(WW Main) Castle Tower/",
        "@WWMA/(WW Main) Castle Inside/",
        "@WWMA/(WW Main) Castle Wall/",
        "@WWMADuster/(WW Main) Under the Guillotine/",
        "@WWMADuster/(WW Main) Fred's House Basement/",
        "@WWMABlacksmithLeft/(WW Main) Blacksmith's Left Building/",
        "@WWMABlacksmithRight/(WW Main) Blacksmith's Right Building/",
        "@WWMADusterLevPyro/(WW Main) Blacksmith's Haybale/",
        "@WWMA/(WW Main) Help the Carpenter/",
        "@WWMAV1/(WW Main) Help Villager 1/",
        "@WWMAKnight/(WW Main) Help the Knight/",
        "@WWMAV2/(WW Main) Help Villager 2/",
        "@WWMAV3/(WW Main) Help Villager 3/",
        "@WWMADone/(WW Main) Waterloo World Complete/",
    },
    ["BV"] = {
        "@BVRB/(BV Streets) Club Street Lady/",
        "@BVRBLev_optional/(BV Streets) Club Street Metal Balcony/",
        "@BVRBLev/(BV Streets) Heart Street HIGH Balcony/",
        "@BVRB/(BV Streets) Alleyways Ledge/",
        "@BVRB/(BV Streets) Sewers Main/",
        "@BVRBTele/(BV Streets) Club Street Gated/",
        "@BVRBLogs/(BV Streets) Burn the Logs/",
        "@BVRBTele/(BV Streets) The Garden/",
        "@BVRB/(BV Streets) Near Diego's House/",
        "@BVRBDuster/(BV Streets) Diego's Bed/",
        "@BVRBDuster_optional/(BV Streets) Diego's House Grindrail/",
        "@BVRBDuster/(BV Streets) Diego's Room/",
        "@BVRBDuster_optional/(BV Streets) Grindrail Balcony/",
        "@BVESLev/(BV Edgar) Sanctuary Balcony/",
        "@BVES/(BV Edgar) Sanctuary Ground/",
        "@BVES/(BV Edgar) Tiger Wrestler/",
        "@BVES/(BV Edgar) Dragon Wrestler/",
        "@BVES/(BV Edgar) Eagle Wrestler/",
        "@BVESCobra/(BV Edgar) Cobra Wrestler/",
        "@BVESBoss/(BV Edgar) Black Velvetopia Complete/",
    },
    ["MC"] = {
        "@MCTCLev/(MC Main) Entrance Awning/",
        "@MCTC/(MC Main) Crumbling Path/",
        "@MCTC/(MC Main) Crumbling Path End Right/",
        "@MCTC/(MC Main) Crumbling Path End Left/",
        "@MCTC/(MC Main) Ollie Escort Floor/",
        "@MCTCEscort/(MC Main) Ollie Escort Middle/",
        "@MCTCEscortTop/Ollie Escort Top/(MC Main) Ollie Escort Top Left",
        "@MCTCEscortTop/Ollie Escort Top/(MC Main) Ollie Escort Top Right",
        "@MCTCToL/(MC Main) Tunnel of Love Start/",
        "@MCTCToL/(MC Main) Tunnel of Love Corner/",
        "@MCTCToL/(MC Main) Tunnel of Love Rail/",
        "@MCTCToL/(MC Main) Next to the Final Door/",
    },
}

local _LOCATION_MAPPING_REVERSE = {}
for location_id, section_path in pairs(LOCATION_MAPPING) do
    _LOCATION_MAPPING_REVERSE[section_path] = location_id
end

-- Note: Only includes locations that physically place an item into the game world.
local LOCATION_ID_TO_AREA = {}
for area_name, section_paths in pairs(AREAS) do
    for _, section_path in ipairs(section_paths) do
        local location_id = _LOCATION_MAPPING_REVERSE[section_path]
        LOCATION_ID_TO_AREA[location_id] = area_name
    end
end

_LOCATION_MAPPING_REVERSE = nil

KNOWN_UNFOUND_BAGGAGE = {}

local function clear_known_unfound_baggage()
    for area_name, _ in pairs(AREAS) do
        local t = {}
        KNOWN_UNFOUND_BAGGAGE[area_name] = t
        for _, code in pairs(BAGGAGE_ITEM_MAPPING) do
            t[code] = {}
        end
    end
end

-- Initialises KNOWN_UNFOUND_BAGGAGE to contain empty tables.
clear_known_unfound_baggage()

local function reset_baggage_in_area_items()
    for _area, item_suffix in pairs(AREA_TO_ITEM_SUFFIX) do
        for _, item_prefix in pairs(BAGGAGE_CODE_TO_ITEM_PREFIX) do
            local item = Tracker:FindObjectForCode(item_prefix..item_suffix)
            if item ~= nil then
                item.AcquiredCount = 0
            end
        end
    end
end

function baggage_area_tracking_clear_known_unfound_baggage()
    clear_known_unfound_baggage()
    reset_baggage_in_area_items()
end


-- It is assumed that the hint is for a location in the current player's world.
function baggage_area_tracking_register_hint(hint)
    if hint.found then
        -- The item has been found.
        -- Already found baggage cannot contribute to baggage being in-logic.
        return
    end
    local baggage_code = BAGGAGE_ITEM_MAPPING[hint.item - AP_ITEM_OFFSET]
    if baggage_code == nil then
        -- The hinted item is not baggage.
        return
    end

    local location_id = hint.location - AP_LOCATION_OFFSET
    local area_name = LOCATION_ID_TO_AREA[location_id]
    if area_name == nil then
        -- The hinted item is not at a location that places items into the game world?
        -- This should not normally happen because Baggage items must be placed locally in locations that physically
        -- place an item into the world.
        return
    end
    -- Get the section path for this AP location.
    local section_path = LOCATION_MAPPING[location_id]
    if section_path == nil then
        print("Error: Could not get section path for "..tostring(location_id))
        return
    end
    -- Get the section object for the AP location.
    local section_obj = Tracker:FindObjectForCode(section_path)
    if section_obj == nil then
        print("Error: Could not get section from path "..section_path)
        return
    end

    -- Get the baggage table for this area.
    local per_area_table = KNOWN_UNFOUND_BAGGAGE[area_name]
    if per_area_table == nil then
        print("Error: No per-area table found for "..area_name)
        return
    end
    local per_area_per_baggage_table = per_area_table[baggage_code]
    if per_area_per_baggage_table == nil then
        print("Error: No per-baggage table found for "..baggage_code.." in area "..area_name)
        return
    end

    -- Get the item that stores the count of how many baggage of this type are in this area.
    local item_code_prefix = BAGGAGE_CODE_TO_ITEM_PREFIX[baggage_code]
    if item_code_prefix == nil then
        print("Error: No item code prefix found for "..baggage_code)
        return
    end
    local item_code_suffix = AREA_TO_ITEM_SUFFIX[area_name]
    if item_code_suffix == nil then
        print("Error: No item code suffix found for "..area_name)
        return
    end
    local item = Tracker:FindObjectForCode(item_code_prefix..item_code_suffix)
    if item == nil then
        print("Error: No item found for code "..item_code_prefix..item_code_suffix)
        return
    end

    -- Put the section object into the baggage table for this area.
    table.insert(per_area_per_baggage_table, section_obj)

    -- Updating the item after changing the table is important to ensure that logic always updates *after* the table is
    -- updated.
    -- Increment the count of this baggage type in this area.
    item.AcquiredCount = item.AcquiredCount + item.Increment
    --print("DEBUG: Registered that there is a "..baggage_code.." in "..area_name.." at "..section_path)
end