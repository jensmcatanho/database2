local Manager = require('lib.Manager')

function love.load()
	love.window.setTitle("Database Project")
	manager = Manager.new()
	manager.load()
end

function love.update(dt)
	manager.update(dt)
end

function love.draw()
--	love.graphics.setColor({1.0, 0.5, 1.0})
	manager.draw()
end