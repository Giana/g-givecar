fx_version 'cerulean'

game 'gta5'

author 'Giana - github.com/Giana'
description 'g-givecar'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'qb-core',
    'oxmysql'
}

lua54 'yes'