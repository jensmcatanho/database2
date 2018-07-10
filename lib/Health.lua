-- Quadrant:
--   1 | 2
-- ----+----
--   3 | 4 
-- 


Health = {}

local width, height = love.graphics.getDimensions()

function Health.new()
    local self = {}

    local sprites = {
        idle = love.graphics.newImage('resources/sprites/heart.png')
    }

    self.position = {
        x,
        y,
        w = sprites.idle:getWidth(),
        h = sprites.idle:getHeight()
    }

    function self.load()
        local quadrant = love.math.random(4)

        if quadrant == 1 then
            self.position.x = love.math.random(10 , (width/2) - 10) - self.position.w * 0.5
            self.position.y = love.math.random(10, (height/2) - 10) - self.position.h * 0.5
            
        elseif quadrant == 2 then
            self.position.x = love.math.random((width/2) + 10, width) - self.position.w * 0.5
            self.position.y = love.math.random(10, (height/2) - 10) - self.position.h * 0.5
            
        elseif quadrant == 3 then
            self.position.x = love.math.random(10, (width/2) - 10) - self.position.w * 0.5
            self.position.y = love.math.random((height/2) + 10, height) - self.position.h * 0.5
           
        elseif quadrant == 4 then
            self.position.x = love.math.random((width/2)  + 10, width) - self.position.w * 0.5
            self.position.y = love.math.random((height/2) + 10, height) - self.position.h * 0.5
            
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

return Health