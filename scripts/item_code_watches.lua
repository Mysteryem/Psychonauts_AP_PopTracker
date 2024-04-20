function setting_starting_levitation_watch(code)
    setting_starting_levitation_watch = Tracker:FindObjectForCode(code)
    -- Without the counter, when tracker state is loaded from a save, the watch is triggered, meaning
    -- that repeatedly loading a save with "setting_starting_levitation" active would repeatedly add
    -- an extra "levitation" item. The counter is also included in the data loaded from a save, so we
    -- use the counter to check whether "setting_starting_levitation" has already been enabled
    counter = Tracker:FindObjectForCode("_internal_setting_starting_levitation_counter")
    levitation = Tracker:FindObjectForCode("levitation")
    if setting_starting_levitation_watch.Active then
        if not counter.Active then
            counter.Active = true
            levitation.AcquiredCount = math.min(levitation.MaxCount, levitation.AcquiredCount + levitation.Increment)
        end
    else
        if counter.Active then
            counter.Active = false
            levitation.AcquiredCount = math.max(levitation.MinCount, levitation.AcquiredCount - levitation.Increment)
        end
    end
end

-- Whenever StartingLevitation is toggled, add/remove one level of Levitation.
ScriptHost:AddWatchForCode("Starting Levitation Toggle", "setting_starting_levitation", setting_starting_levitation_watch)