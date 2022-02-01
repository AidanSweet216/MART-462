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

local button = display.newImageRect("./images/left.png", 50, 50)
button.x = 50
button.y = 50

local button2 = display.newImageRect("./images/right.png", 50, 50)
button2.x = 275
button2.y = 50

local platform = display.newImageRect( "./images/wood platform.png", 400, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local platform2 = display.newImageRect( "./images/wood platform.png", 400, 50 )
platform2.x = 155
platform2.y = -50

local column = display.newImageRect("./images/column.png", 200 , 300)
column.x = display.contentCenterX
column.y = display.contentCenterY+60

local balloons = {}
local currentX = 5;
local balloon = display.newImage("./images/grapes.png", 100, 50)
balloon.x = display.contentCenterX+1000
balloon.y = display.contentCenterY

local physics = require( "physics" )
physics.start()
 
physics.addBody( platform, "static" )
physics.addBody( platform2, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )
physics.addBody( column," dynamic")
local grav = .05
for i=0,balloonCount do
    grav = math.random(-5,10);
   
    balloons[i] = display.newImageRect( "./images/grapes.png", 50, 50 )
    local xPlacement = math.random(50,400)
    balloons[i].x = xPlacement
    
    balloons[i].y = 50
    balloons[i].alpha = 0.7
    currentX = currentX + 5
    physics.addBody(balloons[i],"dynamic", { radius=25, bounce=0.3 } )
   -- balloons[i].gravityScale = grav
end

local function moveColumnLeft()
    column:applyLinearImpulse( -5, 0, column.x, column.y)
end

button:addEventListener( "tap", moveColumnLeft)

local function moveColumnRight()
    column:applyLinearImpulse( 5, 0, column.x, column.y)
end

button2:addEventListener("tap", moveColumnRight)

