-- game_mode_start.lua

local gameModeStartClass = {}
gameModeStartClass.__index = gameModeStartClass


function gameModeStartClass.new(gameState)
  local self = setmetatable({}, gameModeStartClass)
  self.moduleName = "gameModeStartClass"
  self.gameState = gameState
  
  self.playerAReady = false
  self.playerBReady = false
  self.playerCReady = false
  self.playerDReady = false
  
  return self
end

function gameModeStartClass:load()
    self.playerAPane = love.graphics.newImage("img/wsad.png")
	self.playerBPane = love.graphics.newImage("img/uhjk.png")
	self.playerCPane = love.graphics.newImage("img/strzalki.png")
	self.playerDPane = love.graphics.newImage("img/mouse.png")
	self.playerAFace = love.graphics.newImage("img/blue.png")
	self.playerBFace = love.graphics.newImage("img/red.png")
	self.playerCFace = love.graphics.newImage("img/yellow.png")
	self.playerDFace = love.graphics.newImage("img/evil.png")
end

function gameModeStartClass:update(dt)
    
	-- check if game mode done
	if self.playerAReady and self.playerBReady and self.playerCReady then
		self.gameState:callGameModeAction(self.gameState.actionAllReady)
	end
end

function gameModeStartClass:draw()
	love.graphics.draw(self.playerAPane, 50, 50, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerBPane, 500, 50, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerCPane, 950, 50, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerDPane, 500, 400, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerAFace, 150, 150, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerBFace, 500, 50, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerCFace, 950, 50, 0, 1, 1, 0, 0)
	love.graphics.draw(self.playerDFace, 500, 400, 0, 1, 1, 0, 0)

	if self.playerAReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerBReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerCReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
	
	if self.playerDReady then
		--love.graphics.rectangle("fill", 20, 50, 60, 120)
	else
	
	end
end

function gameModeStartClass:keypressed(key)
	if key == "w" or key == "w" or key == "a" or key == "d" then
		self.playerAReady = true
	elseif key == "u" or key == "j" or key == "j" or key == "k" then
		self.playerBReady = true
	elseif key == "up" or key == "down" or key == "left" or key == "right" then
		self.playerCReady = true
	end
end

return gameModeStartClass