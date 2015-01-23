local pathTileClass = require "path_tile"

function love.load()
   tileInstance = pathTileClass.new({x = 0, y = 0.1})
end

function love.draw()
   love.graphics.print(tileInstance.physics.body:getLinearVelocity(), 
		       300, 
		       300)
end
