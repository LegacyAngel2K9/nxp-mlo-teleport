# NXP MLO Teleport System

**NXP MLO Teleport** is a modular and cinematic teleportation menu system for **FiveM**, designed for easy navigation between categorized MLO locations. Built by Legacy DEV Team, this system integrates smooth camera previews, optional ACE permission controls, and a highly customizable NUI menu.

---

## ✨ Features

- 🎯 **Category-based Location Sorting**  
  Organize teleportation points by department (e.g., Police, Fire, EMS, Misc).

- 🎥 **Cinematic Camera Preview**  
  Fly-in camera sequence before teleportation for immersive transitions.

- 🗺️ **Map Blips & Ground Markers**  
  Visual markers at destination (optional per config).

- 🔐 **ACE Permission Support**  
  Toggleable via config. Assign permission tags to individual locations.

- 🌐 **Responsive NUI Menu**  
  HTML/CSS/JS interface styled with v1’s original gradient palette.

- 🧠 **Description & Icon Support**  
  Each location can include a FontAwesome icon and a description tooltip.

---

## ⚙️ Configuration (`config.lua`)

```lua
Config.EnableBlips = true              -- Enable map blips
Config.EnableMarkers = true            -- Enable 3D ground markers
Config.EnableCinematicPreview = true   -- Enable camera fly-in effect
Config.PreviewDuration = 5             -- Duration (in seconds) of preview
Config.UsePermissions = true           -- Enable ACE permission checks
Config.BlockTeleportInVehicle = false  -- Prevent teleport inside vehicle
````

---

## 📍 Location Definition (`locations.lua`)

Each category (e.g. "Police Stations", "EMS") holds a list of locations.

Example structure:

```lua
{
  name = "Weazel PD",
  description = "Shooting Range, Labs, Offices and more.",
  coords = vector3(-602.2, -929.94, 23.86),
  heading = 268.34,
  icon = "fa-building-shield",
  permission = "teleport.police" -- or nil if unrestricted
}
```

---

## 🖱️ Client Usage

To open the menu:

```lua
TriggerEvent("nxp-teleport:openMenu")
```

Integrate this into a radial menu, command, or keybinding system as desired.

---

## 🛡️ ACE Permissions (if enabled)

You can restrict access to individual locations using ACE permissions.

Example:

```text
add_ace group.admin teleport.police allow
add_ace group.ems teleport.ems allow
```

---

## 🧩 Requirements

* FiveM Server (Lua 5.4)
* Optional: \[ox\_lib] for better compatibility
* FontAwesome script kit (included via CDN in HTML)

---

## 🛠 Developer Notes

* Built with modularity in mind — locations and config files can be extended freely.
* NUI buttons use `FontAwesome 6` icons, which can be changed per location.
* Permissions can be dynamically toggled or removed entirely.

---

## 📘 License

This project is licensed under the **MIT License**. Use freely, modify openly.

> © 2024-2025 Legacy DEV Team.