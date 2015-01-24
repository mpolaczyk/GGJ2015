-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local tileMapClass = require "tilemap"
local physicsClass = require "physics"
local playerClass = require "player"
local tileSize = 22
local playerSpeed = 100

function gameModeRunClass.new(gameState)
  local self = setmetatable({}, gameModeRunClass)
  self.moduleName = "gameModeRunClass"
  self.gameState = gameState
  return self
end

function gameModeRunClass:load()
   physicsClass.init()
   self.tileMap = tileMapClass.new({x = 220, y = 0}, 22)
   self.player1 = playerClass.new("img/blue.png", {x = 0, y = 0},
				  {width = tileSize*2, height = tileSize*2})
   -- debug begin
   local x, y = self.player1.physics.body:getPosition()
   print("Physics location: " .. x .. ", " .. y)
   -- debug end

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
   -- TEMP BEGIN
   if key == "4" then
      self.gameState:callGameModeAction(self.gameState.actionEndGame)
   elseif key == "2" then
      self.gameState:callGameModeAction(self.gameState.actionBadGuyContact)
   end
   -- TEMP END

   -- Player 1
   if key == "w" then
      self.player1.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "a" then
      self.player1.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "s" then
      self.player1.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "d" then
      self.player1.physics.body:setLinearVelocity(playerSpeed, 0)
   end
   
   -- Player 2
   if key == "u" then
   elseif key == "h" then
   elseif key == "j" then
   elseif key == "k" then
   end
   
   -- Player 3
   if key == "up" then
   elseif key == "left" then
   elseif key == "down" then
   elseif key == "right" then
   end
end

function gameModeRunClass.keyreleased(key)
end

function gameModeRunClass:mousepressed(x, y, button)
end

function gameModeRunClass:mousereleased(x, y, button)
end

return gameModeRunClass
