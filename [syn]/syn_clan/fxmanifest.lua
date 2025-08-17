fx_version 'adamant'
game 'rdr3'
author 'Synthetic Blue'
version '1.0.0'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
shared_scripts {
	'config/info.lua',
	'config/language.lua',
	'config/config.lua',
	'functions.lua',
	'config/furniture.lua',
	'config/npc_creator.lua',
	'config/missions.lua'

}

client_scripts {
	'dataview.lua',
	'client.lua'
}

server_scripts {
	'server.lua'
}
escrow_ignore {
	'config/info.lua',
	'config/language.lua',
	'config/config.lua',
	'config/furniture.lua',
	'config/npc_creator.lua',
	'dataview.lua',
	'client.lua',
	'config/missions.lua',
}
dependency {
	"vorp_core",
	"vorp_inventory",
	"syn_inputs",
}
dependency '/assetpacks'