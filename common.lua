-- common.lua
local commonClass = {}

-- fonts
h0Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 94)
h1Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 74)
h2Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 64)
h3Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 54)
h4Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 44)
h5Font = love.graphics.newFont("font/Cardenio Modern Bold.ttf", 34)

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
	elseif style == "h5" then
		love.graphics.setFont(h5Font);
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

-- map params
commonClass.tileSize = 22

-- sprites
commonClass.backgroundImage = love.graphics.newImage("img/bg.png")
commonClass.backgroundRulesImage = love.graphics.newImage("img/bg_rules.png")
commonClass.backgroundMapImage = love.graphics.newImage("img/bg_map.png")
commonClass.backgroundCurseImage = love.graphics.newImage("img/bg_curse.png")
commonClass.enterImage = love.graphics.newImage("img/enter.png")
commonClass.titleImage = love.graphics.newImage("img/title.png")
commonClass.wsadImage = love.graphics.newImage("img/wsad.png")
commonClass.uhjkImage = love.graphics.newImage("img/uhjk.png")
commonClass.arrowsImage = love.graphics.newImage("img/strzalki.png")
commonClass.mouseImage = love.graphics.newImage("img/mouse.png")
commonClass.coinUIImage = love.graphics.newImage("img/coin_ui.png")
commonClass.curseUIImage = love.graphics.newImage("img/curse_ui.png")
commonClass.wall1TileImage = love.graphics.newImage("img/wall_1.png")
commonClass.wall2TileImage = love.graphics.newImage("img/wall_2.png")
commonClass.wall3TileImage = love.graphics.newImage("img/wall_3.png")
commonClass.pathTile = love.graphics.newImage("img/path_tile.png")

-- curses
function commonClass.getRandomCurse()
	return commonClass.curses[math.random(1, table.getn(commonClass.curses))]
end

commonClass.curses = 
{
	"Call your crush.",
	"Text \"I love you\" to your crush.",
	"Rage quit.",
	"Make out with someone.",
	
	"Drop down on your knees.",
	"Stand on your tip toes.",
	"Howl like a wolf.",
	"Giggle like a little girl.",
	"Breathe like a pervert.",
	"Improvise a song.",
	"Kiss random player every 10 sek.",
	"Meow like a cat.",
	"Yell like a Tarzan.",
	"Speak with russian accent.",
	
	"Put your left hand up in the air.",
	"Put your right hand up in the air.",
	"Put your left hand behind your head.",
	"Put your right hand behind your head.",
	"Put your left hand behind your back.",
	"Put your right hand behind your back.",
	"Stand on your left leg.",
	"Stand on your right leg.",
	"Close your left eye.",
	"Close your right eye.",
	
	"When someone picks a coin: Lick him.",
	"When someone picks a coin: Lick wall.",
	"When someone picks a coin: Lick screen.",
	"When someone picks a coin: Lick keyboard.",
	"When someone picks a coin: Twist your tits.",
	"When someone picks a coin: Smell your foot.",
	"When someone picks a coin: Suck your thumb.",
	"When someone picks a coin: Pull your ear.",
	"When someone picks a coin: Pull your nose.",
	"When someone picks a coin: Pull your hair.",

	"When someone is cursed: Lick him.",
	"When someone is cursed: Lick wall.",
	"When someone is cursed: Lick screen.",
	"When someone is cursed: Lick keyboard.",
	"When someone is cursed: Twist your tits.",
	"When someone is cursed: Smell your foot.",
	"When someone is cursed: Suck your thumb.",
	"When someone is cursed: Pull your ear.",
	"When someone is cursed: Pull your nose.",
	"When someone is cursed: Pull your hair."
}




return commonClass