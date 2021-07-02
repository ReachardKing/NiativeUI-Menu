10:32 AM 2021-06-25

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

fx_version "Bodacious"

script_version "1.0"

game 'gta5'

auther 'Mackenzie_rich'
discription "Allows for more palyer interaction, an all in one menu"

vsersion "1.0.0"

--[[file{
	"CRP Menu.lua",
	"Canadian RP.html",
	"index.html",
	"info.text"
}
client_script "CRP Menu.lua"]]


ui_page "ui/ui.html"

files {
  'ui/ui.js',
  'ui/ui.css',
  'ui/logo.png',
  'ui/ui.html',
}

client_scripts {
    'client.lua',
}