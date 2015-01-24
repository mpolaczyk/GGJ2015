-- game_mode_start.lua

local gameModeStartClass = {}
gameModeStartClass.__index = gameModeStartClass


function gameModeStartClass.new(gameState)
  local self = setmetatable({}, gameModeStartClass)
  self.moduleName = "gameModeStartClass"
  self.gameState = gameState
  
  self.playerAReady = false
  self.playerBReady = false
  self.playerCReady = false
  self.playerDReady = false
  
  return self
end

function gameModeStartClass:load()
    
end

function gameModeStartClass:update(dt)
    
	-- check if game mode done
	if self.playerAReady and self.playerBReady and self.playerCReady then
		self.gameState:callGameModeAction(self.gameState.actionAllReady)
	end
end

function gameModeStartClass:draw()
	if self.playerAReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerBReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerCReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerDReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
end

function gameModeStartClass:keypressed(key)
	if key == "w" or key == "w" or key == "a" or key == "d" then
		self.playerAReady = true
	elseif key == "u" or key == "j" or key == "j" or key == "k" then
		self.playerBReady = true
	elseif key == "up" or key == "down" or key == "left" or key == "right" then
		self.playerCReady = true
	end
end

return gameModeStartClass