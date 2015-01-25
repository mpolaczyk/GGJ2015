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
	-- all assets are in common module now - flyweight
end

function gameModePreClass:update(dt)
    
end

function gameModePreClass:draw()
	love.graphics.draw(common.background2Image, 0, 0, 0, 1, 1, 0, 0)
    
	-- event
	common.drawText("h2", "GLOBAL GAME JAM 2015 - POZNAN - POLAND", 0, 30, 1366, "center", "black")
	
	-- team
	common.drawText("h4", "The Team:", 50, 400, 1366, "left", "black")
	common.drawText("h4", "Joanna Wolska - Artist", 70, 450, 1366, "left", "black")
	common.drawText("h4", "Kasia Drabarek - Artist", 70, 500, 1366, "left", "black")
	common.drawText("h4", "Jacek Ciesla - Designer", 70, 550, 1366, "left", "black")
	common.drawText("h4", "Andrzej Drabarek - Developer", 70, 600, 1366, "left", "black")
	common.drawText("h4", "Marcin Polaczyk - Developer", 70, 650, 1366, "left", "black")
	
	-- tech specs
	common.drawText("h4", "Tech specs:", 580, 400, 1366, "left", "black")
	common.drawText("h4", "Framework - LOVE", 600, 450, 1366, "left", "black")
	common.drawText("h4", "Language - LUA", 600, 500, 1366, "left", "black")
	common.drawText("h4", "Graphics - Photoshop", 600, 550, 1366, "left", "black")
	common.drawText("h4", "Sounds - freesounds.org", 600, 600, 1366, "left", "black")
	common.drawText("h4", "Source control - GitHub", 600, 650, 1366, "left", "black")
	
	-- logo
	love.graphics.draw(common.titleImage, 160, 150)
	
	-- draw enter button
	love.graphics.draw(common.enterImage, 1200, 650, 0, 0.5, 0.5)
end

function gameModePreClass:keypressed(key)
	if key == "return" then
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
