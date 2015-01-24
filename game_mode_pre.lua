-- game_mode_pre.lua

local gameModePreClass = {}
gameModePreClass.__index = gameModePreClass


function gameModePreClass.new(gameState)
  local self = setmetatable({}, gameModePreClass)
  self.moduleName = "gameModePreClass"
  self.gameState = gameState
  return self
end

function gameModePreClass:load()
    
end

function gameModePreClass:update(dt)
    
end

function gameModePreClass:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModePreClass:keypressed(key)
	
end

return gameModePreClass