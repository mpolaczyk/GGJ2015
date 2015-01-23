function love.load()
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
   if (key == "k") then
      love.event.push(2)
   end
end
