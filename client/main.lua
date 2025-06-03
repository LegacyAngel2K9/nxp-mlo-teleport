local selectedLocation = nil

RegisterNetEvent("nxp-teleport:openMenu", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open", locations = Locations })
end)

RegisterNUICallback("teleportTo", function(data, cb)
    local category = data.category
    local index = data.index
    local loc = Locations[category] and Locations[category][index]

    if not loc then return cb({ success = false }) end

    if Config.UsePermissions and loc.permission then
        TriggerServerEvent("nxp-teleport:requestTeleport", category, index)
    else
        triggerTeleport(loc)
    end

    cb({ success = true })
end)

RegisterNUICallback("closeMenu", function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNetEvent("nxp-teleport:doTeleport", function(location)
    triggerTeleport(location)
end)

function triggerTeleport(loc)
    if Config.BlockTeleportInVehicle and IsPedInAnyVehicle(PlayerPedId(), false) then return end

    if Config.EnableCinematicPreview then
        TriggerEvent("nxp-teleport:previewCamera", loc.coords, loc.heading)
        Wait((Config.PreviewDuration or 5) * 1000)
    end

    DoScreenFadeOut(800)
    Wait(1000)

    RequestCollisionAtCoord(loc.coords.x, loc.coords.y, loc.coords.z)
    SetEntityCoords(PlayerPedId(), loc.coords.x, loc.coords.y, loc.coords.z, false, false, false, true)
    SetEntityHeading(PlayerPedId(), loc.heading or 0.0)

    Wait(500)
    DoScreenFadeIn(800)
end
