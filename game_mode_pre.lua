-- game_mode_pre.lua

local gameModePreClass = {}
gameModePreClass.__index = gameModePreClass

local common = require "common"

function gameModePreClass.new(gameState)
  local self = setmetatable({}, gameModePreClass)
  self.moduleName = "gameModePreClass"
  self.gameState = gameState
  return self
end

function gameModePreClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
	self.enterImage = love.graphics.newImage("img/enter.png")
	self.titleImage = love.graphics.newImage("img/title.png")
	
end

function gameModePreClass:update(dt)
    
end

function gameModePreClass:draw()
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
    
	-- event
	common.drawText("h2", "GLOBAL GAME JAM 2015 - POZNAN - POLAND", 0, 20, 1366, "center", "black")
	
	-- team
	common.drawText("h4", "The Team:", 50, 400, 1366, "left", "black")
	common.drawText("h4", "Joanna Wolska - Artist", 70, 450, 1366, "left", "black")
	common.drawText("h4", "Kasia Drabarek - Artist", 70, 500, 1366, "left", "black")
	common.drawText("h4", "Jacek Ciesla - Designer", 70, 550, 1366, "left", "black")
	common.drawText("h4", "Andrzej Drabarek - Developer", 70, 600, 1366, "left", "black")
	common.drawText("h4", "Marcin Polaczyk - Developer", 70, 650, 1366, "left", "black")
	
	-- tech specs
	common.drawText("h4", "Tech specs:", 520, 400, 1366, "left", "black")
	common.drawText("h4", "Framework - LOVE", 540, 450, 1366, "left", "black")
	common.drawText("h4", "Language - LUA", 540, 500, 1366, "left", "black")
	common.drawText("h4", "Graphics - Photoshop", 540, 550, 1366, "left", "black")
	common.drawText("h4", "Sounds - freesounds.org", 540, 600, 1366, "left", "black")
	common.drawText("h4", "Source control - GitHub", 540, 650, 1366, "left", "black")
	
	-- logo
	love.graphics.draw(self.titleImage, 160, 150)
	
	-- draw space button
	common.drawText("h4", "Hit enter to continue...", 950, 500, 1366, "left", "black")
	love.graphics.draw(self.enterImage, 1050, 600, 0, 0.5, 0.5)
end

function gameModePreClass:keypressed(key)
	if key == "space" then
		self.gameState:callGameModeAction(self.gameState.actionRules)
	end
end

function gameModePreClass.keyreleased(key)
end

function gameModePreClass:mousepressed(x, y, button)
end

function gameModePreClass:mousereleased(x, y, button)
end

return gameModePreClass
