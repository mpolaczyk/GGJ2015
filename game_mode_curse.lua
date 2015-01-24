-- game_mode_curse.lua

local gameModeCurseClass = {}
gameModeCurseClass.__index = gameModeCurseClass

local common = require "common"

function gameModeCurseClass.new(gameState)
  local self = setmetatable({}, gameModeCurseClass)
  self.moduleName = "gameModeCurseClass"
  self.gameState = gameState
  return self
end

function gameModeCurseClass:load()
    self.backgroundImage = love.graphics.newImage("img/bg.png")
	self.enterImage = love.graphics.newImage("img/enter.png")
	
	-- players 
	self.playerAFace = love.graphics.newImage("img/player_a.png")
	self.playerBFace = love.graphics.newImage("img/player_b.png")
	self.playerCFace = love.graphics.newImage("img/player_c.png")
end

function gameModeCurseClass:update(dt)
    
end

function gameModeCurseClass:draw()
    love.graphics.draw(self.backgroundImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw caught player
	--love.graphics.draw(self.gameState.caughtPlayer.avatar, x, y)
	
	-- title
	common.drawText("h2", "One of your companions was caught !", 0, 20, 1366, "center", "black")
	common.drawText("h4", "What do you do now ?", 0, 90, 1366, "center", "black")
	common.drawText("h4", "Choose an option for ONE of you !", 0, 160, 1366, "center", "black")
	
	-- faces
	love.graphics.draw(self.playerAFace, 50, 200, 0, 0.5, 0.5)
	love.graphics.draw(self.playerBFace, 50, 370, 0, 0.5, 0.5)
	love.graphics.draw(self.playerCFace, 50, 540, 0, 0.5, 0.5)
	
	-- curses
	common.drawText("h4", self.gameState.nextCurseA, 200, 250, 1066, "left", "black")
	common.drawText("h4", self.gameState.nextCurseB, 200, 420, 1066, "left", "black")
	common.drawText("h4", self.gameState.nextCurseC, 200, 590, 1066, "left", "black")
	
	-- draw enter button
	common.drawText("h4", "Continue...", 0, 590, 1340, "right", "black")
	love.graphics.draw(self.enterImage, 1200, 650, 0, 0.5, 0.5)
end

function gameModeCurseClass:keypressed(key)
	if key == "1" or key == "2" or key == "3" or key == "return" then
		self.gameState:callGameModeAction(self.gameState.actionCurseResult)
	end
end

function gameModeCurseClass.keyreleased(key)
end

function gameModeCurseClass:mousepressed(x, y, button)
end

function gameModeCurseClass:mousereleased(x, y, button)
	self.playerDReady = true
end

return gameModeCurseClass
