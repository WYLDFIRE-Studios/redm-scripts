fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
lua54 'yes'

client_script {'client.lua','warmenu.lua'}
server_script {'server.lua'}
shared_scripts {'config.lua','@syn_stable/config/config.lua'}

escrow_ignore {
	'config.lua',
	'client.lua',
	'warmenu.lua',
}

dependency '/assetpacks'