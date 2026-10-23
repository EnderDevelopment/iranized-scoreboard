-- Server-side script for the scoreboard

-- Register a server event to update player data
RegisterServerEvent('scoreboard:update')
AddEventHandler('scoreboard:update', function()
    local players = {}
    for _, player in ipairs(GetPlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(players, {
            id = GetPlayerServerId(player),
            name = GetPlayerName(player),
            ping = GetPlayerPing(player),
            health = GetEntityHealth(ped),
            armor = GetPedArmour(ped)
        })
    end
    TriggerClientEvent('scoreboard:update', -1, players)
end)

-- Register a server event to handle player joining
AddEventHandler('playerJoining', function()
    TriggerEvent('scoreboard:update')
end)

-- Register a server event to handle player dropping
AddEventHandler('playerDropped', function()
    TriggerEvent('scoreboard:update')
end)
