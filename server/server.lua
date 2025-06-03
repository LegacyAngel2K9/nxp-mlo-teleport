local categoriesCache = nil
local lastFetchTime = 0

local function HasAccess(source, perm)
    if not Config.UseAcePerms then return true end
    if not perm or perm == "nil" then return true end
    return IsPlayerAceAllowed(source, perm)
end

local function FetchLocalCategories()
    if categoriesCache and (os.time() - lastFetchTime < Config.CacheDuration) then
        return categoriesCache
    end

    local ok, data = pcall(require, "locations")
    if ok and type(data) == "table" then
        categoriesCache = data
        lastFetchTime = os.time()
        print("[nxp-tp-menu] Loaded locations from local file.")
    else
        print("[nxp-tp-menu] Failed to load locations from local file.")
        categoriesCache = {}
    end

    return categoriesCache
end

local function FilterLocations(source)
    local result = {}
    local data = FetchLocalCategories()
    for _, category in ipairs(data or {}) do
        if HasAccess(source, category.ace_perm) then
            local cat = { name = category.name, locations = {} }
            for _, loc in ipairs(category.locations) do
                if HasAccess(source, loc.ace_perm) then
                    table.insert(cat.locations, loc)
                end
            end
            if #cat.locations > 0 then
                table.insert(result, cat)
            end
        end
    end
    return result
end

RegisterNetEvent('nxp-tp-menu:requestLocations', function()
    local src = source
    if Config.UseAcePerms and not HasAccess(src, "teleport.use") then return end
    local filtered = FilterLocations(src)
    TriggerClientEvent('nxp-tp-menu:receiveLocations', src, filtered)
end)

RegisterCommand("rtp", function(source)
    if source == 0 or IsPlayerAceAllowed(source, "teleport.refresh") then
        categoriesCache = nil
        lastFetchTime = 0
        print("[nxp-tp-menu] Teleport category cache manually reset by " .. (source == 0 and "CONSOLE" or GetPlayerName(source)))
    end
end, true)
