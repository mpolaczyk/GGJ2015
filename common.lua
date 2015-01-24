-- common.lua
local commonClass = {}

-- fonts
h0Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 94)
h1Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 74)
h2Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 64)
h3Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 54)
h4Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 44)

-- map params
commonClass.tileSize = 22

-- sprites
commonClass.backgroundImage = love.graphics.newImage("img/bg.png")
commonClass.backgroundMapImage = love.graphics.newImage("img/bg_map.png")
commonClass.backgroundCloudImage = love.graphics.newImage("img/bg_curse.png")
commonClass.enterImage = love.graphics.newImage("img/enter.png")
commonClass.titleImage = love.graphics.newImage("img/title.png")
commonClass.wsadImage = love.graphics.newImage("img/wsad.png")
commonClass.uhjkImage = love.graphics.newImage("img/uhjk.png")
commonClass.arrowsImage = love.graphics.newImage("img/strzalki.png")
commonClass.mouseImage = love.graphics.newImage("img/mouse.png")
commonClass.coinUIImage = love.graphics.newImage("img/coin_ui.png")
	
	
function commonClass.drawText(style, text, x, y, limit, align, color)
	--save current
	local font = love.graphics.getFont()
	local r,g,b,a = love.graphics.getColor()
	
	-- draw
	if style == "h1" then
		love.graphics.setFont(h1Font);
	elseif style == "h2" then
		love.graphics.setFont(h2Font);
	elseif style == "h3" then
		love.graphics.setFont(h3Font);
	elseif style == "h4" then
		love.graphics.setFont(h4Font);
	elseif style == "h0" then
		love.graphics.setFont(h0Font);
	end
	if color == "white" then
		love.graphics.setColor(255,255,255)
	elseif color == "black" then
		love.graphics.setColor(0, 0, 0)
	elseif color == "red" then
		love.graphics.setColor(255, 0, 0)
	end
    love.graphics.printf(text, x, y, limit, align)
	
	-- restore
	love.graphics.setFont(font)
	love.graphics.setColor(r,g,b,a)
end


return commonClass