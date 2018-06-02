Highscore = {}

function Highscore.new()
	local self = {}

	local highscore = {}

	function self.load(hs)
		highscore = hs
	end

	function self.update(dt)

	end

	function self.draw(mainFont)
		local width, height, _ = love.window.getMode()

		for index, data in ipairs(highscore) do
			dateWidth = (width - 2 * mainFont:getWidth(data.date)) * 0.25
			dateHeight = height - ((11 - index) * height)/11 - mainFont:getHeight()/2
			scoreWidth = (3 * width - 2 * mainFont:getWidth(data.score)) * 0.25
			scoreHeight = dateHeight
			love.graphics.print(data.date, dateWidth, dateHeight)
			love.graphics.print(data.score, scoreWidth, scoreHeight)
		end
	end

	return self
end

return Highscore