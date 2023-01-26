-- Events --

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if Config.CommandEnabled then
        print("Command enabled")
        TriggerServerEvent('g-givecar:server:RequestCommands')
    end
end)

RegisterNetEvent('g-givecar:client:RequestCommands', function(isAllowed)
    if isAllowed then
        TriggerEvent('chat:addSuggestion', '/' .. Config.GiveCarCommand, '[id] [carname]', {})
    end
end)