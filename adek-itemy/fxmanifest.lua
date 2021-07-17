fx_version 'adamant'

game 'gta5'

version '1.0.0'

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'client/mainclient.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'server/mainserver.lua'
}