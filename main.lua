
local gs = require "game_state"

-- game state instance
GS = nil

-- init random seed
math.randomseed( os.time() )

function love.load()
   GS = gs.new()
   love.window.setMode(1366, 768, {fullscreen=true})
   love.mouse.setVisible(false)
end


function love.update(dt)
	-- push execution to current game mode
	GS.currentGameMode:update(dt)
end


function love.draw()
	-- push execution to current game mode
	GS.currentGameMode:draw()
end

function love.keypressed(key)
	-- push execution to current game mode
	if key == "escape" then
		love.event.quit()
	else
		GS.currentGameMode:keypressed(key)
	end
end

function love.keyreleased(key)
	-- push execution to current game mode
	GS.currentGameMode:keyreleased(key)
end

function love.mousepressed(x, y, button)
	-- push execution to current game mode
	GS.currentGameMode:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	-- push execution to current game mode
	GS.currentGameMode:mousereleased(x, y, button)
end
