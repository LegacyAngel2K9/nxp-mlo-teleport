local cam = nil

RegisterNetEvent("nxp-teleport:previewCamera", function(coords, heading)
    if cam then
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 0, true, true)
        cam = nil
    end

    local camCoords = coords + vector3(0.0, -6.0, 2.0)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, camCoords.x, camCoords.y, camCoords.z)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z + 1.0)
    SetCamRot(cam, -15.0, 0.0, heading + 180.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)

    -- auto-destroy after preview
    CreateThread(function()
        Wait((Config.PreviewDuration or 5) * 1000)
        if cam then
            DestroyCam(cam, true)
            RenderScriptCams(false, false, 0, true, true)
            cam = nil
        end
    end)
end)
