
function love.load()
   cat = love.graphics.newImage("cat.jpg")
   x = 50
   y = 50
end

function love.draw()
   love.graphics.draw(cat, x, y)
end