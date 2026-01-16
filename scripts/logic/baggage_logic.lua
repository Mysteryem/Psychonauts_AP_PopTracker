require("scripts/baggage_area_tracking")

function has_unused_tags(baggage_type)
    return Tracker:ProviderCountForCode(baggage_type) < Tracker:ProviderCountForCode(baggage_type.."_tag")
end

function can_access_any_unclaimed_baggage_type_in_area(baggage_code, area)
    local baggage_in_area = KNOWN_UNCLAIMED_BAGGAGE[area]
    local sequence_break = false
    local baggage_type_in_area = baggage_in_area[baggage_code]
    --print("DEBUG: Checking for any unclaimed baggage in "..area.." with code "..baggage_code)
    for _, section in ipairs(baggage_type_in_area) do
        if section.AccessibilityLevel == AccessibilityLevel.Normal then
            --print("DEBUG: Checked "..section.FullID.." and it was accessible.")
            return AccessibilityLevel.Normal
        elseif section.AccessibilityLevel == AccessibilityLevel.SequenceBreak then
            sequence_break = true
            --print("DEBUG: Checked "..section.FullID.." and it was sequence_break.")
        --else
            --print("DEBUG: Checked "..section.FullID.." and it was inaccessible.")
        end
    end
    if sequence_break then
        return AccessibilityLevel.SequenceBreak
    else
        return AccessibilityLevel.None
    end
end

function reachable_unclaimed_hinted_baggage_count(baggage_code, allow_sequence_break)
    local count = 0
    for _area, baggage_in_area in pairs(KNOWN_UNCLAIMED_BAGGAGE) do
        for _, section in ipairs(baggage_in_area[baggage_code]) do
            --print("DEBUG: ("..baggage_code..tostring(allow_sequence_break)..") Checking if "..section.FullID.." is accessible")
            if section.AccessibilityLevel == AccessibilityLevel.Normal then
                count = count + 1
            elseif allow_sequence_break and section.AccessibilityLevel == AccessibilityLevel.SequenceBreak then
                count = count + 1
            end
        end
    end
    --print("DEBUG: Counted "..tostring(count).." reachable "..baggage_code..tostring(allow_sequence_break))
    return count
end
