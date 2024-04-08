function has(item)
    local count = Tracker:ProviderCountForCode(item)
    return count > 0
end

function checksSum(boolArray)
    local sum = 0
    for _, check in ipairs(boolArray) do
        if check then
            sum = sum + 1
        end
    end
    return sum
end

function hasUpperAsylumAccessItems()
    return has("straight_jacket") and has("gloria_trophy") and has("loboto_painting")
end

function rank5to20()
    local checks = {
        has("sasha_button"),
        has("mind_coach"),
        has("marksmanship") and has("mind_sasha"),
        has("levitation") and has("mind_milla"),
        has("mind_linda"),
        has("mind_fred"),
        has("mind_edgar") and has("cobweb_duster")
    }
    return checksSum(checks) >= 3
end

function rank25to40()
    local hasDuster = has("cobweb_duster")
    local hasLevitation = has("levitation")
    local hasTelekinesis = has("telekinesis")
    local hasPyrokinesis = has("pyrokinesis")
    local checks = {
        has("sasha_button"),
        hasLevitation and has("mind_milla"),
        has("shield") and has("mind_linda"),
        has("marksmanship") and has("mind_sasha"),
        hasDuster and (has("mind_edgar") or has("mind_oly")),
        has("clairvoyance") and has("boyd_stop_sign") and has("mind_boyd"),
        hasLevitation and hasTelekinesis and has("oarsman_badge") and has("lungfish_call") and hasUpperAsylumAccessItems(),
        hasDuster and hasPyrokinesis and has("mind_gloria") and has("gloria_candle") and has("invisibility") and has("gloria_megaphone"),
        hasDuster and hasPyrokinesis and hasTelekinesis and has("mind_fred") and has("fred_letter") and has("fred_coin") and has ("fred_musket")
    }
    return checksSum(checks) >= 3
end

function rank45to60()
    local hasDuster = has("cobweb_duster")
    local hasLevitation = has("levitation")
    local hasTelekinesis = has("telekinesis")
    local hasPyrokinesis = has("pyrokinesis")
    local checks = {
        has("oarsman_badge") and has("squirrel_roast_dinner") and has("lili_bracelet"),
        hasLevitation and has("mind_milla"),
        has("shield") and has("mind_linda"),
        has("marksmanship") and has("mind_sasha"),
        hasDuster and (has("mind_edgar") or has("mind_oly")),
        has("clairvoyance") and has("boyd_stop_sign") and has("mind_boyd"),
        hasLevitation and hasTelekinesis and has("oarsman_badge") and has("lungfish_call") and hasUpperAsylumAccessItems(),
        hasDuster and hasPyrokinesis and has("mind_gloria") and has("gloria_candle") and has("invisibility") and has("gloria_megaphone"),
        hasDuster and hasPyrokinesis and hasTelekinesis and has("mind_fred") and has("fred_letter") and has("fred_coin") and has ("fred_musket")
    }
    return checksSum(checks) >= 4
end

function rank65to80()
    local hasDuster = has("cobweb_duster")
    local hasLevitation = has("levitation")
    local hasTelekinesis = has("telekinesis")
    local hasPyrokinesis = has("pyrokinesis")
    local checks = {
        has("oarsman_badge") and has("squirrel_roast_dinner") and has("lili_bracelet"),
        hasLevitation and has("mind_milla"),
        has("shield") and has("mind_linda"),
        has("marksmanship") and has("mind_sasha"),
        hasDuster and has("mind_edgar") and has("mind_oly"), -- `and` now instead of `or`
        has("clairvoyance") and has("boyd_stop_sign") and has("mind_boyd"),
        hasLevitation and hasTelekinesis and has("oarsman_badge") and has("lungfish_call") and hasUpperAsylumAccessItems(),
        hasDuster and hasPyrokinesis and has("mind_gloria") and has("gloria_candle") and has("invisibility") and has("gloria_megaphone"),
        hasDuster and hasPyrokinesis and hasTelekinesis and has("mind_fred") and has("fred_letter") and has("fred_coin") and has ("fred_musket")
    }
    return checksSum(checks) >= 6
end

function rank85to101()
    local hasDuster = has("cobweb_duster")
    local hasLevitation = has("levitation")
    local hasTelekinesis = has("telekinesis")
    local hasPyrokinesis = has("pyrokinesis")
    local checks = {
        has("oarsman_badge") and has("squirrel_roast_dinner") and has("lili_bracelet"),
        hasLevitation and has("mind_milla"),
        has("shield") and has("mind_linda"),
        has("marksmanship") and has("mind_sasha"),
        hasDuster and has("mind_edgar") and has("mind_oly"), -- `and` now instead of `or`
        has("clairvoyance") and has("boyd_stop_sign") and has("mind_boyd"),
        hasLevitation and hasTelekinesis and has("oarsman_badge") and has("lungfish_call") and hasUpperAsylumAccessItems(),
        hasDuster and hasPyrokinesis and has("mind_gloria") and has("gloria_candle") and has("invisibility") and has("gloria_megaphone"),
        hasDuster and hasPyrokinesis and hasTelekinesis and has("mind_fred") and has("fred_letter") and has("fred_coin") and has ("fred_musket")
    }
    return checksSum(checks) >= 7
end