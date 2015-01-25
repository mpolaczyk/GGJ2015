-- game_mode_run.lua

local gameModeRunClass = {}
gameModeRunClass.__index = gameModeRunClass

local common = require "common"
local physicsClass = require "physics"
local coinClass = require "coin"
local playerSpeed = 100
local badGuySpeed = playerSpeed*2

local wallTileClass = require "wall_tile"

function gameModeRunClass.new(gameState, tileMap)
   local self = setmetatable({}, gameModeRunClass)
   self.moduleName = "gameModeRunClass"
   self.gameState = gameState
   self.tileMap = tileMap
   self.maxCoins = 3
   self.gameState.badGuyRespawn = false
   self.gameState.coinsToSpawn = self.maxCoins
   self.coins = {}
   return self
end

function gameModeRunClass:load()
	-- all assets are in common module now - flyweight
	local x_, y_ = love.mouse.getPosition()
	self.lastMousePos = {x = x_, y = y_}
end

function gameModeRunClass:update(dt)
   physicsClass.update(dt)

   for i=1,self.gameState.coinsToSpawn do
      self:spawnNewCoin()
   end
   self.gameState.coinsToSpawn = 0

   if (self.gameState.badGuyRespawn) then
      print("Trying to respawn bad guy.")
      local pos = self.gameState.tileMap:getPos(16, 19)
      self.gameState.player4.physics.body:setPosition(pos.x, pos.y)
      love.mouse.setPosition(pos.x, pos.y)
      self.gameState.badGuyRespawn = false
   end

   self:handleMouseInput()

   if (self.gameState:getPlayersScore() >= self.gameState.coinsToWin) then
      self.gameState.playersVictory = true
      self.gameState:callGameModeAction(self.gameState.actionEndGame)
   elseif (self.gameState:getBadGuyScore() >= self.gameState.catchesToWin) then
      self.gameState.badGuyVictory = true
      self.gameState:callGameModeAction(self.gameState.actionEndGame)
   end

end

function gameModeRunClass:draw()
	love.graphics.draw(common.backgroundMapImage, 0, 0, 0, 1, 1, 0, 0)

	-- draw left panel
	common.drawText("h2", "The Crew", 20, 30, 1346, "left", "black")
	love.graphics.draw(self.gameState.player1.image, 70, 120, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player2.image, 70, 260, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player3.image, 70, 380, 0, 0.5, 0.5)
	common.drawText("h1", self.gameState:getPlayersScore(), 70, 600, 1346, "left", "black")
	love.graphics.draw(common.coinUIImage, 90, 680, 0, 0.5, 0.5)
	
	-- draw right panel
	common.drawText("h2", "Evil Tom", 20, 30, 1326, "right", "black")
	love.graphics.draw(self.gameState.player4.image, 1200, 120, 0, 0.5, 0.5)
	common.drawText("h1", self.gameState:getBadGuyScore(), 1200, 600, 1346, "left", "black")
	love.graphics.draw(common.curseUIImage, 1200, 670, 0, 0.4, 0.4)

	self.tileMap:draw()

	-- draw coins
	for i=1,self.maxCoins do
	   if self.coins[i] then
	      self.coins[i]:draw()
	   end
	end

	-- draw game
	self.gameState.player1:draw()
	self.gameState.player2:draw()
	self.gameState.player3:draw()
	self.gameState.player4:draw()
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
end

function gameModeRunClass:mousereleased(x, y, button)
end

function gameModeRunClass:handleMouseInput()
   local epsilon = badGuySpeed*0.4
   local lastX, lastY = self.gameState.player4.physics.body:getPosition()
   local currX, currY = love.mouse.getPosition()
   local dX = currX - lastX
   local dY = currY - lastY
   local dirVectorLen = math.sqrt(dX^2 + dY^2)
   if dirVectorLen > epsilon then
      local dirUnitVec = {dX/dirVectorLen, dY/dirVectorLen}
      self.gameState.player4.physics.body:setLinearVelocity(
	 badGuySpeed*dirUnitVec[1], 
	 badGuySpeed*dirUnitVec[2]
      )
   end
   love.mouse.setPosition(lastX, lastY)
end

function gameModeRunClass:spawnNewCoin()
   local pos = self.tileMap:getRandomFreePosition()
   local newCoin = coinClass.new(pos, {width = 44, height = 44})
   for i=1,self.maxCoins do
      if self.coins[i] == nil then
	 self.coins[i] = newCoin
	 break
      end
   end
end

function gameModeRunClass:removeCoin(coin)
   for i=1,#self.coins do
      if self.coins[i] == coin then
	 self.coins[i]:destroy()
	 self.coins[i] = nil
      end
   end
end

return gameModeRunClass
