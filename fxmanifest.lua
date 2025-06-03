fx_version 'cerulean'
game 'gta5'

author 'Legacy DEV Team'
description 'Modular Cinematic Teleportation Menu for FiveM'
version '2.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/locations.lua'
}

client_scripts {
    'client/camera.lua',
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

ui_page 'html/index.html'
