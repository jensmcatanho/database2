Menu = {}

-- Menu constructor
function Menu.new()
    local self = {}
    
    local MenuText = {
		Title = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 32), "Menu"),
		Play = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "Play (P)"),
		Highscore = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "Highscore (H)"),
		Exit = love.graphics.newText(love.graphics.newFont('resources/fonts/PressStart2P.ttf', 20), "Exit (ESC)")
	}

	function self.load()
        
    end
    
    function self.draw()
		local width, height, _ = love.window.getMode()
        love.graphics.draw(MenuText.Title, (width - MenuText.Title:getWidth()) * 0.5, (2 * height - 5 * MenuText.Title:getHeight()) * 0.1)
        love.graphics.draw(MenuText.Play, (width - MenuText.Play:getWidth()) * 0.5, (4 * height - 2 * MenuText.Play:getHeight()) * 0.1)
        love.graphics.draw(MenuText.Highscore, (width - MenuText.Highscore:getWidth()) * 0.5, (6 * height - 2 * MenuText.Highscore:getHeight()) * 0.1)
        love.graphics.draw(MenuText.Exit, (width - MenuText.Exit:getWidth()) * 0.5, (8 * height - 2 * MenuText.Exit:getHeight()) * 0.1)
    end

	return self
end

return Menu