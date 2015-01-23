
-- public interface
local gmCurse = {}
gmCurse.__index = gmCurse


function gmCurse.new()
  local self = setmetatable({}, gmCurse)
  self.moduleName = "gmCurse"
  return self
end

function gmCurse:load()
    
end

function gmCurse:update(dt)
    
end

function gmCurse:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gmCurse:keypressed(key)
	
end

return gmCurse