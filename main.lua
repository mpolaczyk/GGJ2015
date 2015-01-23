
gmStart = require "gmStart"
gmRun = require "gmRun"
gmEnd = require "gmEnd"
gmCurse = require "gmCurse"


GM_Start = nil
GM_Run = nil
GM_End = nil
GM_Curse = nil


function love.load()
	GM_Start = gmStart.new()
	GM_Run = gmRun.new()
	GM_End = gmEnd.new()
	GM_Curse = gmCurse.new()
	
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