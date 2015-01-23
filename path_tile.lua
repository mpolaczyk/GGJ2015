-- path_tile.lua


local pathTileClass = {}
pathTileClass.__index = pathTileClass

function pathTileClass.new(pos)
   local self = setmetatable({}, pathTileClass)
   self.sprite = nil -- TODO
   self.pos = pos
   return self
end

return pathTileClass
