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
   -- all assets are in common module now - flyweight
end

function gameModeCurseClass:update(dt)
    
end

function gameModeCurseClass:draw()
    love.graphics.draw(common.backgroundCurseImage, x, y, 0, 1, 1, 0, 0)
	
	-- title
	common.drawText("h2", "One of your companions was caught !", 0, 20, 1366, "center", "black")
	common.drawText("h4", "What do you do now ?", 0, 90, 1366, "center", "black")
	common.drawText("h4", "Apply ONE curse on ONE of you !", 0, 160, 1366, "center", "black")
	
	-- options
	-- curses
	common.drawText("h4", "Option 1: ", 70, 250, 1066, "left", "black")
	common.drawText("h4", "Option 2: ", 70, 420, 1066, "left", "black")
	common.drawText("h4", "Option 3: ", 70, 590, 1066, "left", "black")
	
	-- faces
	love.graphics.draw(self.gameState.player1.image, 230, 200, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player2.image, 230, 370, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player3.image, 230, 540, 0, 0.5, 0.5)
	
	-- curses
	common.drawText("h4", self.gameState.nextCurseA, 370, 250, 1066, "left", "black")
	common.drawText("h4", self.gameState.nextCurseB, 370, 420, 1066, "left", "black")
	common.drawText("h4", self.gameState.nextCurseC, 370, 590, 1066, "left", "black")
	
	-- draw enter button
	love.graphics.draw(common.enterImage, 1200, 650, 0, 0.5, 0.5)
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
