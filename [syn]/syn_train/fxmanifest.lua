fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
game "rdr3"

client_script {'client.lua','dataview.lua','warmenu.lua'}
server_script {'server.lua'}
shared_scripts {'config.lua'}
ui_page "html/index.html"

files {
	'html/index.html',
	'html/script.js',
	'html/style.css',
	'html/img/*',
}
escrow_ignore {
	'client.lua',
	'dataview.lua',
	'warmenu.lua',
	'config.lua',
}
dependency '/assetpacks'