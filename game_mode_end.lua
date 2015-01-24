-- game_mode_end.lua

local gameModeEndClass = {}
gameModeEndClass.__index = gameModeEndClass


function gameModeEndClass.new(gameState)
  local self = setmetatable({}, gameModeEndClass)
  self.moduleName = "gameModeEndClass"
  self.gameState = gameState
  return self
end

function gameModeEndClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
	
	-- for victory
    --self.victoryImage = love.graphics.newImage("img/wsad.png")
	--self.playerAAvatar = love.graphics.newImage("img/wsad.png")
	--self.playerBAvatar = love.graphics.newImage("img/wsad.png")
	--self.playerCAvatar = love.graphics.newImage("img/wsad.png")
	
	-- for defeat
	--self.defeatImage = love.graphics.newImage("img/wsad.png")
	--self.playerDAvatar = love.graphics.newImage("img/wsad.png")
end

function gameModeEndClass:update(dt)
    
end

function gameModeEndClass:draw()
	
	love.graphics.draw(backgroundImage, 0, 0, 0, 1, 1, 0, 0)
	
	--if self.gameState.playersVictory then
		--love.graphics.draw(victoryImage, x, y, 0, 1, 1, 0, 0)
		--love.graphics.draw(playerAAvatar, x, y, 0, 1, 1, 0, 0)
		--love.graphics.draw(playerBAvatar, x, y, 0, 1, 1, 0, 0)
		--love.graphics.draw(playerCAvatar, x, y, 0, 1, 1, 0, 0)
	--else if self.gameState.badGuyVictory then
		--love.graphics.draw(defeatImage, x, y, 0, 1, 1, 0, 0)
		--love.graphics.draw(playerDAvatar, x, y, 0, 1, 1, 0, 0)
	--end
	
	-- temp until assets arrive
    love.graphics.print("This is the end", 10, 10)
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
