fx_version 'cerulean'
game 'gta5'
author 'oosayeroo'
description 'tss-achievements'
version '1.1.0'
lua54 'yes'

shared_scripts {
    'shared/*.lua',
    '@jim_bridge/starter.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/images/*.png',
    'html/images/*.jpg',
    'html/*.html',
    'html/*.js',
    'html/*.css'
}

dependency 'jim_bridge'