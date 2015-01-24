-- wall_tile.lua

local physicsClass = require "physics"

local wallTileClass = {}
wallTileClass.__index = wallTileClass

function wallTileClass.new(pos, dim)
   local self = setmetatable({}, wallTileClass)
   self.pos = pos
   self.dim = dim
   self.sprite = love.graphics.newImage("img/wall_tile.png")
   self.physics = physicsClass.new({x = 1, y = 2},
				   {width = 100, height = 100})
   return self
end

function wallTileClass:draw()
   love.graphics.draw(self.sprite, 
		      self.pos.x, 
		      self.pos.y, 
		      nil,
		      nil,
		      nil,
		      self.dim/2, 
		      self.dim/2)
end

return wallTileClass
