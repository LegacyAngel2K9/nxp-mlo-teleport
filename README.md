# NXP MLO Teleport Menu

A modular and cinematic teleportation system for **FiveM**, developed by **Legacy DEV Team**. This system enables players to teleport to categorized map locations with visual previews, blips, ground markers, and optional ACE permission control.

---

## 🚀 Features

- ✅ **Cinematic Camera Preview** before teleportation
- ✅ **Category-based sorting** of teleport locations
- ✅ **Custom map blips** and ground markers
- ✅ **ACE permission support** (toggleable)
- ✅ **Fully modular config & UI**
- ✅ **NUI Menu with Live Location List**

---

## ⚙️ Configuration

### shared/config.lua

- `EnableBlips`: Enables map blips for each location
- `EnableMarkers`: Shows ground markers at destination
- `EnableCinematicPreview`: Enables camera fly-in
- `PreviewDuration`: Duration in seconds of the preview
- `UsePermissions`: Use ACE-based access control
- `BlockTeleportInVehicle`: Prevents teleporting in vehicles

### shared/locations.lua

Locations are grouped by category, each with:

```lua
{
    name = "Location Name",
    coords = vector3(x, y, z),
    heading = 0.0,
    blip = {
        enabled = true,
        sprite = 60,
        color = 38,
        scale = 0.8
    },
    marker = true,
    permission = "teleport.group" -- or false for no check
}
````

---

## 🧠 Permissions (Optional)

If `UsePermissions = true`, add ACE entries like:

```plaintext
add_ace group.admin teleport.police allow
add_ace group.ems teleport.ems allow
```

---

## 🖥️ Usage

### Open Menu via Event:

```lua
TriggerEvent("nxp-teleport:openMenu")
```

You may bind this to a command or radial menu item.

---

## 🧪 Development Notes

* Built with **Lua 5.4** and **HTML/CSS/JS** (no dependencies).
* Works with or without `ox_lib` and `oxmysql` (optional logging ready).
* Future-proofed structure with room for DB-driven locations.

---

## 📜 License

Licensed under the [MIT License](LICENSE). Attribution not required, but appreciated.

---

## 🛠 Credits

* Core Development: **Legacy DEV Team**
* Cinematic System Concept: Inspired by GTA V's mission fly-ins
* UI Framework: Vanilla HTML/CSS/JS (Tailwind-ready)