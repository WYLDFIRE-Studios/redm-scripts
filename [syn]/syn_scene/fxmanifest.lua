fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
game "rdr3"




client_script {
	'config.lua',
	'client.lua',
	'warmenu.lua'

}

server_scripts {
	'config.lua',
	'server.lua'
}

escrow_ignore {
	'config.lua',
	'client.lua',
	'warmenu.lua'
}
dependency '/assetpacks'
dependency '/assetpacks-redm'