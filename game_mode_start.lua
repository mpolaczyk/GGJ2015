-- game_mode_start.lua

local gameModeStartClass = {}
gameModeStartClass.__index = gameModeStartClass


function gameModeStartClass.new(gameState)
  local self = setmetatable({}, gameModeStartClass)
  self.moduleName = "gameModeStartClass"
  self.gameState = gameState
  return self
end

function gameModeStartClass:load()
    
end

function gameModeStartClass:update(dt)
    
end

function gameModeStartClass:draw()
    love.graphics.setColor(0, 255, 100, 255)
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModeStartClass:keypressed(key)
	if key == "1" then
		self.gameState:callGameModeAction(self.gameState.actionAllReady)
	end
end

return gameModeStartClass