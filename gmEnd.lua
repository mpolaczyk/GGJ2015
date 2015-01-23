
-- public interface
local gmEnd = {}
gmEnd.__index = gmEnd

function gmEnd.new()
  local self = setmetatable({}, gmEnd)
  self.moduleName = "gmEnd"
  return self
end

function gmEnd:load()
    
end

function gmEnd:update(dt)
    
end

function gmEnd:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gmEnd:keypressed(key)
	
end

return gmEnd