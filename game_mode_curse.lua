-- game_mode_curse.lua

local gameModeCurseClass = {}
gameModeCurseClass.__index = gameModeCurseClass


function gameModeCurseClass.new(gameState)
  local self = setmetatable({}, gameModeCurseClass)
  self.moduleName = "gameModeCurseClass"
  self.gameState = gameState
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
	if key == "3" then
		self.gameState:callGameModeAction(self.gameState.actionCurseResult)
	end
end

return gameModeCurseClass