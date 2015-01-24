-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local tileMapClass = require "tilemap"
local physicsClass = require "physics"
local playerClass = require "player"
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
   self.player1 = playerClass.new("img/blue.png", self.tileMap:getPos(4, 4),
				  {width = tileSize*2, height = tileSize*2})
   self.player2 = playerClass.new("img/red.png", self.tileMap:getPos(4, 6),
				  {width = tileSize*2, height = tileSize*2})
   self.player3 = playerClass.new("img/yellow.png", self.tileMap:getPos(4, 8),
				  {width = tileSize*2, height = tileSize*2})
   self.player4 = playerClass.new("img/evil.png", self.tileMap:getPos(4, 10),
				  {width = tileSize*2, height = tileSize*2})
end

function gameModeRunClass:update(dt)
   physicsClass.update(dt)
end

function gameModeRunClass:draw()
   self.tileMap:draw()
   self.player1:draw()
   self.player2:draw()
   self.player3:draw()
   self.player4:draw()
end

function gameModeRunClass:keypressed(key)
   if key == "4" then
      self.gameState:callGameModeAction(self.gameState.actionEndGame)
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
