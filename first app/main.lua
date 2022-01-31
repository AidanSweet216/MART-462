-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local balloonCount = 50
local background = display.newImageRect("./images/background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "./images/platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local platform2 = display.newImageRect( "./images/platform.png", 355, 50 )
platform2.x = 155
platform2.y = -50

local balloons = {}
local currentX = 5;
local balloon = display.newImage("./images/balloon.png", 100, 50)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY

local physics = require( "physics" )
physics.start()
 
physics.addBody( platform, "static" )
physics.addBody( platform2, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )
local grav = 0.5
for i=0,balloonCount do
    grav = math.random(-5,10);
    --print(grav)
    balloons[i] = display.newImageRect( "./images/balloon.png", 50, 50 )
    local xPlacement = math.random(50,400)
    print(xPlacement)
    balloons[i].x = xPlacement
    
    balloons[i].y = 50
    balloons[i].alpha = 0.7
    currentX = currentX + 5
    physics.addBody(balloons[i],"dynamic", { radius=25, bounce=0.3 } )
    balloons[i].gravityScale = grav
end

local function pushBalloon()
      balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
end

balloon:addEventListener("tap", pushBalloon )