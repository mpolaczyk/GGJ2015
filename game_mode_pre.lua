-- game_mode_pre.lua

local gameModePreClass = {}
gameModePreClass.__index = gameModePreClass


function gameModePreClass.new(gameState)
  local self = setmetatable({}, gameModePreClass)
  self.moduleName = "gameModePreClass"
  self.gameState = gameState
  return self
end

function gameModePreClass:load()
	self.backgroundImage = love.graphics.newImage("img/bg.png")
    --self.eventLogo = love.graphics.newImage("img/wsad.png")
	--self.titleLogo = love.graphics.newImage("img/wsad.png")
	--self.teamImage = love.graphics.newImage("img/wsad.png")
	--self.rulesImage = love.graphics.newImage("img/wsad.png")
	--self.enterImage = love.graphics.newImage("img/wsad.png")
end

function gameModePreClass:update(dt)
    
end

function gameModePreClass:draw()
	love.graphics.draw(self.backgroundImage, 0, 0, 0, 1, 1, 0, 0)
    -- draw event logo
	--love.graphics.draw(self.eventImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw title logo
	--love.graphics.draw(self.titleImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw team  texts
	--love.graphics.draw(self.teamImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw rules image
	--love.graphics.draw(self.teamImage, x, y, 0, 1, 1, 0, 0)
	
	-- draw enter button
	--love.graphics.draw(self.enterImage, x, y, 0, 1, 1, 0, 0)
	
	-- temp until assets arrive
    love.graphics.print("Hit enter to continue!", 10, 10)
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
