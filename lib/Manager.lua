local RedisClient = require('lib.RedisClient')

Manager = {}

-- Manager constructor
function Manager.new()
	local self = {}

	local redisClient = RedisClient.new()

	function self.load()

	end

	function self.update(dt)

	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		if redisClient.ping() then
    		love.graphics.print("Hello, world!", width/2, height/2)
		end
	end

	return self
end

return Manager