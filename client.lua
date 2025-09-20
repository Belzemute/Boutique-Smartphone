-- =====================================================
-- Script: Boutique Smartphone
-- Auteur: Belzemute (2025 https://github.com/Belzemute)
-- Version: Beta 1.0.0
-- Licence: Free Respect 
-- Description: Simple script ped vente de Smartphone
-- =====================================================

local ped = nil

CreateThread(function()
    local model = `s_m_m_highsec_01`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local x, y, z, h = table.unpack(Config.PhoneStore.coords)
    local groundZ = nil

    for i = 1, 10 do
        local success, foundZ = GetGroundZFor_3dCoord(x, y, z + 1.0)
        if success then
            groundZ = foundZ
            break
        end
        Wait(50)
    end

    local finalZ = groundZ or (z - 1.0)

    ped = CreatePed(0, model, x, y, finalZ, h, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    RequestAnimDict("amb@world_human_stand_mobile@male@text@base")
    while not HasAnimDictLoaded("amb@world_human_stand_mobile@male@text@base") do Wait(10) end
    TaskPlayAnim(ped, "amb@world_human_stand_mobile@male@text@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)

    CreateThread(function()
        while true do
            if not IsEntityPlayingAnim(ped, "amb@world_human_stand_mobile@male@text@base", "base", 3) then
                TaskPlayAnim(ped, "amb@world_human_stand_mobile@male@text@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
            end
            Wait(10000)
        end
    end)

    exports.ox_target:addLocalEntity(ped, {
        {
            label = 'Ouvrir le Phone Store',
            icon = 'fas fa-mobile-alt',
            onSelect = function()
                TriggerServerEvent("phone_store:openMenu")
            end
        }
    })

    local blip = AddBlipForCoord(x, y, finalZ)
    SetBlipSprite(blip, Config.PhoneStore.blip.sprite)
    SetBlipColour(blip, Config.PhoneStore.blip.color)
    SetBlipScale(blip, Config.PhoneStore.blip.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.PhoneStore.blip.name)
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("phone_store:showMenu")
AddEventHandler("phone_store:showMenu", function(phones)
    SendNUIMessage({ action = "openPhoneMenu", phones = phones })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("closeMenu", function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback("buyPhone", function(data, cb)
    TriggerServerEvent("phone_store:buyPhone", data.item)
    cb({})
end)
print("^2[mon_script_name]^7 par Belzemute copyright 2025 - https://github.com/Belzemute")