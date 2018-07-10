-- Quadrant:
--   1 | 2
-- ----+----
--   3 | 4 
-- 


Asteroid = {}

local width, height = love.graphics.getDimensions()

function Asteroid.new()
    local self = {}

    local sprites = {
        idle = love.graphics.newImage('resources/sprites/asteroid.png')
    }

    self.position = {
        x,
        y,
        w = sprites.idle:getWidth(),
        h = sprites.idle:getHeight()
    }

    self.lookAt = {
        x,
        y
    }
    
    function self.load()
        local quadrant = love.math.random(4)
        local angle = math.rad(love.math.random(110, 160))

        if quadrant == 1 then
            self.position.x = love.math.random(10 , (width/2) - 10) - self.position.w * 0.5
            self.position.y = love.math.random(10, (height/2) - 10) - self.position.h * 0.5
            angle = math.rad(love.math.random(110, 160))
            
        elseif quadrant == 2 then
            self.position.x = love.math.random((width/2) + 10, width) - self.position.w * 0.5
            self.position.y = love.math.random(10, (height/2) - 10) - self.position.h * 0.5
            angle = math.rad(love.math.random(20, 70))
            
        elseif quadrant == 3 then
            self.position.x = love.math.random(10, (width/2) - 10) - self.position.w * 0.5
            self.position.y = love.math.random((height/2) + 10, height) - self.position.h * 0.5
            angle = math.rad(love.math.random(200, 250))
           
        elseif quadrant == 4 then
            self.position.x = love.math.random((width/2)  + 10, width) - self.position.w * 0.5
            self.position.y = love.math.random((height/2) + 10, height) - self.position.h * 0.5
            angle = math.rad(love.math.random(290, 340))
            
        end

        self.lookAt.x, self.lookAt.y = math.cos(angle), math.sin(angle)
    end

    function self.update(dt)
        self.position.x = self.position.x + self.lookAt.x + (dt * 20)
        self.position.y = self.position.y + self.lookAt.y + (dt * 20)
        
        if self.position.x >= width then
            self.position.x = self.position.w
        elseif self.position.x <= 0 then
            self.position.x = width - self.position.w
        end

        if self.position.y >= height then
            self.position.y = self.position.h

        elseif self.position.y <= 0 then
            self.position.y = height - self.position.h
            
        end
    end

    function self.draw()
        love.graphics.draw(
                sprites.idle,
                self.position.x - self.position.w * 0.5,
                self.position.y - self.position.h * 0.5
        )
    end

    return self
end

return Asteroid