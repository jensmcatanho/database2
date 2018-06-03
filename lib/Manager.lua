local RedisClient = require('lib.RedisClient')
local Highscore = require('lib.Highscore')

Manager = {}

GameState = {Menu = 0, Highscore = 1, Game = 2, End = 3}

-- Manager constructor
function Manager.new()
	local self = {}

	local redisClient = RedisClient.new()
	local state = nil
	local highscore = Highscore.new()

	local mainFont = love.graphics.newFont('resources/fonts/PressStart2P.ttf');

	local score = 0

	function self.load()
		state = GameState.Menu
		redisClient.load()
		love.graphics.setFont(mainFont)
	end

	function self.update(dt)
		if state == GameState.Menu then
			if love.keyboard.isDown('h') then
				highscore_list = redisClient.retrieve_highscore()
				highscore.load(highscore_list)
				state = GameState.Highscore
			elseif love.keyboard.isDown('g') then
				state = GameState.Game
			end

		elseif state == GameState.Highscore then
			if love.keyboard.isDown('m') then
				state = GameState.Menu
			end
 
		elseif state == GameState.Game then
			if love.keyboard.isDown('m') then
				state = GameState.Menu
			elseif love.keyboard.isDown('e') then
				redisClient.insert_score(score)
				state = GameState.End
			end

		elseif state == GameState.End then
			if love.keyboard.isDown('m') then
				state = GameState.Menu
			end

		end

		if love.keyboard.isDown('escape') then
			love.event.push('quit')
		end
	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		if state == GameState.Menu then
			love.graphics.print("Menu", (width - mainFont:getWidth("Menu"))/2, (height - mainFont:getHeight())/2)
		elseif state == GameState.Highscore then
			highscore.draw(mainFont)
		elseif state == GameState.Game then
			love.graphics.print("Game", (width - mainFont:getWidth("Game"))/2, (height - mainFont:getHeight())/2)
		elseif state == GameState.End then
			love.graphics.print("End", (width - mainFont:getWidth("End"))/2, (height - mainFont:getHeight())/2)
		end
		
	end

	return self
end

return Manager