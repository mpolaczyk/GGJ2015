local text

function custom_event(a, b, c, d)
   print("CUSTOM EVENT FIRED")
end

function love.load()
   text = "Nothing happened."
   love.handlers["custom"] = custom_event
end

function love.update(dt)
   for e, a, b, c, d in love.event.poll() do
      if e == "custom" then
	 text = "Event cought"
      end
   end
end

function love.draw()
   love.graphics.print(text, 300, 300)
end

function love.keypressed(key)
   a = custom_event
   if (key == "k") then
      love.event.push("custom")
   end
end
