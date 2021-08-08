QBCore = nil

TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(450, function()
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
    end) 
end)

RegisterNetEvent('sudo-gifts:client:use:gift')
AddEventHandler('sudo-gifts:client:use:gift', function()
    QBCore.Functions.Progressbar("welcome-gift", "Open Gift..", math.random(20000, 30000), false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done   
        TriggerServerEvent('QBCore:Server:RemoveItem', 'kerstkado', 1)
        TriggerEvent("qb-inventory:client:ItemBox", QBCore.Shared.Items['welcomegift'], "remove")
        QBCore.Functions.Notify("Thanks for joining!", "success")
        TriggerServerEvent('sudo-gifts:server:get:kado:prize')
    end, function() -- Cancel
        QBCore.Functions.Notify("Or not..", "error")
    end)
end)