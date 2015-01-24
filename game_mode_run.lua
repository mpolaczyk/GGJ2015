-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local tileMapClass = require "tilemap"
local physicsClass = require "physics"
local playerClass = require "player"
local tileSize = 22
local playerSpeed = 100

local wallTileClass = require "wall_tile"

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
   self.isLMBPressed = false
   local x_, y_ = love.mouse.getPosition()
   self.lastMousePos = {x = x_, y = y_}
end

function gameModeRunClass:update(dt)
   physicsClass.update(dt)
   if self.isLMBPressed then
      self:handleMouseInput()
   end
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
      self.player2.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "h" then
      self.player2.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "j" then
      self.player2.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "k" then
      self.player2.physics.body:setLinearVelocity(playerSpeed, 0)
   end
   
   -- Player 3
   if key == "up" then
      self.player3.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "left" then
      self.player3.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "down" then
      self.player3.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "right" then
      self.player3.physics.body:setLinearVelocity(playerSpeed, 0)
   end
end

function gameModeRunClass.keyreleased(key)
end

function gameModeRunClass:mousepressed(x, y, button)
   self.isLMBPressed = true
end

function gameModeRunClass:mousereleased(x, y, button)
   self.isLMBPressed = false
end

function gameModeRunClass:handleMouseInput()
   local lastX = self.lastMousePos.x
   local lastY = self.lastMousePos.y
   local currX, currY = love.mouse.getPosition()
   local tolerance = 75
   if lastX + tolerance < currX then
   -- left
      self.player4.physics.body:setLinearVelocity(playerSpeed, 0)
   elseif lastX > currX + tolerance then
   -- right
      self.player4.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif lastY + tolerance < currY then
   -- up
      self.player4.physics.body:setLinearVelocity(0, playerSpeed)
   elseif lastY > currY + tolerance then
   -- down
      self.player4.physics.body:setLinearVelocity(0, -playerSpeed)
   end
   self.lastMousePos.x = currX
   self.lastMousePos.y = currY
end

return gameModeRunClass
