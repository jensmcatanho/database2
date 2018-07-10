End = {}

-- End constructor
function End.new()
    local self = {}
    
    local EndText = {
        Score = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "final score"),
        ScoreValue = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "0"),
    }

	function self.load()
        
    end
    
    function self.draw(score)
		local width, height, _ = love.window.getMode()
        love.graphics.draw(EndText.Score, (width - EndText.Score:getWidth()) * 0.5, (height - EndText.Score:getHeight()) * 0.5)
        EndText.ScoreValue:set(score)
        love.graphics.draw(EndText.ScoreValue, (width - EndText.ScoreValue:getWidth()) * 0.5, height * 0.5 + 2 * EndText.Score:getHeight())
    end

	return self
end

return End