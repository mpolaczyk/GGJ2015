-- path_tile.lua

local pathTileClass = {}
pathTileClass.__index = pathTileClass

function pathTileClass.new(pos, dim)
   local self = setmetatable({}, pathTileClass)
   self.sprite = love.graphics.newImage("img/path_tile.png")
   self.pos = pos
   self.dim = dim
   return self
end

function pathTileClass:draw()
   scale = {self.dim/self.sprite:getWidth(), self.dim/self.sprite:getHeight()}
   love.graphics.draw(self.sprite, 
		      self.pos.x, 
		      self.pos.y, 
		      nil,
		      scale[1],
		      scale[2],
		      nil, 
		      nil)
end

return pathTileClass
