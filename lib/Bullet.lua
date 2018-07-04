Bullet = {}

function Bullet.new(posX,posY)
    local self = {}

    self.ticks = {
        max = 10,
        min = 0
    }

    self.position = {
        x = posX,
        y = posY,
        w = 8,
        h = 4
    }

    
    function self.move(bullets, lookAt, dt)
        local i,b
        
            self.position.x = self.position.x + (10 * dt * lookAt.x)
            self.position.y = self.position.y + (10 * dt * lookAt.y)
            -- b.x = b.x+lookAt.x
            -- b.y = b.y+lookAt.y
            -- b.ttl = b.ttl - 1
            -- if b.ttl == 0 then bullets[i] = nil end
        
        
        return bullets
    end

    function self.draw(bullets) 
        local i,b
            for i,b in pairs(bullets) do
                love.graphics.rectangle('fill',b.position.x - 25, b.position.y-25, 
                                        b.position.w, b.position.h)
        end
        
        return bullets
    end

    return self

end

return Bullet
