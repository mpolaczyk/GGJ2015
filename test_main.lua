local pathTileClass = require "path_tile"
local wallTileClass = require "wall_tile"

function love.load()
   pathTileInstance = pathTileClass.new({x = 0, y = 0}, 40)
   wallTileInstance = wallTileClass.new({x = 40, y = 40}, 40)
end

function love.draw()
   pathTileInstance:draw()
   wallTileInstance:draw()
end
