
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
	-- test code, remove this. I use this to artificially change modules
	if key == "s" then
		GS.currentGameMode = GS.GM_Start
    elseif key == "r" then
        GS.currentGameMode = GS.GM_Run
    elseif key == "e" then
		GS.currentGameMode = GS.GM_End
    elseif key == "c" then
		GS.currentGameMode = GS.GM_Curse
    end
end