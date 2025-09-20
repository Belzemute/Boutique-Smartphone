-- =====================================================
-- Script: Boutique Smartphone
-- Auteur: Belzemute (https://github.com/Belzemute)
-- Version: Beta 1.0.0
-- Licence: Free Respect 
-- Description: Simple script ped vente de Smartphone
-- =====================================================

RegisterServerEvent("phone_store:openMenu")
AddEventHandler("phone_store:openMenu", function()
    local phones = Config.PhoneStore.phones
    TriggerClientEvent("phone_store:showMenu", source, phones)
end)

RegisterServerEvent("phone_store:buyPhone")
AddEventHandler("phone_store:buyPhone", function(item)
    local xPlayer = source
    for i, phone in ipairs(Config.PhoneStore.phones) do
        if phone.item == item then
            if phone.stock > 0 then
                if exports.ox_inventory:RemoveItem(xPlayer, 'money', phone.price) then
                    exports.ox_inventory:AddItem(xPlayer, phone.item, 1)
                    phone.stock = phone.stock - 1
                    TriggerClientEvent('ox_lib:notify', xPlayer, {
                        type = 'success',
                        description = 'Telephone achete : ' .. phone.label
                    })
                else
                    TriggerClientEvent('ox_lib:notify', xPlayer, {
                        type = 'error',
                        description = 'Fonds insuffisants.'
                    })
                end
            else
                TriggerClientEvent('ox_lib:notify', xPlayer, {
                    type = 'error',
                    description = 'Ce telephone est hors stock.'
                })
            end
            break
        end
    end
end)
