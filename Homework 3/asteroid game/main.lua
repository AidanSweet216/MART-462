-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--variables
local lives = 3
local score = 0
local died = false
 
local asteroidsTable = {}
 
local ship
local gameLoopTimer
local livesText
local scoreText

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )

math.randomseed( os.time() )

--sprite sheet
local sheetOptions =
{
    frames =
    {
        {   -- 1) asteroid 1
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        {   -- 2) asteroid 2
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        {   -- 3) asteroid 3
            x = 0,
            y = 168,
            width = 100,
            height = 97
        },
        {   -- 4) ship
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        {   -- 5) laser
            x = 98,
            y = 265,
            width = 14,
            height = 40
        },
    },
}
-- Load spacey background
local backGroup = display.newGroup()

local background = display.newImageRect("./images/background.png", 800, 1400 )
background.x = display.contentCenterX
background.y = display.contentCenterY

backGroup:insert(background)
local objectSheet = graphics.newImageSheet( "./images/gameObjects.png", sheetOptions )