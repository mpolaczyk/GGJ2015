-- player.lua

local common = require "common"

local physicsClass = require "physics"

local playerClass = {}
playerClass.__index = playerClass

function playerClass.new(avatarPath, 
			 imagePath,
			 pos, 
			 size, 
			 name,
			 gameState)
  local self = setmetatable({}, playerClass)
  self.sprite = love.graphics.newImage(avatarPath)
  self.image = love.graphics.newImage(imagePath)
  self.size = size
  self.name = name
  local hitbox_size = {width = self.size.width*0.4,
		       height = self.size.width*0.4}
  self.physics = physicsClass.new(pos,
				  hitbox_size, 
				  self,
				  "dynamic")
  self.physics.body:setFixedRotation(true)
  self.score = 0
  self.gameState = gameState
  return self
end

function playerClass:draw()
   local x, y = self.physics.body:getPosition()
   local scale = {self.size.width/self.sprite:getWidth(),
		  self.size.height/self.sprite:getHeight()}
   love.graphics.draw(self.sprite, 
		      x-12, -- hardcoded offset for hit box
		      y-12, 
		      nil,
		      scale[1],
		      scale[2],
		      nil, 
		      nil)
end

function playerClass:onCollision(other)
   if (other.name) then
      if (other.name == "BadGuy") then
	 other.score = other.score + 1
	 if (other.score < self.gameState.catchesToWin) then
	    self.gameState:callGameModeAction(self.gameState.actionBadGuyContact)
	 end
	 self.gameState.badGuyRespawn = true
	 if (self.name == "Knight") then
	    love.audio.play(common.catchKnightSound)
	 elseif self.name == "Princess" then
	    love.audio.play(common.catchPrincessSound)
	 elseif self.name == "Peasant" then
	    love.audio.play(common.catchPeasantSound)
	 end
      elseif other.name == "Coin" then
	 if self.name ~= "BadGuy" then
	    self.score = self.score + 1
	    self.gameState.currentGameMode:removeCoin(other)
	    self.gameState.coinsToSpawn = self.gameState.coinsToSpawn + 1
	    love.audio.play(common.coinCollectedSound)
	 end
      end
   end
end

function playerClass:destroy()
   self.physics.body:destroy()
end

return playerClass
