-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

function gameModeRunClass.new()
  local self = setmetatable({}, gameModeRunClass)
  self.moduleName = "gameModeRunClass"
  return self
end

function gameModeRunClass:load()
    
end

function gameModeRunClass:update(dt)
    
end

function gameModeRunClass:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModeRunClass:keypressed(key)
	
end

return gameModeRunClass