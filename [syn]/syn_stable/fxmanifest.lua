fx_version 'adamant'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

client_script {
	'client/client.lua',
	'client/warmenu.lua'
}

server_script {
	'server/server.lua'
}
shared_script {
	'config/horse_comp.lua',
	'config/config.lua',
}
ui_page 'html/index.html'

files {
	'html/**/*'
}


escrow_ignore {
	'config/*.lua',
	'client/*.lua',
	'html/*.html',
	'html/*.js',
	'html/*.css',
	'html/img/*.png'
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'