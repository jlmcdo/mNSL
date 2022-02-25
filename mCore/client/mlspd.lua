ESX = nil
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if (PlayerData.job ~= nil and (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'ambulance')) then
                  ESX.ShowNotification("Une voiture de police/ambulance n'est pas réservée aux civils..")
                  SetVehicleUndriveable(veh, true)
                end
            end
        end
    end
end)