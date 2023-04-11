QBCore = exports['qb-core']:GetCoreObject()

-- Functions --

local function isAllowedToGiveCar(player)
    if IsPlayerAceAllowed(player, Config.AceGroup) then
        return true
    end
    return false
end

local function generatePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return generatePlate()
    else
        return plate:upper()
    end
end

-- Events --

RegisterNetEvent('g-givecar:server:RequestCommands', function()
    local src = source
    if isAllowedToGiveCar(src) then
        TriggerClientEvent('g-givecar:client:RequestCommands', src, true)
    end
end)

-- Commands --

RegisterCommand(Config.GiveCarCommand, function(source, args)
    if Config.CommandEnabled then
        local src = source
        local model = tostring(args[2])
        local id = tonumber(args[1])
        local plate = generatePlate()
        if id and model and IsPlayerAceAllowed(src, Config.AceGroup) then
            local xAdmin = QBCore.Functions.GetPlayer(src)
            local aName = xAdmin.PlayerData.name
            local xTarget = QBCore.Functions.GetPlayer(id)
            if not xTarget then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_player', { id = tostring(id) }))
                return
            end
            local cid = xTarget.PlayerData.citizenid
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage, giver_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
                xTarget.PlayerData.license,
                cid,
                model,
                GetHashKey(model),
                '{}',
                plate,
                1,
                Config.Garage,
                aName
            })
            if Config.TextEnabled then
                TriggerClientEvent('g-givecar:client:sendText', src, Lang:t('text_message.sender'), Lang:t('text_message.sender_subject'), Lang:t('text_message.sender_message', { model = model, plate = plate, recipient = GetPlayerName(id) }))
                TriggerClientEvent('g-givecar:client:sendText', id, Lang:t('text_message.sender'), Lang:t('text_message.recipient_subject'), Lang:t('text_message.recipient_message', { model = model, plate = plate, garage = Config.GarageName }))
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.car_sent', { model = model, plate = plate, recipient = GetPlayerName(id) }))
                TriggerClientEvent('QBCore:Notify', id, Lang:t('info.car_received', { model = model, plate = plate }))
                Wait(5500)
                TriggerClientEvent('QBCore:Notify', id, Lang:t('info.retrieve_car', { garage = Config.GarageName }))
            end
        end
    end
end)