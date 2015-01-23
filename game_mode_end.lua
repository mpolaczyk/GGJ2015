-- game_mode_end.lua

local gameModeEndClass = {}
gameModeEndClass.__index = gameModeEndClass


function gameModeEndClass.new(gameState)
  local self = setmetatable({}, gameModeEndClass)
  self.moduleName = "gameModeEndClass"
  self.gameState = gameState
  return self
end

function gameModeEndClass:load()
    
end

function gameModeEndClass:update(dt)
    
end

function gameModeEndClass:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModeEndClass:keypressed(key)
	
end

return gameModeEndClass