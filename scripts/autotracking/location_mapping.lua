-- See https://github.com/Akashortstack/Psychonauts_AP/blob/main/Locations.py for IDs
LOCATION_MAPPING = {
    -- CASA
    [1] = {"@CASA/(CA Lab) Behind Furniture/"},
    [2] = {"@CASA/(CA Lab) Staircase Ledges/"},
    [3] = {"@CASA/(CA Lab) Upper Ledge/"},

    -- CAGP
    [4] = {"@CAGP/(CA GPC) Top of GPC/"},
    [5] = {"@CAGP/(CA GPC) Under GPC/"},
    [6] = {"@CAGP/(CA GPC) Mountain Lion Log Bridge/"},
    [7] = {"@CAGP/(CA GPC) Above Entrance to Lake/"},
    [8] = {"@CAGP/(CA GPC) Rock Wall Behind Tree/"},
    [9] = {"@CAGP/(CA GPC) Rock Wall Top/"},
    [10] = {"@CAGP/(CA GPC) Tree Near Fence/"},
    [11] = {"@CAGP/(CA GPC) Tree Near Geyser/"},
    [12] = {"@CAGP/(CA GPC) Fence Behind GPC/"},
    [13] = {"@CAGP/(CA GPC) Near the Bear/"},
    [14] = {"@CAGP/(CA GPC) Rocky Platforms Behind GPC Right/"},
    [15] = {"@CAGP/(CA GPC) Rocky Platforms Behind GPC Left/"},
    [16] = {"@CAGP/(CA GPC) Top of Log Flume/"},
    [17] = {"@CAGP/(CA GPC) Ride the Log Flume/"},
    [18] = {"@CAGP/(CA GPC) Bottom of Log Flume/"},
    [19] = {"@CAGP/(CA GPC) Big Rock Near Ford/"},
    [20] = {"@CAGP/(CA GPC) Inside the Ruined Cabin/"},
    [21] = {"@CAGP/(CA GPC) Branch Swinging Course Start/"},
    [22] = {"@CAGP/(CA GPC) Branch Swinging Course Mid/"},
    [23] = {"@CAGP/(CA GPC) Branch Swinging Course End/"},
    [24] = {"@CAGP/(CA GPC) Branch Above Squirrel/"},
    [25] = {"@CAGP/(CA GPC) Creek Grate/"},
    [26] = {"@CAGPSquirrel/(CA GPC) Squirrel's Acorn/"},
    [27] = {"@CAGPGeyser/(CA GPC) Wedged in the Geyser/"},

    -- CAMA
    [28] = {"@CAMA/(CA Main) Fence Near Kids' Cabins/"},
    [29] = {"@CAMA/(CA Main) Under Lodge Front Steps/"},
    [30] = {"@CAMA/(CA Main) Behind Tree Near Lodge/"},
    [31] = {"@CAMA/(CA Main) Under the Lodge/"},
    [32] = {"@CAMA/(CA Main) Loudspeaker 1 Platform/"},
    [33] = {"@CAMA/(CA Main) Under Lodge Metal Roof/"},
    [34] = {"@CAMA/(CA Main) Loudspeaker Tightrope Walk/"},
    [35] = {"@CAMA/(CA Main) Loudspeaker 2 Platform/"},
    [36] = {"@CAMA/(CA Main) Lodge Roof/"},
    [37] = {"@CAMA/(CA Main) Metal Roof Outcropping/"},
    [38] = {"@CAMA/(CA Main) Loudspeaker Above Stump/"},
    [39] = {"@CAMA/Tree Platform/(CA Main) Tree Platform Left"},
    [40] = {"@CAMA/Tree Platform/(CA Main) Tree Platform Right"},
    [41] = {"@CAMA/(CA Main) Rock Wall Top/"},
    [42] = {"@CAMA/(CA Main) Parking Lot Arch/"},
    [43] = {"@CAMA/(CA Main) Parking Lot Small Log/"},
    [44] = {"@CAMA/(CA Main) Oleander's Car/"},
    [45] = {"@CAMA/(CA Main) Parking Lot Basketball Hoop/"},
    [46] = {"@CAMALev/(CA Main) Parking Lot History Board/"},
    [47] = {"@CAMA/(CA Main) Parking Lot Outhouse/"},
    [48] = {"@CAMA/(CA Main) Rock Near Bench/"},

    -- CAKC
    [49] = {"@CAKC/(CA Cabins) Grinding on the Roots/"},
    [50] = {"@CAKC/(CA Cabins) Under Stairs/"},
    [51] = {"@CAKC/(CA Cabins) Top of Loudspeaker/"},
    [52] = {"@CAKC/(CA Cabins) Cabin Roof 1/"},
    [53] = {"@CAKC/(CA Cabins) Trampoline Above Outhouse/"},
    [54] = {"@CAKC/(CA Cabins) Trampoline Platform/"},
    [55] = {"@CAKC/(CA Cabins) Cabins Outhouse/"},
    [56] = {"@CAKC/(CA Cabins) Behind Cabin/"},
    [57] = {"@CAKC/(CA Cabins) Roof of Cabin 2/"},
    [58] = {"@CAKC/(CA Cabins) Cave Entrance/"},
    [59] = {"@CAKC/(CA Cabins) Deep Cave Path/"},
    [60] = {"@CAKC/(CA Cabins) Deep Cave Ladder/"},
    [61] = {"@CAKCLev/(CA Cabins) High-Up Tightrope/"},
    [62] = {"@CAKCPyro/(CA Cabins) Cave Refrigerator/"},

    -- CARE
    [63] = {"@CARE/(CA Reception) Graveyard Bear/"},
    [64] = {"@CARE/(CA Reception) Near Beehive/"},
    [65] = {"@CARE/(CA Reception) Mineshaft Trailer Entrance/"},
    [66] = {"@CARE/(CA Reception) Tightrope Start/"},
    [67] = {"@CARE/(CA Reception) Tightrope End/"},
    [68] = {"@CARE/(CA Reception) Rocks Near Trailer/"},
    [69] = {"@CARELev_optional/(CA Reception) Fireplace Tree Lower/"},
    [70] = {"@CARE/(CA Reception) Fireplace Tree Rock/"},
    [71] = {"@CARELev/(CA Reception) Swamp Skinny Poles/"},
    [72] = {"@CARE/(CA Reception) Big Log Platform/"},
    [73] = {"@CARE/(CA Reception) Above Waterfall Left/"},
    [74] = {"@CARE/(CA Reception) Above Waterfall Right/"},
    [75] = {"@CARE/(CA Reception) Behind the Waterfall/"},
    [76] = {"@CARE/(CA Reception) Weird Tree Left/"},
    [77] = {"@CARE/(CA Reception) Weird Tree Right/"},
    [78] = {"@CARE/(CA Reception) Log Hill Top/"},
    [79] = {"@CARE/(CA Reception) Log Hill Behind/"},
    [80] = {"@CARE/(CA Reception) Mineshaft Grind Rail/"},
    [81] = {"@CARE/Mineshaft Upper Entrance/(CA Reception) Mineshaft Upper Entrance"},
    [82] = {"@CARE/Mineshaft Upper Entrance/(CA Reception) Mineshaft Above Upper Entrance"},
    [83] = {"@CARE/(CA Reception) Inside Mineshaft/"},
    [84] = {"@CARE/(CA Reception) Mineshaft Bear/"},
    [85] = {"@CARE/(CA Reception) Swamp Bird's Nest/"},
    [86] = {"@CARE/(CA Reception) Collapsed Cave/"},
    [87] = {"@CARELev/(CA Reception) Fireplace Tree Top/"},
    [88] = {"@CAREMark/(CA Reception) Hornet Nest/"},

    -- CABH
    [89] = {"@CABH/(CA Lake) Under the First Bridge/"},
    [90] = {"@CABH/(CA Lake) Behind Stump/"},
    [91] = {"@CABH/(CA Lake) Left of Entrance Rock Wall/"},
    [92] = {"@CABH/(CA Lake) Poles on Lake/"},
    [93] = {"@CABH/(CA Lake) Bathysphere Roof/"},
    [94] = {"@CABH/(CA Lake) Bathysphere Dock/"},
    [95] = {"@CABH/(CA Lake) Metal Roof Above Docks/"},
    [96] = {"@CABH/(CA Lake) Above Ford Ropes/"},
    [97] = {"@CABH/(CA Lake) Above Ford Cabin Platform/"},
    [98] = {"@CABH/(CA Lake) Outside Cougar Cave/"},
    [99] = {"@CABH/(CA Lake) Inside Cougar Cave/"},
    [100] = {"@CABH/(CA Lake) Bulletin Board Bushes/"},
    [101] = {"@CABH/Pink Tree Platform/(CA Lake) Pink Trees Platform Left"},
    [102] = {"@CABH/Pink Tree Platform/(CA Lake) Pink Trees Platform Right"},
    [103] = {"@CABH/(CA Lake) Rock Wall Upper/"},
    [104] = {"@CABH/(CA Lake) Lake Shore/"},
    [105] = {"@CABH/(CA Lake) Tiny Island/"},
    [106] = {"@CABHLev/(CA Lake) Top of Big Rock/"},
    [107] = {"@CABH/(CA Lake) Rock Wall Gap/"},

    -- CALI
    [108] = {"@CALI/Main Lodge Interior/(CA Lodge) Main Lodge Rafters"},

    -- CAJA
    [109] = {"@CAJA/(CA Ford) Top of Sanctuary/"},
    [110] = {"@CAJA/(CA Ford) Bottom of Sanctuary/"},

    -- Rank
    [111] = {"@RANK5to20/Ranks 5 to 20/(Rank) PSI Rank 05"},
    [112] = {"@RANK5to20/Ranks 5 to 20/(Rank) PSI Rank 10"},
    [113] = {"@RANK5to20/Ranks 5 to 20/(Rank) PSI Rank 15"},
    [114] = {"@RANK5to20/Ranks 5 to 20/(Rank) PSI Rank 20"},
    [115] = {"@RANK25to40/Ranks 25 to 40/(Rank) PSI Rank 25"},
    [116] = {"@RANK25to40/Ranks 25 to 40/(Rank) PSI Rank 30"},
    [117] = {"@RANK25to40/Ranks 25 to 40/(Rank) PSI Rank 35"},
    [118] = {"@RANK25to40/Ranks 25 to 40/(Rank) PSI Rank 40"},
    [119] = {"@RANK45to60/Ranks 45 to 60/(Rank) PSI Rank 45"},
    [120] = {"@RANK45to60/Ranks 45 to 60/(Rank) PSI Rank 50"},
    [121] = {"@RANK45to60/Ranks 45 to 60/(Rank) PSI Rank 55"},
    [122] = {"@RANK45to60/Ranks 45 to 60/(Rank) PSI Rank 60"},
    [123] = {"@RANK65to80/Ranks 65 to 80/(Rank) PSI Rank 65"},
    [124] = {"@RANK65to80/Ranks 65 to 80/(Rank) PSI Rank 70"},
    [125] = {"@RANK65to80/Ranks 65 to 80/(Rank) PSI Rank 75"},
    [126] = {"@RANK65to80/Ranks 65 to 80/(Rank) PSI Rank 80"},
    [127] = {"@RANK85to101/Ranks 85 to 101/(Rank) PSI Rank 85"},
    [128] = {"@RANK85to101/Ranks 85 to 101/(Rank) PSI Rank 90"},
    [129] = {"@RANK85to101/Ranks 85 to 101/(Rank) PSI Rank 95"},
    [130] = {"@RANK85to101/Ranks 85 to 101/(Rank) PSI Rank 101"},

    -- ASGR
    [131] = {"@ASGR/(AS Grounds) Rock Wall Bottom/"},
    [132] = {"@ASGR/(AS Grounds) Rock Wall Ladder/"},
    [133] = {"@ASGRLev/(AS Grounds) Outside Front Gate/"},
    [134] = {"@ASGRLev/(AS Grounds) Pillar Above Gate/"},
    [135] = {"@ASGR/(AS Grounds) Fountain Top/"},
    [136] = {"@ASGR/(AS Grounds) Hedge Alcove/"},
    [137] = {"@ASGR/(AS Grounds) Asylum Doors Right/"},
    [138] = {"@ASGR/(AS Grounds) Asylum Doors Left/"},
    [139] = {"@ASGR/(AS Grounds) Corner Near Fence/"},
    [140] = {"@ASGR/(AS Grounds) Ledge Before Gloria/"},

    -- ASCO
    [141] = {"@ASCO/(AS Courtyard) Above Elevator/"},
    [142] = {"@ASCO/(AS Courtyard) Crow's Basket/"},
    [143] = {"@ASCO/(AS Courtyard) Ledge Above Fred Left/"},
    [144] = {"@ASCO/(AS Courtyard) Ledge Above Fred Right/"},
    [145] = {"@ASCO/(AS Courtyard) Ledge Opposite Elevator/"},
    [146] = {"@ASCO/(AS Courtyard) Edgar's Room/"},
    [147] = {"@ASCO/(AS Courtyard) Behind Elevator/"},
    [148] = {"@ASCO/(AS Courtyard) Junk Corner/"},
    [149] = {"@ASCOLev/(AS Courtyard) Above Edgar/"},

    -- ASUP
    [150] = {"@ASUP/(AS Upper) Behind Mattress Wall/"},
    [151] = {"@ASUP/(AS Upper) Checkered Bathroom/"},
    [152] = {"@ASUP/(AS Upper) Room Near Checkered Bathroom/"},
    [153] = {"@ASUP/(AS Upper) Elevator Shaft/"},
    [154] = {"@ASUP/(AS Upper) Room Left of Pipe Slide/"},
    [155] = {"@ASUP/(AS Upper) Floating in Hole/"},
    [156] = {"@ASUP/(AS Upper) Next to Hole/"},
    [157] = {"@ASUP/(AS Upper) Crumbling Outer Wall Planks/"},
    [158] = {"@ASUP/(AS Upper) Crumbling Outer Wall Pillar/"},
    [159] = {"@ASUP/(AS Upper) Crumbling Outer Wall Below Platform/"},
    [160] = {"@ASUPLev_optional/(AS Upper) Crumbling Outer Wall Platform/"},
    [161] = {"@ASUPLev_optional/(AS Upper) Room Above Tilted Stairs/"},
    [162] = {"@ASUPLev_optional/(AS Upper) Acid Room Floor/"},
    [163] = {"@ASUPLev_optional/(AS Upper) Acid Room Table/"},
    [164] = {"@ASUPLev_optional/(AS Upper) Acid Room Window/"},
    [165] = {"@ASUPLev_optional/(AS Upper) Acid Room Overhang/"},
    [166] = {"@ASUPLev_optional/(AS Upper) Small Windows Ledge/"},
    [167] = {"@ASUPLev_optional/(AS Upper) Round Wood Platform/"},
    [168] = {"@ASUPLev_optional/(AS Upper) Grate Climb Bottom/"},
    [169] = {"@ASUPLev_optional/(AS Upper) Grate Climb Mid/"},
    [170] = {"@ASUPLev_optional/Sink Platform/(AS Upper) Sink Platform Left"},
    [171] = {"@ASUPLev_optional/Sink Platform/(AS Upper) Sink Platform Right"},
    [172] = {"@ASUPLev/(AS Upper) Pipes Below Chair Door/"},
    [173] = {"@ASUPTele/(AS Upper) Room Opposite Chair Door/"},
    [174] = {"@ASUPTele/(AS Upper) Pipe Slide Near Chair Door/"},
    [175] = {"@ASUPTele/(AS Upper) Rafters Above Chair Door/"},

    -- ASLB
    [176] = {"@ASLB/(AS Lab) Lab Caged Crow Left/"},
    [177] = {"@ASLB/(AS Lab) Lab Caged Crow Right/"},
    [178] = {"@ASLB/(AS Lab) Next to Pokeylope/"},
    [179] = {"@ASLB/(AS Lab) Lab Top Railing Left 1/"},
    [180] = {"@ASLB/(AS Lab) Lab Top Railing Left 2/"},
    [181] = {"@ASLB/(AS Lab) Lab Top Elevator/"},
    [182] = {"@ASLB/(AS Lab) Lab Top Railing Right/"},
    [183] = {"@ASLB/(AS Lab) Tea Room/"},

    -- BB
    [184] = {"@BBA1/(BB Area 1) Jumping Tutorial 1/"},
    [185] = {"@BBA1/(BB Area 1) Jumping Tutorial 2/"},
    [186] = {"@BBA1/(BB Area 1) Pole-Climbing Tutorial Floor/"},
    [187] = {"@BBA1/(BB Area 1) Below the Triple Trampolines/"},
    [188] = {"@BBA2/(BB Area 2) Giant Soldier Cut-Out/"},
    [189] = {"@BBA2/(BB Area 2) Dodging Bullets 1/"},
    [190] = {"@BBA2/(BB Area 2) Dodging Bullets 2/"},
    [191] = {"@BBA2/(BB Area 2) Machine Gun Turret/"},
    [192] = {"@BBA2/(BB Area 2) Pole-Swinging Tutorial/"},
    [193] = {"@BBA2Duster/(BB Area 2) Trapeze Cobweb/"},
    [194] = {"@BBA2/(BB Area 2) Trapeze Platform/"},
    [195] = {"@BBA2/(BB Area 2) Inside Plane Wreckage/"},
    [196] = {"@BBA2/End of Obstacle Course/(BB Finale) End of Obstacle Course Left"},
    [197] = {"@BBA2/End of Obstacle Course/(BB Finale) End of Obstacle Course Right"},
    [198] = {"@BBA2/(BB Finale) Basic Braining Complete/"},

    -- SA
    [199] = {"@SACU/(SA Main) On the Bed/"},
    [200] = {"@SACU/(SA Main) On the Pillow/"},
    [201] = {"@SACU/Building Blocks Left/(SA Main) Building Blocks Left"},
    [202] = {"@SACU/Building Blocks Left/(SA Main) Building Blocks Below"},
    [203] = {"@SACU/(SA Main) Building Blocks Right/"},
    [204] = {"@SACU/(SA Main) Top of Bed Frame/"},
    [205] = {"@SACU/(SA Main) Round Platforms Bottom/"},
    [206] = {"@SACU/(SA Main) Round Platforms Near Valve/"},
    [207] = {"@SACULev/(SA Main) Round Platforms Far from Valve/"},
    [208] = {"@SACU/(SA Main) Side of Cube Face 3/"},
    [209] = {"@SACU/(SA Main) Bottom of Shoebox Ladder/"},
    [210] = {"@SACU/(SA Main) Shoebox Pedestal/"},
    [211] = {"@SACU/(SA Main) Shoebox Tower Top/"},
    [212] = {"@SACU/(SA Main) Flame Tower Steps/"},
    [213] = {"@SACU/(SA Main) Flame Tower Top 1/"},
    [214] = {"@SACU/(SA Main) Flame Tower Top 2/"},
    [215] = {"@SACU/(SA Main) Sasha's Shooting Gallery Complete/"},

    -- MI
    [216] = {"@MIFL/(MI Area 1) Intro Rings Tutorial/"},
    [217] = {"@MIFL/(MI Area 1) Dancing Camper Platform 1/"},
    [218] = {"@MIFL/(MI Area 1) Demon Room/"},
    [219] = {"@MIFL/(MI Area 1) Windy Ladder Bottom/"},
    [220] = {"@MIFL/(MI Area 1) Pinball Plunger/"},
    [221] = {"@MIFL/(MI Area 1) Plunger Party Ledge/"},
    [222] = {"@MIFL/(MI Area 1) Grindrail Rings/"},
    [223] = {"@MIFL/(MI Area 1) Censor Hallway/"},
    [224] = {"@MIFL/(MI Area 1) Pink Bowl Bottom/"},
    [225] = {"@MIFL/(MI Area 1) Pink Bowl Small Platform/"},
    [226] = {"@MIFL/(MI Finale) Bubbly Fan Bottom/"},
    [227] = {"@MIFL/(MI Finale) Bubbly Fan Platform/"},
    [228] = {"@MIFL/(MI Finale) Bubbly Fan Top/"},
    [229] = {"@MIFL/(MI Finale) Milla's Party Room/"},
    [230] = {"@MIFL/(MI Finale) Milla's Dance Party Complete/"},

    -- BT/NI
    [231] = {"@NIMP/(BT Main) Outside Caravan/"},
    [232] = {"@NIMP/(BT Main) Behind the Egg/"},
    [233] = {"@NIMP/(BT Main) Shadow Monster Path/"},
    [234] = {"@NIMPMark/(BT Main) Shadow Monster Blue Mushrooms/"},
    [235] = {"@NIMPMark/(BT Main) Ledge Behind Shadow Monster/"},
    [236] = {"@NIMPMark/(BT Main) Below the Steep Ledge/"},
    [237] = {"@NIMPMark/(BT Main) Forest Path Blue Mushrooms/"},
    [238] = {"@NIMPMark/(BT Main) Forest Blue Ledge/"},
    [239] = {"@NIMPMark/(BT Main) Forest High Platform/"},
    [240] = {"@NIMPMark/(BT Main) Forest Path Thorns/"},
    [241] = {"@NIMPMark/(BT Main) Behind Thorn Tower Left/"},
    [242] = {"@NIMPMark/(BT Main) Behind Thorn Tower Mid/"},
    [243] = {"@NIMPMark/(BT Main) Behind Thorn Tower Right/"},
    [244] = {"@NIBA/(BT Boss) Brain Tumbler Experiment Complete/"},

    -- LO
    [245] = {"@LOMA/(LO Main) Skyscraper Start/"},
    [246] = {"@LOMA/(LO Main) Corner Near First Jail/"},
    [247] = {"@LOMA/(LO Main) Skyscraper before Dam/"},
    [248] = {"@LOMAShield/(LO Main) Behind Lasers Left 1/"},
    [249] = {"@LOMAShield/(LO Main) Behind Lasers Left 2/"},
    [250] = {"@LOMAShield/(LO Main) Behind Lasers Right/"},
    [251] = {"@LOMAShield/(LO Main) Blimp Hop/"},
    [252] = {"@LOMAShield/(LO Main) End of Dam/"},
    [253] = {"@LOMAShield/(LO Main) End of Dam Platform/"},
    [254] = {"@LOMAShield/(LO Main) Skyscraper after Dam/"},
    [255] = {"@LOMAShield/(LO Main) Near Battleships/"},
    [256] = {"@LOMAShield/(LO Main) On the Bridge/"},
    [257] = {"@LOMAShield/(LO Main) Ground after Bridge/"},
    [258] = {"@LOMAShield/(LO Main) Skyscraper after Bridge/"},
    [259] = {"@LOMAShield/(LO Main) Train Tunnel/"},
    [260] = {"@LOMAShield/(LO Main) Final Skyscrapers Left/"},
    [261] = {"@LOMAShield/(LO Main) Final Skyscrapers Right/"},
    [262] = {"@LOMAShield/(LO Boss) Kochamara Intro Left/"},
    [263] = {"@LOMAShield/(LO Boss) Kochamara Intro Right/"},
    [264] = {"@LOMAShield/(LO Boss) Lungfishopolis Complete/"},

    -- MM
    [265] = {"@MMI1/(MM Neighborhood) Boyd's Fridge/"},
    [266] = {"@MMI1BeforeSign/(MM Neighborhood) Inside First House/"},
    [267] = {"@MMI1BeforeSign/(MM Neighborhood) Inside Second House/"},
    [268] = {"@MMI1BeforeSign/(MM Neighborhood) Car Trunk 1 (Stop Sign)/"},
    [269] = {"@MMI1AfterSign/(MM Neighborhood) Roof after Road Crew/"},
    [270] = {"@MMI1AfterSign/(MM Neighborhood) Car Trunk 2/"},
    [271] = {"@MMI1AfterSign/(MM Neighborhood) Car House Backyard/"},
    [272] = {"@MMI1Duster/(MM Neighborhood) Inside Webbed Garage/"},
    [273] = {"@MMI1AfterSign/(MM Neighborhood) Graveyard Patio/"},
    [274] = {"@MMI1AfterSign/(MM Neighborhood) Graveyard Behind Tree/"},
    [275] = {"@MMI1AfterSign/(MM Neighborhood) Behind Graveyard/"},
    [276] = {"@MMI1AfterSign/(MM Neighborhood) Hedge Maze/"},
    [277] = {"@MMI1AfterSign/(MM Neighborhood) Car Trunk 3/"},
    [278] = {"@MMI1AfterSign/(MM Neighborhood) Post Office Roof/"},
    [279] = {"@MMI1Duster_optional/(MM Neighborhood) Post Office Lobby/"},
    [280] = {"@MMI1Duster/(MM Neighborhood) Post Office Basement/"},
    [281] = {"@MMI1HedgeTrimmers/Landscapers House/(MM Neighborhood) Landscapers House Backyard"},
    [282] = {"@MMI1HedgeTrimmers/Landscapers House/(MM Neighborhood) Landscapers House Table"},
    [283] = {"@MMI1RollingPin/(MM Neighborhood) Landscapers House Kitchen/"},
    [284] = {"@MMI1Powerlines/(MM Neighborhood) Powerline Island Sandbox/"},
    [285] = {"@MMI1Powerlines/(MM Neighborhood) Powerline Island Left/"},
    [286] = {"@MMI1Powerlines/(MM Neighborhood) Powerline Island Right/"},
    [287] = {"@MMI2/(MM Depository) Behind Book Depository/"},
    [288] = {"@MMDM/(MM Depository) Milkman Complete/"},

    -- TH
    [289] = {"@THMS/(TH Stage) Near the Critic/"},
    [290] = {"@THMSLev/(TH Stage) In the Audience/"},
    [291] = {"@THMS/(TH Stage) Below the Spotlight/"},
    [292] = {"@THMS/(TH Stage) Behind Stage/"},
    [293] = {"@THMSDuster_optional/(TH Stage) Behind Stage Cobweb/"},
    [294] = {"@THMSStorage/(TH Stage) Storage Room Floor/"},
    [295] = {"@THMSStorage/(TH Stage) Storage Room Left/"},
    [296] = {"@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Lower"},
    [297] = {"@THMSStorage/Storage Room Right/(TH Stage) Storage Room Right Upper"},
    [298] = {"@THMSStorage/(TH Stage) Bonita's Room/"},
    [299] = {"@THCW/(TH Catwalks) Doghouse Slicers/"},
    [300] = {"@THCW/(TH Catwalks) Big Platform 1/"},
    [301] = {"@THCW/(TH Catwalks) Big Platform 2/"},
    [302] = {"@THCW/Big Platform Corner/(TH Catwalks) Big Platform 3"},
    [303] = {"@THCW/Big Platform Corner/(TH Catwalks) Big Platform Above"},
    [304] = {"@THCW/(TH Catwalks) Next to Oatmeal/"},
    [305] = {"@THCW/(TH Catwalks) Candle Basket/"},
    [306] = {"@THCW/(TH Catwalks) Curtain Slide/"},
    [307] = {"@THFB/(TH Catwalks) Gloria's Theater Complete/"},

    -- WW
    [308] = {"@WWMA/(WW Main) Fred's Room/"},
    [309] = {"@WWMA/(WW Main) The Fireplace/"},
    [310] = {"@WWMA/(WW Main) Game Board/"},
    [311] = {"@WWMACarpRoof/(WW Main) Carpenter's Roof/"},
    [312] = {"@WWMACarpRoof/(WW Main) Tightrope Room/"},
    [313] = {"@WWMA/(WW Main) Outside Villager 1 House/"},
    [314] = {"@WWMA/(WW Main) Small Arch Top/"},
    [315] = {"@WWMA/(WW Main) Small Arch Below/"},
    [316] = {"@WWMA/(WW Main) Top of Villager 2's House/"},
    [317] = {"@WWMALev/(WW Main) Top of Villager 3's House/"},
    [318] = {"@WWMALev/(WW Main) Top of Knight's House/"},
    [319] = {"@WWMA/(WW Main) Castle Tower/"},
    [320] = {"@WWMA/(WW Main) Castle Inside/"},
    [321] = {"@WWMA/(WW Main) Castle Wall/"},
    [322] = {"@WWMADuster/(WW Main) Under the Guillotine/"},
    [323] = {"@WWMADuster/(WW Main) Fred's House Basement/"},
    [324] = {"@WWMABlacksmithLeft/(WW Main) Blacksmith's Left Building/"},
    [325] = {"@WWMADusterLev/(WW Main) Blacksmith's Right Building/"},
    [326] = {"@WWMADusterLevPyro/(WW Main) Blacksmith's Haybale/"},
    [327] = {"@WWMA/(WW Main) Help the Carpenter/"},
    [328] = {"@WWMAV1/(WW Main) Help Villager 1/"},
    [329] = {"@WWMAKnight/(WW Main) Help the Knight/"},
    [330] = {"@WWMAV2/(WW Main) Help Villager 2/"},
    [331] = {"@WWMAV3/(WW Main) Help Villager 3/"},
    [332] = {"@WWMAV3/(WW Main) Waterloo World Complete/"},

    -- BV
    [333] = {"@BVRB/(BV Streets) Club Street Lady/"},
    [334] = {"@BVRBLev/(BV Streets) Club Street Metal Balcony/"},
    [335] = {"@BVRBLev/(BV Streets) Heart Street HIGH Balcony/"},
    [336] = {"@BVRBDuster_optional/(BV Streets) Alleyways Ledge/"},
    [337] = {"@BVRBDuster_optional/(BV Streets) Sewers Main/"},
    [338] = {"@BVRBTele/(BV Streets) Club Street Gated/"},
    [339] = {"@BVRBLogs/(BV Streets) Burn the Logs/"},
    [340] = {"@BVRBGarden/(BV Streets) The Garden/"},
    [341] = {"@BVRBDuster_optional/(BV Streets) Near Diego's House/"},
    [342] = {"@BVRBDuster/(BV Streets) Diego's Bed/"},
    [343] = {"@BVRBDuster/(BV Streets) Diego's Room/"},
    [344] = {"@BVRBDuster/(BV Streets) Diego's House Grindrail/"},
    [345] = {"@BVRBDuster/(BV Streets) Grindrail Balcony/"},
    [346] = {"@BVESLev/(BV Edgar) Sanctuary Balcony/"},
    [347] = {"@BVES/(BV Edgar) Sanctuary Ground/"},
    [348] = {"@BVES/(BV Edgar) Tiger Wrestler/"},
    [349] = {"@BVES/(BV Edgar) Dragon Wrestler/"},
    [350] = {"@BVESEagle/(BV Edgar) Eagle Wrestler/"},
    [351] = {"@BVESCobra/(BV Edgar) Cobra Wrestler/"},
    [352] = {"@BVESBoss/(BV Edgar) Black Velvetopia Complete/"},

    -- MC
    [353] = {"@MCTCEscort/(MC Main) Entrance Awning/"},
    [354] = {"@MCTC/(MC Main) Crumbling Path/"},
    [355] = {"@MCTC/(MC Main) Crumbling Path End Right/"},
    [356] = {"@MCTC/(MC Main) Crumbling Path End Left/"},
    [357] = {"@MCTCEscort/(MC Main) Ollie Escort Floor/"},
    [358] = {"@MCTCEscort/(MC Main) Ollie Escort Middle/"},
    [359] = {"@MCTCEscortTop/Ollie Escort Top/(MC Main) Ollie Escort Top Left"},
    [360] = {"@MCTCEscortTop/Ollie Escort Top/(MC Main) Ollie Escort Top Right"},
    [361] = {"@MCTCToL/(MC Main) Tunnel of Love Start/"},
    [362] = {"@MCTCToL/(MC Main) Tunnel of Love Corner/"},
    [363] = {"@MCTCToL/(MC Main) Tunnel of Love Rail/"},
    [364] = {"@MCTCToL/(MC Main) Next to the Final Door/"},

    -- Events (goals)
    -- Note: These locations do not currently get sent upon completing them.
    [365] = {"@MCTCBoss/Goal - Meat Circus Bosses/(MC Boss) Final Boss Defeated"},
    [366] = {"@CAJABrains/Goal - Brain Hunt/(CA Ford) Redeemed Required Brains"},
    [367] = {"@ASLBBoss/Goal - Asylum Brain Tank/(AS Lab) Oleander Boss Defeated"},
}