
gmStart = require "game_mode_start"
gmRun = require "game_mode_run"
gmEnd = require "game_mode_end"
gmCurse = require "game_mode_curse"
gs = require "game_state"

GM_Start = nil
GM_Run = nil
GM_End = nil
GM_Curse = nil
GS = nil

function love.load()
	GM_Start = gmStart.new()
	GM_Run = gmRun.new()
	GM_End = gmEnd.new()
	GM_Curse = gmCurse.new()
	GS = gs.new()
	
	currentModule = GM_Start;
end


function love.update(dt)
	-- push execution to current module
    currentModule:update(dt)
end


function love.draw()
	-- push execution to current module
	currentModule:draw()
end

function love.keypressed(key)
	-- test code, remove this. I use this to artificially change modules
	if key == "s" then
		currentModule = GM_Start
    elseif key == "r" then
        currentModule = GM_Run
    elseif key == "e" then
		currentModule = GM_End
    elseif key == "c" then
		currentModule = GM_Curse
    end
end