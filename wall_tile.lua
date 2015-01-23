-- wall_tile.lua

local physicsClass = require "physics"

local wallTileClass = {}
wallTileclass.__index = wallTileClass

function wallTileClass.new(pos)
   local self = setmetatable({}, wallTileClass)
   self.pos = pos
   self.physics = physicsClass.new({x = 1, y = 2},
				   {width = 100, height = 100})
   return self
end
