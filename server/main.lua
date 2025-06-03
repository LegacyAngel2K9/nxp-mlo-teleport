RegisterNetEvent("nxp-teleport:requestTeleport", function(category, index)
    local src = source
    local loc = Locations[category] and Locations[category][index]
    if not loc then return end

    if Config.UsePermissions and loc.permission then
        if IsPlayerAceAllowed(src, loc.permission) then
            TriggerClientEvent("nxp-teleport:doTeleport", src, loc)
        else
            print(("[NXP-TELEPORT] Player %s tried to teleport without permission '%s'"):format(src, loc.permission))
        end
    else
        TriggerClientEvent("nxp-teleport:doTeleport", src, loc)
    end
end)
