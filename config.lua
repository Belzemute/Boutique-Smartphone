-- =====================================================
-- Script: Boutique Smartphone
-- Auteur: Belzemute (https://github.com/Belzemute)
-- Version: Beta 1.0.0
-- Licence: Free Respect 
-- Description: Simple script ped vente de Smartphone
-- =====================================================

Config = {}

Config.PhoneStore = {
    coords = vector4(153.019776, -223.371430, 54.419800, 340.157470),
    blip = {
        sprite = 459,
        color = 7,
        scale = 0.8,
        name = "Phone Store"
    },
    phones = {
        {label = "Black Phone",  item = "black_phone",  price = 3000, image = "img/black_phone.png", stock = 5},
        {label = "Red Phone",    item = "red_phone",    price = 3000, image = "img/red_phone.png", stock = 3},
        {label = "Green Phone",  item = "green_phone",  price = 3000, image = "img/green_phone.png", stock = 0},
        {label = "White Phone",  item = "white_phone",  price = 3000, image = "img/white_phone.png", stock = 2},
        {label = "Yellow Phone", item = "yellow_phone", price = 3000, image = "img/yellow_phone.png", stock = 1},
    }
}
