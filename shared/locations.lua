Locations = {
    ["Police"] = {
        {
            name = "Mission Row PD",
            coords = vector3(440.84, -983.14, 30.69),
            heading = 90.0,
            blip = {
                enabled = true,
                sprite = 60,
                color = 38,
                scale = 0.8
            },
            marker = true,
            permission = "teleport.police"
        },
        {
            name = "Paleto Bay PD",
            coords = vector3(-447.93, 6013.38, 31.72),
            heading = 45.0,
            blip = {
                enabled = true,
                sprite = 60,
                color = 38,
                scale = 0.8
            },
            marker = true,
            permission = "teleport.police"
        }
    },
    ["Medical"] = {
        {
            name = "Pillbox Hospital",
            coords = vector3(307.29, -595.46, 43.28),
            heading = 340.0,
            blip = {
                enabled = true,
                sprite = 61,
                color = 2,
                scale = 0.8
            },
            marker = true,
            permission = "teleport.ems"
        }
    },
    ["Misc"] = {
        {
            name = "Training Ground",
            coords = vector3(1985.41, 3050.10, 47.22),
            heading = 180.0,
            blip = {
                enabled = true,
                sprite = 309,
                color = 5,
                scale = 0.8
            },
            marker = true,
            permission = false -- no permission required
        }
    }
}
