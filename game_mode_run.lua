-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local common = require "common"
local physicsClass = require "physics"
local playerSpeed = 100

local wallTileClass = require "wall_tile"

function gameModeRunClass.new(gameState, tileMap)
  local self = setmetatable({}, gameModeRunClass)
  self.moduleName = "gameModeRunClass"
  self.gameState = gameState
  self.tileMap = tileMap
  return self
end

function gameModeRunClass:load()
	-- all assets are in common module now - flyweight
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
	love.graphics.draw(common.backgroundMapImage, 0, 0, 0, 1, 1, 0, 0)
	
	-- draw game
	self.tileMap:draw()
	self.gameState.player1:draw()
	self.gameState.player2:draw()
	self.gameState.player3:draw()
	self.gameState.player4:draw()
	
	-- draw left panel
	common.drawText("h1", "Players", 20, 30, 1346, "left", "black")
	love.graphics.draw(self.gameState.player1.image, 70, 120, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player2.image, 70, 260, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player3.image, 70, 380, 0, 0.5, 0.5)
	common.drawText("h1", self.gameState:getPlayersScore(), 70, 600, 1346, "left", "black")
	love.graphics.draw(common.coinUIImage, 70, 700, 0, 0.5, 0.5)
	
	-- draw right panel
	common.drawText("h1", "Bad Guy", 20, 30, 1326, "right", "black")
	love.graphics.draw(self.gameState.player4.image, 1200, 120, 0, 0.5, 0.5)
	common.drawText("h1", self.gameState:getBadGuyScore(), 1200, 600, 1346, "left", "black")
	
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
      self.gameState.player1.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "a" then
      self.gameState.player1.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "s" then
      self.gameState.player1.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "d" then
      self.gameState.player1.physics.body:setLinearVelocity(playerSpeed, 0)
   end
   
   -- Player 2
   if key == "u" then
      self.gameState.player2.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "h" then
      self.gameState.player2.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "j" then
      self.gameState.player2.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "k" then
      self.gameState.player2.physics.body:setLinearVelocity(playerSpeed, 0)
   end
   
   -- Player 3
   if key == "up" then
      self.gameState.player3.physics.body:setLinearVelocity(0, -playerSpeed)
   elseif key == "left" then
      self.gameState.player3.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif key == "down" then
      self.gameState.player3.physics.body:setLinearVelocity(0, playerSpeed)
   elseif key == "right" then
      self.gameState.player3.physics.body:setLinearVelocity(playerSpeed, 0)
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
   local tolerance = 20
   if lastX + tolerance < currX then
      self.gameState.player4.physics.body:setLinearVelocity(playerSpeed, 0)
   elseif lastX > currX + tolerance then
      self.gameState.player4.physics.body:setLinearVelocity(-playerSpeed, 0)
   elseif lastY + tolerance < currY then
      self.gameState.player4.physics.body:setLinearVelocity(0, playerSpeed)
   elseif lastY > currY + tolerance then
      self.gameState.player4.physics.body:setLinearVelocity(0, -playerSpeed)
   end
   self.lastMousePos.x = currX
   self.lastMousePos.y = currY
end

return gameModeRunClass
