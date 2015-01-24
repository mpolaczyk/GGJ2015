-- game_mode_start.lua

local gameModeStartClass = {}
gameModeStartClass.__index = gameModeStartClass


function gameModeStartClass.new(gameState)
	local self = setmetatable({}, gameModeStartClass)
	self.moduleName = "gameModeStartClass"
	self.gameState = gameState
  
	self.playerAReady = false
	self.playerBReady = false
	self.playerCReady = false
	self.playerDReady = false
  
	self.counterDigit = 3;
	self.counterMax = 4.0;
	self.counterCurrent = 0.0;
  
	return self
end

function gameModeStartClass:load()
    self.playerAPane = love.graphics.newImage("img/wsad.png")
	self.playerBPane = love.graphics.newImage("img/uhjk.png")
	self.playerCPane = love.graphics.newImage("img/strzalki.png")
	self.playerDPane = love.graphics.newImage("img/mouse.png")
	self.playerAFace = love.graphics.newImage("img/blue.png")
	self.playerBFace = love.graphics.newImage("img/red.png")
	self.playerCFace = love.graphics.newImage("img/yellow.png")
	self.playerDFace = love.graphics.newImage("img/evil.png")
end

function gameModeStartClass:update(dt)
    
	-- check if game mode done
	if self.playerAReady and self.playerBReady and self.playerCReady and self.playerDReady then
	   self.counterCurrent = self.counterCurrent + dt
	end
	
	-- change game mode
	if self.counterCurrent >= self.counterMax then
	   self.gameState:callGameModeAction(self.gameState.actionAllReady)
	end
end


function gameModeStartClass:draw()
	
	-- draw player panels
	self:drawPlayerPanel(50, 50, self.playerAPane, self.playerAFace, self.playerAReady)
	self:drawPlayerPanel(500, 50, self.playerBPane, self.playerBFace, self.playerBReady)
	self:drawPlayerPanel(950, 50, self.playerCPane, self.playerCFace, self.playerCReady)
	self:drawPlayerPanel(500, 400, self.playerDPane, self.playerDFace, self.playerDReady)
	
	-- draw counter
	if self.counterCurrent > 0 then
	   love.graphics.setNewFont(220)
	   love.graphics.setColor(255, 0, 0)
	   local val = math.floor(self.counterMax - self.counterCurrent)
	   if (val > 0) then
	      love.graphics.printf(val, 0, 275, 1366, 'center')
	   else
	      love.graphics.printf("START", 0, 275, 1366, 'center')
	   end
	   love.graphics.setColor(255, 255, 255)
	   love.graphics.setNewFont(12)
	end
end

function gameModeStartClass:keypressed(key)
	-- detect keyboard keys
	if key == "w" or key == "w" or key == "a" or key == "d" then
		self.playerAReady = true
	elseif key == "u" or key == "j" or key == "j" or key == "k" then
		self.playerBReady = true
	elseif key == "up" or key == "down" or key == "left" or key == "right" then
		self.playerCReady = true
	end
end

function gameModeStartClass:mousepressed(x, y, button)
end

function gameModeStartClass:mousereleased(x, y, button)
	self.playerDReady = true
end

function gameModeStartClass:drawPlayerPanel(x, y, panelImage, faceImage, ifReady)
	-- draw panels
	love.graphics.draw(panelImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw faces
	love.graphics.draw(faceImage, x+150, y+100, 0, 1, 1, 0, 0)
	
	-- save current color
	local r, g, b, a = love.graphics.getColor( )
	
	-- draw texts
	if ifReady then
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.print("READY!", x+220, y+190, 0, 2, 2)
	else
		love.graphics.setColor(0, 255, 0, 255)
		love.graphics.print("HIT A KEY!", x+220, y+190, 0, 2, 2)
	end
	
	 -- restore colors
	love.graphics.setColor(r,g,b,a)
end

return gameModeStartClass
