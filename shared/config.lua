Config = {}

-- Enable or disable blips on the map for teleport locations
Config.EnableBlips = true

-- Enable or disable ground markers (e.g., 3D markers on destination points)
Config.EnableMarkers = true

-- Enable cinematic camera preview before teleporting
Config.EnableCinematicPreview = true

-- Preview duration in seconds
Config.PreviewDuration = 5

-- Enable permission checking using ACE or custom logic
Config.UsePermissions = true

-- If true, teleport will be cancelled if player is in a vehicle
Config.BlockTeleportInVehicle = false

-- Marker settings
Config.Marker = {
    type = 2,
    scale = vector3(0.5, 0.5, 0.5),
    color = { r = 0, g = 150, b = 255, a = 180 },
    drawDistance = 20.0
}
