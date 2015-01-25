-- wall_tile.lua

local physicsClass = require "physics"

local wallTileClass = {}
wallTileClass.__index = wallTileClass

function wallTileClass.new(pos, dim)
   local self = setmetatable({}, wallTileClass)
   self.pos = pos
   self.dim = dim
   self.name = "Wall"
   self.sprite = love.graphics.newImage("img/wall_tile.png")
   self.physics = physicsClass.new(pos,
				   {width = dim, 
				    height = dim},
				    self)
   return self
end

function wallTileClass:draw()
   local x, y = self.physics.body:getPosition()
   scale = {self.dim/self.sprite:getWidth(), self.dim/self.sprite:getHeight()}
   love.graphics.draw(self.sprite, 
		      x + self.dim*0.5, 
		      y + self.dim*0.5, 
		      nil,
		      scale[1],
		      scale[2],
		      nil, 
		      nil)
end

function wallTileClass:onCollision(other)
end

return wallTileClass
