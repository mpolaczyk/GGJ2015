-- game_state.lua

local gmStart = require "game_mode_start"
local gmRun = require "game_mode_run"
local gmEnd = require "game_mode_end"
local gmCurse = require "game_mode_curse"

local gameStateClass = {}
gameStateClass.__index = gameStateClass

function gameStateClass.new()
	local self = setmetatable({}, gameStateClass)
	
	self.moduleName = "gameStateClass"
	
	self.GM_Start = gmStart.new(self)
	self.GM_Run = gmRun.new(self)
	self.GM_End = gmEnd.new(self)
	self.GM_Curse = gmCurse.new(self)
	
	self.GM_Start:load()
	self.GM_Run:load()
	self.GM_End:load()
	self.GM_Curse:load()
	
	self.actionAllReady = "all_ready"
	self.actionCurseResult = "curse_result"
	self.actionPlayerWin = "player_win"
	self.actionBadGuyContact = "bad_guy_contact"
	
	self.currentGameMode = self.GM_Start
	
	return self
end


function gameStateClass:callGameModeAction(actionName)
	-- FSM transitions
	
	if actionName == self.actionAllReady and self.currentGameMode == self.GM_Start then
		self.currentGameMode = self.GM_Run
	elseif actionName == self.actionPlayerWin and self.currentGameMode == self.GM_Run then
		self.currentGameMode = self.GM_End
	elseif actionName == self.actionBadGuyContact and self.currentGameMode == self.GM_Run then
		self.currentGameMode = self.GM_Curse
	elseif actionName == self.actionCurseResult and self.currentGameMode == self.GM_Curse then
		self.currentGameMode = self.GM_Run
	else
		error("invalid game state transition")
	end
end

return gameStateClass