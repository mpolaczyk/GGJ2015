-- game_mode_rules.lua

local gameModeRulesClass = {}
gameModeRulesClass.__index = gameModeRulesClass


function gameModeRulesClass.new(gameState)
  local self = setmetatable({}, gameModeRulesClass)
  self.moduleName = "gameModeRulesClass"
  self.gameState = gameState
  return self
end

function gameModeRulesClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
end

function gameModeRulesClass:update(dt)
    
end

function gameModeRulesClass:draw()
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
    love.graphics.print("Rules screen: Hit enter to continue!", 10, 10)
end

function gameModeRulesClass:keypressed(key)
	if key == "return" then
		self.gameState:callGameModeAction(self.gameState.actionStart)
	end
end

function gameModeRulesClass.keyreleased(key)
end

function gameModeRulesClass:mousepressed(x, y, button)
end

function gameModeRulesClass:mousereleased(x, y, button)
end

return gameModeRulesClass
