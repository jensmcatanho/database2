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

	function self.insert_score(score)
		time = os.time(os.date('*t'))
		client:zadd("highscore", score, time)
	end

	function self.retrieve_highscore()
		zrevrange = client:zrevrange("highscore", "0", "10", "withscores")
		highscore = {}

		for _, data in ipairs(zrevrange) do
			table.insert(highscore, {
				["date"] = os.date("%d/%m/%Y - %H:%M:%S", tonumber(data[1])),
				["score"] = data[2]
			})
		end

		return highscore
	end

	return self
end

return RedisClient