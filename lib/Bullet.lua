Bullet = {}

function Bullet.new()
    local self = {}

    self.ticks = {
        max = 10,
        min = 0
    }

    
    function self.move(bullets, lookAt)
        local i,b
        for i,b in pairs(bullets) do
            b.x = b.x+(b.vx * lookAt.x)
            b.y = b.y+(b.vy * lookAt.y)
            -- b.x = b.x+lookAt.x
            -- b.y = b.y+lookAt.y
            -- b.ttl = b.ttl - 1
            -- if b.ttl == 0 then bullets[i] = nil end
        end
        
        return bullets
    end

    function self.draw(bullets) 
        local i,b
            for i,b in pairs(bullets) do
                love.graphics.rectangle('fill',b.x - 25,b.y-25,8,4)
        end
        
        return bullets
    end

    return self

end

return Bullet
