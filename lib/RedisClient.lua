local redis = require 'vendor.redis-lua.redis'

RedisClient = {}

-- RedisClient constructor
function RedisClient.new()
	local self = {}

	local client = redis.connect('127.0.0.1', 6379)

	function self.load()
        
	end

	function self.ping()
		return client:ping()
	end

	return self
end

return RedisClient