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
    
    love.graphics.print("This is " .. self.moduleName .. " module", 10, 10)
end

function gameModePreClass:keypressed(key)
	if key == "return" then
		self.gameState:callGameModeAction(self.gameState.actionEnter)
	end
end

return gameModePreClass