Config = {}

-- Enable/disable map blips for teleport locations
Config.EnableBlips = true

-- Enable/disable 3D ground markers
Config.EnableMarkers = true

-- Enable cinematic camera preview before teleporting
Config.EnableCinematicPreview = true

-- Duration of cinematic preview (in seconds)
Config.PreviewDuration = 5

-- Require ACE permissions to access specific locations
Config.UsePermissions = true

-- Prevent teleport if the player is in a vehicle
Config.BlockTeleportInVehicle = false

-- Marker appearance
Config.Marker = {
    type = 2,
    scale = vector3(0.5, 0.5, 0.5),
    color = { r = 0, g = 150, b = 255, a = 180 },
    drawDistance = 20.0
}
