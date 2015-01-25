-- game_mode_rules.lua

local gameModeRulesClass = {}
gameModeRulesClass.__index = gameModeRulesClass

local common = require "common"

function gameModeRulesClass.new(gameState)
  local self = setmetatable({}, gameModeRulesClass)
  self.moduleName = "gameModeRulesClass"
  self.gameState = gameState

  self.counterMax = 5.0
  self.counterBlockInput = 2.0
  self.counterCurrent = 0.0
  return self
end

function gameModeRulesClass:load()
	-- all assets are in common module now - flyweight
end

function gameModeRulesClass:update(dt)
   self.counterCurrent = self.counterCurrent + dt
end

function gameModeRulesClass:draw()
	love.graphics.draw(common.backgroundRulesImage, 0, 0, 0, 1, 1, 0, 0)
	
	-- event
	common.drawText("h2", "Rules of The Game", 0, 30, 1366, "center", "black")
	
	-- players avatars
	love.graphics.draw(self.gameState.player1.image, 50, 120, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player2.image, 200, 120, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player3.image, 350, 120, 0, 0.5, 0.5)
	love.graphics.draw(self.gameState.player4.image, 780, 120, 0, 0.5, 0.5)
	
	-- players rules
	common.drawText("h4", "The Crew:", 50, 300, 1366, "left", "black")
	common.drawText("h5", "Move around the maze and collect 20 Coins of Power.", 70, 350, 1366, "left", "black")
	
	common.drawText("h5", "But be careful!", 70, 400, 1366, "left", "black")
	common.drawText("h5", "Evil Tom wants to turn your life into a nightmare. Whenever", 70, 430, 1366, "left", "black")
	common.drawText("h5", "he catches anyone, the whole team is cursed and needs to", 70, 460, 1366, "left", "black")
	common.drawText("h5", "decide what to do.", 70, 490, 1366, "left", "black")
	
	common.drawText("h5", "Curse remains in play until the end of the game or", 70, 540, 1366, "left", "black")
	common.drawText("h5", "if it is replaced with a new curse colliding with ", 70, 570, 1366, "left", "black")
	common.drawText("h5", "a previous one.", 70, 600, 1366, "left", "black")
	
	common.drawText("h4", "Game is over when all the players are unable to play", 70, 650, 1366, "center", "black")
	common.drawText("h4", "or have been caught 10 times.", 70, 700, 1366, "center", "black")
	
	 
	-- bad guy rules
	common.drawText("h4", "Evil Tom:", 780, 300, 1366, "left", "black")
	common.drawText("h5", "Chase those pesky trespassers and curse them", 800, 350, 1366, "left", "black")
	common.drawText("h5", "with your loathsome and random witchcraft.", 800, 380, 1366, "left", "black")

	
    -- draw enter button
	if self.counterCurrent >= self.counterMax then
	   love.graphics.draw(common.enterImage, 1200, 650, 0, 0.5, 0.5)
	end
end

function gameModeRulesClass:keypressed(key)
   if self.counterCurrent >= self.counterBlockInput then
      if key == "return" then
	 self.gameState:callGameModeAction(self.gameState.actionStart)
      end
   end
end

function gameModeRulesClass.keyreleased(key)
end

function gameModeRulesClass:mousepressed(x, y, button)
end

function gameModeRulesClass:mousereleased(x, y, button)
end

return gameModeRulesClass
