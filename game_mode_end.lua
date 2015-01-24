-- game_mode_end.lua

local gameModeEndClass = {}
gameModeEndClass.__index = gameModeEndClass

local common = require "common"

function gameModeEndClass.new(gameState)
  local self = setmetatable({}, gameModeEndClass)
  self.moduleName = "gameModeEndClass"
  self.gameState = gameState
  return self
end

function gameModeEndClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
	
	-- players 
    self.playerAFace = love.graphics.newImage("img/player_a.png")
	self.playerBFace = love.graphics.newImage("img/player_b.png")
	self.playerCFace = love.graphics.newImage("img/player_c.png")
	
	-- bad guy
	self.playerDFace = love.graphics.newImage("img/player_d.png")
end

function gameModeEndClass:update(dt)
    
end

function gameModeEndClass:draw()
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
	common.drawText("h1", "Victory !", 0, 50, 1366, "center", "black")
	
	if self.gameState.playersVictory then
		-- faces
		love.graphics.draw(self.playerAFace, 130, 400)
		love.graphics.draw(self.playerBFace, 550, 400)
		love.graphics.draw(self.playerCFace, 1000, 400)
		-- text
		common.drawText("h2", "You've collected required amount of gold !", 0, 200, 1366, "center", "black")
	elseif self.gameState.badGuyVictory then
		-- face
		love.graphics.draw(self.playerDFace, 550, 400)
		-- text
		common.drawText("h2", "You've caught players required number of times !", 0, 200, 1366, "center", "black")
	end
end

function gameModeEndClass:keypressed(key)
end

function gameModeEndClass.keyreleased(key)
end

function gameModeEndClass:mousepressed(x, y, button)
end

function gameModeEndClass:mousereleased(x, y, button)
end

return gameModeEndClass
