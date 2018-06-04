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

    self.position = {
        x = 400 - sprites.idle:getWidth() * 0.5,
        y = 300 - sprites.idle:getHeight() * 0.5
    }
    
    local yaw = math.rad(270)
    self.lookAt = {
        x = math.sin(yaw),
        y = math.cos(yaw)
    }

	function self.load()
        state = PlayerState.Idle
    end

    function self.update(dt)
        state = PlayerState.Idle

        if (love.keyboard.isDown('a') or love.keyboard.isDown('left')) and (love.keyboard.isDown('w') or love.keyboard.isDown('up')) then
            state = PlayerState.AcceleratingHoveringLeft
            yaw = yaw + math.rad(2.0)
            self.lookAt.x, self.lookAt.y = math.sin(yaw), -math.cos(yaw)
            self.position.x, self.position.y = self.position.x + self.lookAt.x * 3, self.position.y + self.lookAt.y * 3

        elseif (love.keyboard.isDown('d') or love.keyboard.isDown('right')) and (love.keyboard.isDown('w') or love.keyboard.isDown('up')) then
            state = PlayerState.AcceleratingHoveringRight
            yaw = yaw - math.rad(2.0)
            self.lookAt.x, self.lookAt.y = math.sin(yaw), -math.cos(yaw)
            self.position.x, self.position.y = self.position.x + self.lookAt.x * 3, self.position.y + self.lookAt.y * 3

        elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
            state = PlayerState.HoveringLeft
            yaw = yaw + math.rad(2.0)
            self.lookAt.x, self.lookAt.y = math.sin(yaw), -math.cos(yaw)

        elseif love.keyboard.isDown('d') or love.keyboard.isDown('right') then
            state = PlayerState.HoveringRight
            yaw = yaw - math.rad(2.0)
            self.lookAt.x, self.lookAt.y = math.sin(yaw), -math.cos(yaw)

        elseif love.keyboard.isDown('w') or love.keyboard.isDown('up') then
            state = PlayerState.Accelerating
            self.position.x, self.position.y = self.position.x + self.lookAt.x * 3, self.position.y + self.lookAt.y * 3

        end

		local width, height, _ = love.window.getMode()
        if self.position.x >= width then
            self.position.x = sprites.idle:getWidth()
        elseif self.position.x <= 0 then
            self.position.x = width - sprites.idle:getWidth()
        end

        if self.position.y >= height then
            self.position.y = sprites.idle:getHeight()
        elseif self.position.y <= 0 then
            self.position.y = height - sprites.idle:getHeight()
        end

    end

    function self.draw()
        if state == PlayerState.Idle then
            love.graphics.draw(
                sprites.idle,
                self.position.x - sprites.idle:getWidth() * 0.5,
                self.position.y - sprites.idle:getHeight() * 0.5,
                yaw
            )
            
        elseif state == PlayerState.Accelerating then
            love.graphics.draw(
                sprites.accelerating,
                self.position.x - sprites.accelerating:getWidth() * 0.5,
                self.position.y - sprites.accelerating:getHeight() * 0.5,
                yaw
        )
            
        elseif state == PlayerState.HoveringLeft then
            love.graphics.draw(
                sprites.hovering_left,
                self.position.x - sprites.hovering_left:getWidth() * 0.5,
                self.position.y - sprites.hovering_left:getHeight() * 0.5,
                yaw
            )
        
        elseif state == PlayerState.HoveringRight then
            love.graphics.draw(
                sprites.hovering_right,
                self.position.x - sprites.hovering_right:getWidth() * 0.5,
                self.position.y - sprites.hovering_right:getHeight() * 0.5,
                yaw
            )

        elseif state == PlayerState.AcceleratingHoveringLeft then
            love.graphics.draw(
                sprites.accelerating_hovering_left,
                self.position.x - sprites.accelerating_hovering_left:getWidth() * 0.5,
                self.position.y - sprites.accelerating_hovering_left:getHeight() * 0.5,
                yaw
            )

        elseif state == PlayerState.AcceleratingHoveringRight then
            love.graphics.draw(
                sprites.accelerating_hovering_right,
                self.position.x - sprites.accelerating_hovering_right:getWidth() * 0.5,
                self.position.y - sprites.accelerating_hovering_right:getHeight() * 0.5,
                yaw
            )

        end
    end

	return self
end

return Player