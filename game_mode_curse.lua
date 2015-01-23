-- game_mode_curse.lua

local gameModeCurseClass = {}
gameModeCurseClass.__index = gameModeCurseClass


function gameModeCurseClass.new()
  local self = setmetatable({}, gameModeCurseClass)
  self.moduleName = "gameModeCurseClass"
  return self
end

function gameModeCurseClass:load()
    
end

function gameModeCurseClass:update(dt)
    
end

function gameModeCurseClass:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModeCurseClass:keypressed(key)
	
end

return gameModeCurseClass