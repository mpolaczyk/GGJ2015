-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local tileMapClass = require "tilemap"
local physicsClass = require "physics"
local tileSize = 22

function gameModeRunClass.new(gameState)
  local self = setmetatable({}, gameModeRunClass)
  self.moduleName = "gameModeRunClass"
  self.gameState = gameState
  return self
end

function gameModeRunClass:load()
   physicsClass.init()
   self.tileMap = tileMapClass.new({x = 220, y = 0}, 22)
end

function gameModeRunClass:update(dt)
   physicsClass.update(dt)
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

function gameModeRunClass:mousepressed(x, y, button)
end

function gameModeRunClass:mousereleased(x, y, button)
end

return gameModeRunClass
