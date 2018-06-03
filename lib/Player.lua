Player = {}

PlayerState = {
    Idle = 0,
    Accelerating = 1,
    HoveringLeft = 2,
    HoveringRight = 3,
    AcceleratingHoveringLeft = 4,
    AcceleratingHoveringRight = 5
}

-- Player constructor
function Player.new()
    local self = {}

    local sprites = {
        idle = love.graphics.newImage('resources/sprites/player-idle.png'),
        accelerating = love.graphics.newImage('resources/sprites/player-accelerating.png'),
        hovering_left = love.graphics.newImage('resources/sprites/player-hovering-left.png'),
        hovering_right = love.graphics.newImage('resources/sprites/player-hovering-right.png'),
        accelerating_hovering_left = love.graphics.newImage('resources/sprites/player-accelerating-hovering-left.png'),
        accelerating_hovering_right = love.graphics.newImage('resources/sprites/player-accelerating-hovering-right.png')
    }

    local state = nil

    self.x = 400
    self.y = 300

	function self.load()
        state = PlayerState.Idle
    end

    function self.update(dt)
        state = PlayerState.Idle

        if (love.keyboard.isDown('a') or love.keyboard.isDown('left')) and (love.keyboard.isDown('w') or love.keyboard.isDown('up')) then
            state = PlayerState.AcceleratingHoveringLeft

        elseif (love.keyboard.isDown('d') or love.keyboard.isDown('right')) and (love.keyboard.isDown('w') or love.keyboard.isDown('up')) then
            state = PlayerState.AcceleratingHoveringRight

        elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
            state = PlayerState.HoveringLeft

        elseif love.keyboard.isDown('d') or love.keyboard.isDown('right') then
            state = PlayerState.HoveringRight

        elseif love.keyboard.isDown('w') or love.keyboard.isDown('up') then
            state = PlayerState.Accelerating

        end

    end
    
    function self.draw()
        if state == PlayerState.Idle then
            love.graphics.draw(sprites.idle, self.x, self.y)
            
        elseif state == PlayerState.Accelerating then
            love.graphics.draw(sprites.accelerating, self.x, self.y)
            
        elseif state == PlayerState.HoveringLeft then
            love.graphics.draw(sprites.hovering_left, self.x, self.y)
        
        elseif state == PlayerState.HoveringRight then
            love.graphics.draw(sprites.hovering_right, self.x, self.y)

        elseif state == PlayerState.AcceleratingHoveringLeft then
            love.graphics.draw(sprites.accelerating_hovering_left, self.x, self.y)

        elseif state == PlayerState.AcceleratingHoveringRight then
            love.graphics.draw(sprites.accelerating_hovering_right, self.x, self.y)

        end
    
    end

	return self
end

return Player