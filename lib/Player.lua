Player = {}

PlayerState = {
    Idle = 0,
    Accelerating = 1,
    HoveringRight = 2,
    HoveringLeft = 3
}

-- Player constructor
function Player.new()
    local self = {}

    local sprites = {
        idle = love.graphics.newImage('resources/sprites/player-idle.png'),
        accelerating = love.graphics.newImage('resources/sprites/player-accelerating.png'),
        hovering_right = love.graphics.newImage('resources/sprites/player-hovering-right.png'),
        hovering_left = love.graphics.newImage('resources/sprites/player-hovering-left.png')
    }

    local state = nil

    self.x = 400
    self.y = 300

	function self.load()
        state = PlayerState.Idle
    end

    function self.update(dt)

    end
    
    function self.draw()
        if state == PlayerState.Idle then
            love.graphics.draw(sprites.idle, self.x, self.y)
        end
    
    end

	return self
end

return Player