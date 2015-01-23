
local gs = require "game_state"

GS = nil

function love.load()
	GS = gs.new()
end


function love.update(dt)
	-- push execution to current module
    GS.currentGameMode:update(dt)
end


function love.draw()
	-- push execution to current module
	GS.currentGameMode:draw()
end

function love.keypressed(key)
	-- push execution to current module
	GS.currentGameMode:keypressed(key)
end