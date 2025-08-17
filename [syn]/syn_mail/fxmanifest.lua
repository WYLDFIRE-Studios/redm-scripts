fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
lua54 'yes'

client_script {'config.lua','client.lua'}
server_script {'config.lua','server.lua'}

ui_page "html/index.html"

files {
	'html/**/*',
}

escrow_ignore {
	'config.lua',
	'client.lua',
}
dependency '/assetpacks'