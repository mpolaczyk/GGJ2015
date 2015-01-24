
local gs = require "game_state"

GS = nil

function love.load()
	GS = gs.new()
	love.window.setMode(1366, 768)
	
	-- init random seed
	math.randomseed( os.time() )
	math.random(); math.random(); math.random()
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
	GS.currentGameMode:keypressed(key)
end