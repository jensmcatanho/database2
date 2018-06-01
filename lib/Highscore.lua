Highscore = {}

function Highscore.new()
	local self = {}

	local highscore = {}

	function self.load(hs)
		highscore = hs
	end

	function self.update(dt)

	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		for index, data in ipairs(highscore) do
			love.graphics.print(data.date, width/3, height/3 + 50*index)
			love.graphics.print(data.score, width/2 + 50, height/3 + 50*index)
		end
	end

	return self
end

return Highscore