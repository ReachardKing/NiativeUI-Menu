resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
version '1.7.6'
client_scripts {
    "dependency/*", --untick this if you do not have NativeUI folder
    -- "@NativeUI/NativeUI.lua",
    "Client.lua",
    "CRP Menu.lua",
    "functions.lua",
    "Version_Checker.json"
}
    
server_script "Server.lua"
server_script "version_checker.lua"
