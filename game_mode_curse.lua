-- game_mode_curse.lua

local gameModeCurseClass = {}
gameModeCurseClass.__index = gameModeCurseClass


function gameModeCurseClass.new(gameState)
  local self = setmetatable({}, gameModeCurseClass)
  self.moduleName = "gameModeCurseClass"
  self.gameState = gameState
  return self
end

function gameModeCurseClass:load()
    --self.backgroundImage = love.graphics.newImage("img/wsad.png")
	
	-- buttons
    --self.oneImage = love.graphics.newImage("img/wsad.png")
	--self.twoImage = love.graphics.newImage("img/wsad.png")
	--self.threeImage = love.graphics.newImage("img/wsad.png")
	
	--self.titleImage = love.graphics.newImage("img/wsad.png")
end

function gameModeCurseClass:update(dt)
    
end

function gameModeCurseClass:draw()
    --love.graphics.draw(self.backgroundImage, x, y, 0, 1, 1, 0, 0)
	--love.graphics.draw(self.titleImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw buttons
	--love.graphics.draw(self.oneImage, x, y, 0, 1, 1, 0, 0)
	--love.graphics.draw(self.twoImage, x, y, 0, 1, 1, 0, 0)
	--love.graphics.draw(self.threeImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw caught player
	--love.graphics.draw(self.gameState.caughtPlayer.avatar, x, y, 0, 1, 1, 0, 0)
	
	-- temp until assets arrive
    love.graphics.print("This is your curse", 10, 10)
end

function gameModeCurseClass:keypressed(key)
	if key == "1" or key == "2" or key == "3" then
		self.gameState:callGameModeAction(self.gameState.actionCurseResult)
	end
end

return gameModeCurseClass