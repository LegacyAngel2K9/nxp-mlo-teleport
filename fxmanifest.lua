fx_version 'cerulean'
game 'gta5'

author 'Legacy DEV Team'
description 'Teleport Service for NXP'
version '1.0.0'
lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

files {
    'html/index.html',
    'html/js/script.js',
    'html/css/style.css'
}

data_file "PED_METADATA_FILE" "ped.xml"
file "ped.xml"