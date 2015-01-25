-- wall_tile.lua

local physicsClass = require "physics"
local common = require "common"

local wallTileClass = {}
wallTileClass.__index = wallTileClass

function wallTileClass.new(pos, dim)
   local self = setmetatable({}, wallTileClass)
   self.pos = pos
   self.dim = dim
   self.name = "Wall"
   local x = math.random(1,3)
   if x == 1 then
		self.sprite = common.wall1TileImage
   elseif x == 2 then
		self.sprite = common.wall2TileImage
   else
		self.sprite = common.wall3TileImage
   end
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
