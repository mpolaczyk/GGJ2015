
gmStart = require "gmStart"
gmRun = require "gmRun"
gmEnd = require "gmEnd"
gmCurse = require "gmCurse"

-- const game modes
GM_Start = gmStart.moduleName
GM_Run = gmRun.moduleName
GM_End = gmEnd.moduleName
GM_Curse = gmCurse.moduleName

-- game state
currentModule = GM_Start;



function love.load()
	-- push execution to current module
    if currentModule == GM_Start then
		gmStart.load()
    elseif currentModule == GM_Run then
        gmRun.load()
    elseif currentModule == GM_End then
		gmEnd.load()
    elseif currentModule == GM_Curse then
		gmCurse.load()
    end
end


function love.update(dt)
	-- push execution to current module
    if currentModule == GM_Start then
		gmStart.update()
    elseif currentModule == GM_Run then
        gmRun.update()
    elseif currentModule == GM_End then
		gmEnd.update()
    elseif currentModule == GM_Curse then
		gmCurse.update()
    end
end


function love.draw()
	-- push execution to current module
	if currentModule == GM_Start then
		gmStart.draw()
    elseif currentModule == GM_Run then
        gmRun.draw()
    elseif currentModule == GM_End then
		gmEnd.draw()
    elseif currentModule == GM_Curse then
		gmCurse.draw()
    end
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