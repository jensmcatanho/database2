Manager = {}

-- Manager constructor
function Manager.new()
	local self = {}

	function self.load()

	end

	function self.update(dt)

	end

	function self.draw()
		local width, height, _ = love.window.getMode()
    	love.graphics.print("Hello, world!", width/2, height/2)
	end

	return self
end

return Manager