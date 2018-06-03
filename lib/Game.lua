Game = {}

-- Game constructor
function Game.new()
    local self = {}
    
    local GameText = {
        Score = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "Score:"),
        ScoreValue = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "0")
	}

	function self.load()
        
    end
    
    function self.draw(score)
		local width, height, _ = love.window.getMode()
        love.graphics.draw(GameText.Score, (width - 4 * GameText.Score:getWidth()) * 0.125, GameText.Score:getHeight())
        GameText.ScoreValue:set(score)
        love.graphics.draw(GameText.ScoreValue, (width + 4 * GameText.Score:getWidth()) * 0.125, GameText.Score:getHeight())
    end

	return self
end

return Game