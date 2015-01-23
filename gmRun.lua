
-- public interface
local gmRun = {}
gmRun.moduleName = "gmRun"

function gmRun.load()
    
end

function gmRun.update(dt)
    
end

function gmRun.draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. gmRun.moduleName .. " module", 10, 10)
end

function gmRun.keypressed(key)
	
end

return gmRun