QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

QBCore.Functions.CreateUseableItem("welcomegift", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('sudo-gifts:client:use:gift', source)
    end
end)

QBCore.Commands.Add("gift", "Give everyone a random gift!", {}, false, function(source, args)
    local src = source
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
         Player.Functions.AddItem('welcomegift', 1)
         TriggerClientEvent('QBCore:Notify', v, "Thank your for playing!", "info", 15000)
         TriggerClientEvent('qb-inventory:client:ItemBox', v, QBCore.Shared.Items['welcomegift'], "add")
        end
    end
end, 'god')

RegisterServerEvent('sudo-gifts:server:get:gift:prize')
AddEventHandler('sudo-gifts:server:get:gift:prize', function()
	local Player = QBCore.Functions.GetPlayer(source)
    local RandomValue = math.random(1,75)
    Player.Functions.AddItem('lsd-strip', 1)
    Player.Functions.AddMoney('cash', math.random(1000, 2500), "Welcome Gift")
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['lsd-strip'], "add")
    if RandomValue >= 1 and RandomValue < 15 then
        Player.Functions.AddItem('health-pack', 1, false)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['health-pack'], "add")
    elseif RandomValue > 15 and RandomValue < 30 then
        local info = {quality = 100.0}
        Player.Functions.AddItem('weapon_pistol', 1, false, info)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['weapon_molotov'], "add")
    elseif RandomValue > 30 and RandomValue < 45 then
        Player.Functions.AddItem('diamond-blue', math.random(2,4))
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['diamond-blue'], "add")
    elseif RandomValue > 45 and RandomValue < 60 then
        Player.Functions.AddItem('pistol_extendedclip', 1)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['pistol_extendedclip'], "add")
    elseif RandomValue > 60 and RandomValue < 75 then
        Player.Functions.AddItem('pistol_suppressor', 1)
        TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items['pistol_suppressor'], "add")
    end
end)