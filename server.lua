QBCore = exports['qb-core']:GetCoreObject()

-- Functions --

local function isAllowedToGiveCar(player)
    if IsPlayerAceAllowed(player, Config.AceGroup) then
        print("True")
        return true
    else
        print("False")
        return false
    end
end

-- Function credit: https://github.com/qbcore-framework/qb-vehicleshop
local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        print("Plate generated: " .. plate:upper())
        return plate:upper()
    end
end

-- Events --

RegisterNetEvent('g-givecar:server:RequestCommands', function()
    local src = source
    if isAllowedToGiveCar(src) then
        print("Is allowed, request commands")
        TriggerClientEvent('g-givecar:client:RequestCommands', src, true)
    end
end)

-- Commands --

RegisterCommand(Config.GiveCarCommand, function(source, args)
    if Config.CommandEnabled then
        local src = source
        local carname = tostring(args[2])
        local id = tonumber(args[1])
        local plate = GeneratePlate()

        if id and carname and IsPlayerAceAllowed(src, Config.AceGroup) then
            local xAdmin = QBCore.Functions.GetPlayer(src)
            local aName = xAdmin.PlayerData.name
            local xTarget = QBCore.Functions.GetPlayer(id)
            local cid = xTarget.PlayerData.citizenid

            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage, giver_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
                xTarget.PlayerData.license,
                cid,
                carname,
                GetHashKey(carname),
                '{}',
                plate,
                1,
                Config.Garage,
                aName
            })
            TriggerClientEvent("QBCore:Notify", src, 'You gave ' .. carname .. ' with number plate ' .. plate .. ' to ' .. GetPlayerName(id) .. '!')
            TriggerClientEvent('QBCore:Notify', id, 'You received ' .. carname .. " from an admin with the plate " .. plate .. '!')
            Wait(5500)
            TriggerClientEvent('QBCore:Notify', id, 'Go to ' .. Config.GarageName .. ' to retrieve your new car.')
        end
    end
end)