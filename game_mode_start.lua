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
	-- all assets are in common module now - flyweight
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
	love.graphics.draw(common.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
	-- draw player panels
	self:drawPlayerPanel(30, 230, common.wsadImage,  self.gameState.player1.image, self.playerAReady)
	self:drawPlayerPanel(480, 230, common.uhjkImage, self.gameState.player2.image, self.playerBReady)
	self:drawPlayerPanel(930, 230, common.arrowsImage, self.gameState.player3.image, self.playerCReady)
	self:drawPlayerPanel(480, 500, common.mouseImage, self.gameState.player4.image, self.playerDReady)
	
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
