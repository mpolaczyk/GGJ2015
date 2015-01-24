-- game_mode_run.lua

local tileMapClass = require "tilemap"

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

function gameModeRunClass.new(gameState)
  local self = setmetatable({}, gameModeRunClass)
  self.moduleName = "gameModeRunClass"
  self.gameState = gameState
  self.tileMap = tileMapClass.new({x = 220, y = 0})
  return self
end

function gameModeRunClass:load()

end

function gameModeRunClass:update(dt)
    
end

function gameModeRunClass:draw()
   self.tileMap:draw()
end

function gameModeRunClass:keypressed(key)
	if key == "4" then
		self.gameState:callGameModeAction(self.gameState.actionPlayerWin)
	elseif key == "2" then
		self.gameState:callGameModeAction(self.gameState.actionBadGuyContact)
	end
end

function gameModeRunClass.keyreleased(key)
end

function gameModeRunClass:mousepressed(x, y, button)
end

function gameModeRunClass:mousereleased(x, y, button)
end

return gameModeRunClass
