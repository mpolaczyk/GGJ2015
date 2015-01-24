-- game_mode_rules.lua

local gameModeRulesClass = {}
gameModeRulesClass.__index = gameModeRulesClass

local common = require "common"

function gameModeRulesClass.new(gameState)
  local self = setmetatable({}, gameModeRulesClass)
  self.moduleName = "gameModeRulesClass"
  self.gameState = gameState
  return self
end

function gameModeRulesClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
	self.enterImage = love.graphics.newImage("img/enter.png")
	self.playerAImage = love.graphics.newImage("img/player_a.png")
	self.playerBImage = love.graphics.newImage("img/player_b.png")
	self.playerCImage = love.graphics.newImage("img/player_c.png")
	self.playerDImage = love.graphics.newImage("img/player_d.png")
end

function gameModeRulesClass:update(dt)
    
end

function gameModeRulesClass:draw()
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
	-- event
	common.drawText("h2", "Rules", 50, 30, 1366, "left", "black")
	
	-- players avatars
	love.graphics.draw(self.playerAImage, 50, 170, 0, 0.5, 0.5)
	love.graphics.draw(self.playerBImage, 200, 170, 0, 0.5, 0.5)
	love.graphics.draw(self.playerCImage, 350, 170, 0, 0.5, 0.5)
	love.graphics.draw(self.playerDImage, 650, 170, 0, 0.5, 0.5)
	
	-- players rules
	common.drawText("h4", "Players rules:", 50, 300, 1366, "left", "black")
	common.drawText("h4", " Rule 1", 70, 350, 1366, "left", "black")
	common.drawText("h4", " Rule 2", 70, 400, 1366, "left", "black")
	common.drawText("h4", " Rule 3", 70, 450, 1366, "left", "black")
	common.drawText("h4", " Rule 4", 70, 500, 1366, "left", "black")
	
	-- bad guy rules
	common.drawText("h4", "Bad guy rules:", 650, 300, 1366, "left", "black")
	common.drawText("h4", " Rule 1", 670, 350, 1366, "left", "black")
	common.drawText("h4", " Rule 2", 670, 400, 1366, "left", "black")
	common.drawText("h4", " Rule 3", 670, 450, 1366, "left", "black")
	common.drawText("h4", " Rule 4", 670, 500, 1366, "left", "black")
	
    -- draw enter button
	common.drawText("h4", "To continue, hit:", 0, 590, 1366, "right", "black")
	love.graphics.draw(self.enterImage, 1200, 650, 0, 0.5, 0.5)
end

function gameModeRulesClass:keypressed(key)
	if key == "return" then
		self.gameState:callGameModeAction(self.gameState.actionStart)
	end
end

function gameModeRulesClass.keyreleased(key)
end

function gameModeRulesClass:mousepressed(x, y, button)
end

function gameModeRulesClass:mousereleased(x, y, button)
end

return gameModeRulesClass
