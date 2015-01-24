
local gs = require "game_state"

GS = nil

function love.load()
   GS = gs.new()
   love.window.setMode(1366, 768, {fullscreen=true})
end


function love.update(dt)
   -- push execution to current game mode
   GS.currentGameMode:update(dt)
end


function love.draw()
   -- push execution to current game mode
   GS.currentGameMode:draw()
end

function love.keypressed(key)
   -- push execution to current game mode
   GS.currentGameMode:keypressed(key)
end

function love.mousepressed(x, y, button)
   GS.currentGameMode:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
   GS.currentGameMode:mousereleased(x, y, button)
end
