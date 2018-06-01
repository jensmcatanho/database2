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

	function self.load()
		state = GameState.Menu
		redisClient.load()
		highscore.load()
	end

	function self.update(dt)
		if love.keyboard.isDown('m') then
			state = GameState.Menu
		elseif love.keyboard.isDown('h') then
			state = GameState.Highscore
		elseif love.keyboard.isDown('g') then
			state = GameState.Game
		elseif love.keyboard.isDown('e') then
			state = GameState.End
			redisClient.insert_score(10)
		elseif love.keyboard.isDown('escape') then
			love.event.push('quit')
		end
	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		if state == GameState.Menu then
			love.graphics.print("Menu", width/2, height/2)
		elseif state == GameState.Highscore then
			highscore.draw()
		elseif state == GameState.Game then
			love.graphics.print("Game", width/2, height/2)
		elseif state == GameState.End then
			love.graphics.print("End", width/2, height/2)
		else
			love.graphics.print("Error! Unknown state!", width/2, height/2)
		end
		
	end

	return self
end

return Manager