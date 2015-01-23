

function love.load()
   cat = love.graphics.newImage("cat.jpg")
  
   
end

function love.update(dt)
	
end

function love.draw()
	draw(cat,50, 200, 90)
	draw(cat,50, 50, -90)
	draw(cat,200, 50, 135)
	draw(cat,200, 200, 180)
end

function draw(image, _x, _y, _rot)
	local width = image:getWidth()
	local height = image:getHeight()
	love.graphics.draw(image, _x, _y, math.rad(_rot), 1, 1, width/2, height/2)
end