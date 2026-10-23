-- Client-side script for the scoreboard

-- Register a command to toggle the scoreboard
RegisterCommand('scoreboard', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'open'
    })
end, false)

-- Register a key event to close the scoreboard
RegisterKeyMapping('scoreboard', 'Toggle Scoreboard', 'keyboard', 'F1')

-- Register a NUI callback to close the scoreboard
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)

-- Register a NUI callback to get player data
RegisterNUICallback('getPlayers', function(data, cb)
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(players, {
            id = GetPlayerServerId(player),
            name = GetPlayerName(player),
            ping = GetPlayerPing(player),
            health = GetEntityHealth(ped),
            armor = GetPedArmour(ped)
        })
    end
    cb(players)
end)
