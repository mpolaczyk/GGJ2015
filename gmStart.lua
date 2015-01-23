
-- public interface
local gmStart = {}
gmStart.moduleName = "gmStart"

function gmStart.load()
    
end

function gmStart.update(dt)
    
end

function gmStart.draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. gmStart.moduleName .. " module", 10, 10)
end

function gmStart.keypressed(key)
	
end

return gmStart