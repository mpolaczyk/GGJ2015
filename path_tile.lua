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
   love.graphics.draw(self.sprite, 
		      self.pos.x, 
		      self.pos.y, 
		      nil,
		      nil,
		      nil,
		      self.dim/2, 
		      self.dim/2)
end

return pathTileClass
