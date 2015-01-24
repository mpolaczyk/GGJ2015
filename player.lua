-- player.lua

local physicsClass = require "physics"

local playerClass = {}
playerClass.__index = playerClass

function playerClass.new(avatarPath, pos, size, name)
  local self = setmetatable({}, playerClass)
  self.sprite = love.graphics.newImage(avatarPath)
  self.size = size
  self.name = name
  local hitbox_size = {width = self.size.width*0.5,
		       height = self.size.width*0.5}
  self.physics = physicsClass.new(pos,
				  hitbox_size, 
				  self,
				  "dynamic")
  self.physics.body:setFixedRotation(true)
  self.score = 0
  return self
end

function playerClass:draw()
   local x, y = self.physics.body:getPosition()
   local scale = {self.size.width/self.sprite:getWidth(),
		  self.size.height/self.sprite:getHeight()}
   love.graphics.draw(self.sprite, 
		      x, 
		      y, 
		      nil,
		      scale[1],
		      scale[2],
		      nil, 
		      nil)
end

function playerClass:onCollision(other)
   if (other.name) then
      if (other.name == "BadGuy") then
	 print("Ooops, bad guy cought someone!")
      end
   end
end

return playerClass
