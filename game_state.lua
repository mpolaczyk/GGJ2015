-- game_state.lua

local gmStart = require "game_mode_start"
local gmRun = require "game_mode_run"
local gmEnd = require "game_mode_end"
local gmCurse = require "game_mode_curse"

local gameStateClass = {}
gameStateClass.__index = gameStateClass

GM_Start = nil
GM_Run = nil
GM_End = nil
GM_Curse = nil

currentGameMode = nil

function gameStateClass.new()
	local self = setmetatable({}, gameStateClass)
	
	self.moduleName = "gameStateClass"
	
	self.GM_Start = gmStart.new()
	self.GM_Run = gmRun.new()
	self.GM_End = gmEnd.new()
	self.GM_Curse = gmCurse.new()
	
	self.currentGameMode = self.GM_Start
	
	return self
end

return gameStateClass