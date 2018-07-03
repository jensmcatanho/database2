local RedisClient = require('lib.RedisClient')
local Highscore = require('lib.Highscore')
local Menu = require('lib.Menu')
local Game = require('lib.Game')
local Player = require('lib.Player')
local Asteroid = require('lib.Asteroid')

Manager = {}

GameState = {
	Menu = 0,
	Highscore = 1,
	Game = 2,
	End = 3,
	Restart = 4
}

-- Manager constructor
function Manager.new()
	local self = {}

	local redisClient = RedisClient.new()
	local asteroids = {}

	local state = nil
	local highscore = Highscore.new()
	local menu = Menu.new()
	local game = Game.new()
	local player = Player.new()

	local score = 0

	function self.load()
		redisClient.load()
		player.load()
		state = GameState.Menu
	end

	function self.update(dt)
		if state == GameState.Menu then
			if love.keyboard.isDown('h') then
				highscore_list = redisClient.retrieve_highscore()
				highscore.load(highscore_list)
				state = GameState.Highscore
			elseif love.keyboard.isDown('p') then
				state = GameState.Game
				for i=1,3 do
					table.insert(asteroids, Asteroid.new())
				end
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
			

			player.update(dt)
			for key, asteroid in pairs(asteroids) do
				asteroid.update(dt)
				if CheckCollision(player.position.x, player.position.y, player.position.w, player.position.h,
					asteroid.position.x, asteroid.position.y, asteroid.position.w, asteroid.position.h) then
						state = GameState.Restart
				end
			end
			

		elseif state == GameState.End then
			if love.keyboard.isDown('m') then
				state = GameState.Menu
			end
		
		elseif state == GameState.Restart then
			redisClient.insert_score(score)
			asteroids = {}
			state = GameState.Menu

		end

		if love.keyboard.isDown('escape') then
			love.event.push('quit')
		end
	end

	function self.draw()
		local width, height, _ = love.window.getMode()

		if state == GameState.Menu then
			menu.draw()
		elseif state == GameState.Highscore then
			highscore.draw()
		elseif state == GameState.Game then
			game.draw(score)
			player.draw()
			for key, asteroid in pairs(asteroids) do
				asteroid.draw()
			end
		elseif state == GameState.End then
			--love.graphics.print("End", (width - textFont:getWidth("End"))/2, (height - textFont:getHeight())/2)
		end
		
	end

	return self
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 < x2+w2 and
		   x2 < x1+w1 and
		   y1 < y2+h2 and
		   y2 < y1+h1
end

return Manager