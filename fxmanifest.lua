-- Resource Metadata
author 'EnderDevelopment'
description 'A FiveM resource with a scoreboard'
version '1.0.0'

-- This is the manifest file that specifies the resource's metadata and dependencies.

-- Resource Metadata
author 'EnderDevelopment'
description 'A FiveM resource with a scoreboard'
version '1.0.0'

-- What to run
game 'gta5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page 'html/index.html'

-- Files included in resource (don't delete)
files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

-- Dependencies
dependency 'yarn'
