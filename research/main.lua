require "input.lua"

local text

function love.load()
   love.graphics.setNewFont(12)
   text = "Blablabla"
end

function love.update(dt)
end

function love.draw()
   love.graphics.print(text, 330, 300)
end

function love.keypressed(key)
   if key == "d" then
      text = "D pressed!"
   end
   if key == "left" then
      text = "Left pressed!"
   end
end

function love.keyreleased(key)
   if key == "right" then
      text = "Right released!"
   end
end

function love.mousepressed(x, y, button)
   if button == "l" then
      text = "left mouse pressed in location " .. x .. " " .. y
   end 
end

function love.mousereleased(x, y, button)
end
