-- player.lua

local playerClass = {}
playerClass.__index = playerClass


function playerClass.new(avatarPath, name)
  local self = setmetatable({}, playerClass)
  self.moduleName = "playerClass"
  self.avatarImage = love.graphics.newImage(avatarPath)
  self.name = name
  self.score = 0
  return self
end



return playerClass
