-- wall_tile.lua

local physicsClass = require "physics"

local wallTileClass = {}
wallTileClass.__index = wallTileClass

function wallTileClass.new(pos, dim)
   local self = setmetatable({}, wallTileClass)
   self.pos = pos
   self.dim = dim
   self.sprite = love.graphics.newImage("img/wall_tile.png")
   self.physics = physicsClass.new(pos,
				   {width = dim, 
				    height = dim})
   self.physics.fixture:setUserData("Wall")
   return self
end

function wallTileClass:draw()
   x, y = self.physics.body:getPosition()
   print("position: " .. x .. ", " .. y)
   love.graphics.draw(self.sprite, 
		      x, 
		      y, 
		      nil,
		      nil,
		      nil,
		      self.dim/2, 
		      self.dim/2)
end

return wallTileClass
