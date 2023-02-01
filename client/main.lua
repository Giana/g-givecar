-- Events --

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if Config.CommandEnabled then
        TriggerServerEvent('g-givecar:server:RequestCommands')
    end
end)

RegisterNetEvent('g-givecar:client:RequestCommands', function(isAllowed)
    if isAllowed then
        TriggerEvent('chat:addSuggestion', '/' .. Config.GiveCarCommand, '[' .. Lang:t('other.id') .. '] [' .. Lang:t('other.model') .. ']', {})
    end
end)

RegisterNetEvent('g-givecar:client:sendText')
AddEventHandler('g-givecar:client:sendText', function(sender, subject, message)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = sender,
        subject = subject,
        message = message,
    })
end)