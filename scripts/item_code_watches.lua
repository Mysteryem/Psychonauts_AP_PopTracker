local function update_brains_total(code)
    Tracker:FindObjectForCode("camper_brain").AcquiredCount = Tracker:ProviderCountForCode(code)
end

ScriptHost:AddWatchForCode("update_brains_total", "brain", update_brains_total)
