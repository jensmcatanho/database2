-- Quadrant:
--   1 | 2
-- ----+----
--   3 | 4 
-- 


Asteroid = {}

local width, height = love.graphics.getDimensions()
local quadrant = love.math.random(1, 4)

function Asteroid.new()
    local self = {}

    local sprites = {
        idle = love.graphics.newImage('resources/sprites/asteroid.png')
    }

    if quadrant == 1 then
        self.position = {
            x = love.math.random(10 , (width/2) - 10) - sprites.idle:getWidth() * 0.5,
            y = love.math.random(10, (height/2) - 10) - sprites.idle:getHeight() * 0.5
        }
    elseif quadrant == 2 then
        self.position = {
            x = love.math.random((width/2) + 10, width) - sprites.idle:getWidth() * 0.5,
            y = love.math.random(10, (height/2) - 10) - sprites.idle:getHeight() * 0.5
        }
    elseif quadrant == 3 then
        self.position = {
            x = love.math.random(10, (width/2) - 10) - sprites.idle:getWidth() * 0.5,
            y = love.math.random((height/2) + 10, height) - sprites.idle:getHeight() * 0.5
        }
    elseif quadrant == 4 then
        self.position = {
            x = love.math.random((width/2)  + 10, width) - sprites.idle:getWidth() * 0.5,
            y = love.math.random((height/2) + 10, height) - sprites.idle:getHeight() * 0.5
        }    
    end

    function self.update(dt)
        if self.position.x < (width/2) and self.position.y < (height/2) then
            self.position.x = self.position.x + (dt * 20)
            self.position.y = self.position.y + (dt * 20)

        elseif self.position.x > (width/2) and self.position.y < (height/2) then
            self.position.x = self.position.x - (dt * 20)
            self.position.y = self.position.y + (dt * 20)

        elseif  self.position.x < (width/2) and self.position.y > (height/2) then
            self.position.x = self.position.x + (dt * 20)
            self.position.y = self.position.y - (dt * 20)

        elseif  self.position.x > (width/2) and self.position.y > (height/2) then
            self.position.x = self.position.x - (dt * 20)
            self.position.y = self.position.y - (dt * 20) 
            
        end
    end

    function self.draw()
        love.graphics.draw(
                sprites.idle,
                self.position.x - sprites.idle:getWidth() * 0.5,
                self.position.y - sprites.idle:getHeight() * 0.5
        )
    end

    return self
end

return Asteroid