-- game_mode_start.lua

local gameModeStartClass = {}
gameModeStartClass.__index = gameModeStartClass

local common = require "common"

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
	self.backgroundImage = love.graphics.newImage("img/bg.png")
    self.playerAPane = love.graphics.newImage("img/wsad.png")
	self.playerBPane = love.graphics.newImage("img/uhjk.png")
	self.playerCPane = love.graphics.newImage("img/strzalki.png")
	self.playerDPane = love.graphics.newImage("img/mouse.png")
	self.playerAFace = love.graphics.newImage("img/player_a.png")
	self.playerBFace = love.graphics.newImage("img/player_b.png")
	self.playerCFace = love.graphics.newImage("img/player_c.png")
	self.playerDFace = love.graphics.newImage("img/player_d.png")
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
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
	-- draw player panels
	self:drawPlayerPanel(30, 230, self.playerAPane, self.playerAFace, self.playerAReady)
	self:drawPlayerPanel(480, 230, self.playerBPane, self.playerBFace, self.playerBReady)
	self:drawPlayerPanel(930, 230, self.playerCPane, self.playerCFace, self.playerCReady)
	self:drawPlayerPanel(480, 500, self.playerDPane, self.playerDFace, self.playerDReady)
	
	-- draw counter
	if self.counterCurrent > 0 then
		local val = math.floor(self.counterMax - self.counterCurrent)
		if (val > 0) then
			common.drawText("h0", val, 0, 275, 1366, "center", "red")
		else
			common.drawText("h0", "START", 0, 275, 1366, "center", "red")
		end
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

function gameModeStartClass.keyreleased(key)
end

function gameModeStartClass:mousepressed(x, y, button)
	self.playerDReady = true
end

function gameModeStartClass:mousereleased(x, y, button)
end

function gameModeStartClass:drawPlayerPanel(x, y, panelImage, faceImage, ifReady)

	-- draw texts
	if ifReady then
		love.graphics.draw(faceImage, x+150, y-200, 0, 0.8, 0.8)
	end
		
	-- draw panels
	love.graphics.draw(panelImage, x, y, 0, 1, 1, 0, 0)
end

return gameModeStartClass
