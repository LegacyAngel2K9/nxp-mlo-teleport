# 🚀 NXP Teleport Menu

A modular and visually engaging teleportation menu system for FiveM using NUI. Designed and developed by **Legacy DEV Team**, this system allows players to teleport to predefined locations organized by categories. Each location supports blips, ground markers, and a cinematic camera transition before the player is placed.

---

## 🧩 Features

- 🗂 **Category-Based Location Sorting**
- 🎥 **Cinematic Camera Preview** (5s fly-in before teleport)
- 📍 **Map Blips & Ground Markers**
- 🔐 **Optional ACE Permission Support**
- 📄 **Load Locations from `locations.lua`**
- 🔄 **Configurable Caching Mechanism**
- 💻 **NUI Interface with Search and Preview**
- ⚡ **Supports teleporting players or vehicles**

---

## ⚙️ Configuration

### `config.lua`
```lua
Config = {}
Config.UseAcePerms = false         -- Enable ACE-based permission filtering
Config.CacheDuration = 300         -- Time in seconds to cache locations server-side
````

### `locations.lua`

Locations are defined in categories:

```lua
Config.Locations = {
    {
        name = "Police Stations",
        ace_perm = nil,
        locations = {
            {
                name = "U.S Marshal HQ",
                desc = "Lobby, Garage, Cells, Offices, etc.",
                coords = {
                    spawn = { x = -835.25, y = -694.38, z = 27.31, w = 268.05 },
                    marker = { x = -835.25, y = -694.38, z = 27.31 },
                    blip   = { x = -835.25, y = -694.38, z = 27.31 },
                    camera = { x = -835.25, y = -694.38, z = 27.31 }
                },
                icon = "fa-building-shield",
                ace_perm = nil
            },
            -- More locations...
        }
    },
    -- More categories...
}
```

---

## 🔐 ACE Permissions

If `Config.UseAcePerms = true`, the following permissions are available:

| Permission         | Description                            |
| ------------------ | -------------------------------------- |
| `teleport.use`     | Allow a player to use the teleport UI  |
| `teleport.refresh` | Allow a player to run `/rtp` command   |
| `category.name`    | Define access per category or location |

---

## 🖥️ Commands

| Command   | Description                       |
| --------- | --------------------------------- |
| `/tpmenu` | Opens the teleport UI (or use F4) |
| `/rtp`    | Reloads and resets location cache |

---

## 🛠️ Integration Notes

* Built with full support for **ox\_lib** notifications and keybinds.
* Markers use `nxpicon` texture dictionary – ensure you include it or modify the `DrawMarker` fallback.
* Camera and marker preview automatically handled based on `locations.lua`.

---

## ✅ Dependencies

* [ox\_lib](https://github.com/overextended/ox_lib) (for UI notifications)
* jQuery + Font Awesome (via CDN, used in `index.html`)

---

## 📜 License

MIT License
© 2025 Legacy DEV Team

---

## 👥 Credits

Developed by **Legacy DEV Team**
Special thanks to the FiveM & open-source communities.