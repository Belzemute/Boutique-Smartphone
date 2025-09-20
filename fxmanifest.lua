-- =====================================================
-- Script: Boutique Smartphone
-- Auteur: Belzemute ()
-- Version: Beta 1.0.0
-- Licence: Free Respect 
-- Description: Simple script ped vente de Smartphone
-- =====================================================

fx_version 'cerulean'
game 'gta5'

author 'Belzemute'
description 'Phone Store NUI ESX legacy'
version '1.0.0'

shared_script '@es_extended/imports.lua'
shared_script 'config.lua'

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/black_phone.png',
    'html/img/red_phone.png',
    'html/img/green_phone.png',
    'html/img/white_phone.png',
    'html/img/yellow_phone.png'
}
dependencies {
    'es_extended',
    'ox_inventory',
    'ox_target'
}


