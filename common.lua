-- common.lua
local commonClass = {}

-- fonts
h1Font = love.graphics.newFont("font/Amburegul.ttf", 54);
h2Font = love.graphics.newFont("font/Amburegul.ttf", 44);
h3Font = love.graphics.newFont("font/Amburegul.ttf", 34);
h4Font = love.graphics.newFont("font/Amburegul.ttf", 24);


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
	end
	if color == "white" then
		love.graphics.setColor(255,255,255)
	elseif color == "black" then
		love.graphics.setColor(0, 0, 0)
	end
    love.graphics.printf(text, x, y, limit, align)
	
	-- restore
	love.graphics.setFont(font)
	love.graphics.setColor(r,g,b,a)
end

function commonClass.drawH1(text, x, y, limit, align)
	
end



return commonClass