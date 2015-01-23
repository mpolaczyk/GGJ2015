-- game_state.lua

local gameStateClass = {}
gameStateClass.__index = gameStateClass


function gameStateClass.new()
  local self = setmetatable({}, gameStateClass)
  self.moduleName = "gameStateClass"
  return self
end

return gameStateClass