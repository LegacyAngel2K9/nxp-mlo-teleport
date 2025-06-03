-- client.lua

RegisterCommand('tpmenu', function()
    TriggerServerEvent('nxp-tp-menu:requestLocations')
end, false)

RegisterKeyMapping('tpmenu', 'Open Teleport Menu', 'keyboard', 'F4')

RegisterNetEvent('nxp-tp-menu:receiveLocations', function(locations)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'toggleMenu',
        locations = locations
    })

    CreateDynamicMarkers(locations)
    CreateDynamicBlips(locations)
end)

RegisterNUICallback('teleport', function(data, cb)
    local ped = PlayerPedId()

    DoScreenFadeOut(500)
    Wait(500)

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, data.camera.x, data.camera.y, data.camera.z)
    PointCamAtCoord(cam, data.spawn.x, data.spawn.y, data.spawn.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    Wait(5000)

    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        SetEntityCoords(veh, data.spawn.x, data.spawn.y, data.spawn.z)
        SetEntityHeading(veh, data.spawn.w)
    else
        SetEntityCoords(ped, data.spawn.x, data.spawn.y, data.spawn.z)
        SetEntityHeading(ped, data.spawn.w)
    end

    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(cam, false)
    DoScreenFadeIn(500)
    SetNuiFocus(false, false)

    cb('ok')
end)

RegisterNUICallback('closeMenu', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Create dynamic blips
function CreateDynamicBlips(categories)
    for _, category in ipairs(categories) do
        for _, location in ipairs(category.locations) do
            if location.coords and location.coords.blip then
                local c = location.coords.blip
                local blip = AddBlipForCoord(c.x, c.y, c.z)
                SetBlipSprite(blip, 123)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, 0)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(location.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end

-- Create markers and 3D prompts
function CreateDynamicMarkers(categories)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if not HasStreamedTextureDictLoaded("nxpicon") then
                RequestStreamedTextureDict("nxpicon", true)
                while not HasStreamedTextureDictLoaded("nxpicon") do Wait(1) end
            end
            for _, category in ipairs(categories) do
                for _, location in ipairs(category.locations) do
                    if location.coords and location.coords.marker then
                        local c = location.coords.marker
                        DrawMarker(9, c.x, c.y, c.z, 0.0, 0.0, 0.0, 90.0, 90.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 255, true, true, 2, true, "nxpicon", "marker", false)
                        if #(GetEntityCoords(PlayerPedId()) - vector3(c.x, c.y, c.z)) < 6.0 then
                            Draw3DText(c.x, c.y, c.z - 1.8, "~b~Press ~p~[F4] ~b~To Open Teleport Menu", 0, 0.1, 0.1)
                        end
                    end
                end
            end
        end
    end)
end

function Draw3DText(x, y, z, text, fontId, scaleX, scaleY)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(scaleX * scale, scaleY * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z + 2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
