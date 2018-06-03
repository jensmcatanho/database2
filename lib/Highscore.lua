Highscore = {}

function Highscore.new()
	local self = {}

	local highscore = {}

	local highscoreText = {}

	function self.load(hs)
		highscore = hs

		for _, data in ipairs(highscore) do
			table.insert(highscoreText, {
				date = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf'), data.date),
				score =  love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf'), data.score)
			})
		end
	end

	function self.update(dt)

	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		for index in ipairs(highscore) do
			dateWidth = (width - 2 * highscoreText[index].date:getWidth()) * 0.25
			dateHeight = height - ((11 - index) * height) * 0.090909 - highscoreText[index].date:getHeight() * 0.5
			love.graphics.draw(highscoreText[index].date, dateWidth, dateHeight)

			scoreWidth = (3 * width - 2 * highscoreText[index].score:getWidth()) * 0.25
			scoreHeight = dateHeight
			love.graphics.draw(highscoreText[index].score, scoreWidth, scoreHeight)
		end
	end

	return self
end

return Highscore