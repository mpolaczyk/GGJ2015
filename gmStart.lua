
-- public interface
local gmStart = {}
gmStart.__index = gmStart

function gmStart.new()
  local self = setmetatable({}, gmStart)
  self.moduleName = "gmStart"
  return self
end

function gmStart:load()
    
end

function gmStart:update(dt)
    
end

function gmStart:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gmStart:keypressed(key)
	
end

return gmStart