
-- public interface
local gmEnd = {}
gmEnd.moduleName = "gmEnd"

function gmEnd.load()
    
end

function gmEnd.update(dt)
    
end

function gmEnd.draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. gmEnd.moduleName .. " module", 10, 10)
end

function gmEnd.keypressed(key)
	
end

return gmEnd