-- coin.lua

local physicsClass = require "physics"

local coinClass = {}
coinClass.__index = coinClass

function coinClass.new(pos, size)
  local self = setmetatable({}, coinClass)
  self.sprite = love.graphics.newImage("img/coin.png")
  self.size = size
  self.name = "Coin"
  local hitbox_size = {width = self.size.width*0.5,
		       height = self.size.height *0.5}
  self.physics = physicsClass.new(pos,
				  hitbox_size, 
				  self,
				  "dynamic")
  self.physics.body:setFixedRotation(true)
  self.score = 0
  return self
end

function coinClass:draw()
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

function coinClass:destroy()
   self.physics.body:destroy()
end

function coinClass:onCollision()
end

return coinClass
