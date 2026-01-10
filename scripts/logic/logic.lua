function has(item)
    local count = Tracker:ProviderCountForCode(item)
    return count > 0
end

-- It seems that negation in access rules is not provided, so we have to do this ourselves.
function not_has(item)
    local count = Tracker:ProviderCountForCode(item)
    return count <= 0
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

function hasRankLogic(name)
    local logic_location = Tracker:FindObjectForCode("@Rank Logic/"..name)
    return logic_location.AccessibilityLevel == AccessibilityLevel.Normal
end

function hasMostSashaMindAccess()
    return has("mind_sasha") and has("marksmanship")
end

function hasMostMillaMindAccess()
    return has("mind_milla") and has("levitation")
end

function hasMostBoydMindAccess()
    return has()
end

function rank2to20()
    local checks = {
        has("sasha_button"),
        has("mind_coach"),
        hasRankLogic("mostSashaMindAccess"),
        hasRankLogic("mostMillaMindAccess"),
        has("mind_linda"),
        hasRankLogic("mostBoydMindAccess"),
        hasRankLogic("halfGloriaMindAccess"),
        has("mind_fred"),
        has("mind_edgar"),
    }
    return checksSum(checks) >= 4
end

function rank21to40()
    local checks = {
        has("sasha_button") and hasRankLogic("oneExtraCampAccess"),
        has("mind_coach"),
        hasRankLogic("mostSashaMindAccess"),
        hasRankLogic("mostMillaMindAccess"),
        hasRankLogic("mostLindaMindAccess"),
        hasRankLogic("mostBoydMindAccess"),
        hasRankLogic("halfGloriaMindAccess"),
        hasRankLogic("mostFredMindAccess"),
        has("mind_edgar"),
        hasRankLogic("halfOlyMindAccess"),
    }
    return checksSum(checks) >= 5
end

function rank41to60()
    if not has("sasha_button") then
        return false
    end

    local checks = {
        hasRankLogic("allExtraCampAccess"),
        has("mind_coach"),
        hasRankLogic("mostSashaMindAccess"),
        hasRankLogic("mostMillaMindAccess"),
        hasRankLogic("mostLindaMindAccess"),
        hasRankLogic("mostBoydMindAccess"),
        hasRankLogic("mostGloriaMindAccess"),
        hasRankLogic("mostFredMindAccess"),
        has("mind_edgar"),
        hasRankLogic("mostAsylumAccess"),
        hasRankLogic("mostOlyMindAccess"),
    }
    return checksSum(checks) >= 6
end

function rank61to80()
    local checks = {
        hasRankLogic("allExtraCampAccess"),
        has("mind_coach"),
        hasRankLogic("mostSashaMindAccess"),
        hasRankLogic("mostMillaMindAccess"),
        hasRankLogic("mostLindaMindAccess"),
        hasRankLogic("mostBoydMindAccess"),
        hasRankLogic("mostGloriaMindAccess"),
        hasRankLogic("mostFredMindAccess"),
        hasRankLogic("mostEdgarMindAccess"),
        hasRankLogic("mostAsylumAccess"),
        hasRankLogic("mostOlyMindAccess"),
    }
    return checksSum(checks) >= 7
end

function rank81to101()
    local checks = {
        hasRankLogic("allExtraCampAccess"),
        has("mind_coach"),
        hasRankLogic("mostSashaMindAccess"),
        hasRankLogic("mostMillaMindAccess"),
        hasRankLogic("mostLindaMindAccess"),
        hasRankLogic("mostBoydMindAccess"),
        hasRankLogic("mostGloriaMindAccess"),
        hasRankLogic("mostFredMindAccess"),
        hasRankLogic("mostEdgarMindAccess"),
        hasRankLogic("mostAsylumAccess"),
        hasRankLogic("mostOlyMindAccess"),
    }
    return checksSum(checks) >= 8
end

function brainhunt_goal()
    local required_brain_count = Tracker:ProviderCountForCode("setting_brains_required")
    if required_brain_count == 0 then
        -- 0 is not a valid value for the "BrainsRequired" yaml option, but 0 is being used here to indicate that the
        -- goal is not required, because the brain hunt is a requirement for the brain tank/meat circus bosses when
        -- enabled.
        return true
    end
    local brain_count = Tracker:ProviderCountForCode("camper_brain")
    if brain_count >= required_brain_count then
        -- Can complete the goal
        return true
    else
        -- More brains are required to complete the goal
        return false
    end
end