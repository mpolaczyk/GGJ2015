-- player.lua

local playerClass = {}
playerClass.__index = playerClass

function playerClass.new(avatarPath, pos, size)
  local self = setmetatable({}, playerClass)
  self.sprite = love.graphics.newImage(avatarPath)
  self.size = size
  self.physics = physicsClass.new(pos,
				  size, 
				  "Player",
				  "dynamic")
  self.score = 0
  return self
end

function playerClass:draw()
   local x, y = self.physics.body:getPosition()
   local scale = {self.size.x/self.sprite.getWidth(),
		  self.size.y/self.sprite.getHeight()}
   love.graphics.draw(self.sprite, 
		      x, 
		      y, 
		      nil,
		      scale[1],
		      scale[2],
		      self.size/2, 
		      self.size/2)
end

return playerClass
