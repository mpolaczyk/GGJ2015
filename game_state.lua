-- game_state.lua

local gmPre = require "game_mode_pre"
local gmStart = require "game_mode_start"
local gmRun = require "game_mode_run"
local gmEnd = require "game_mode_end"
local gmCurse = require "game_mode_curse"

local gameStateClass = {}
gameStateClass.__index = gameStateClass

function gameStateClass.new()
	local self = setmetatable({}, gameStateClass)
	
	self.moduleName = "gameStateClass"
	
	-- game modes and its activation
	self.GM_Pre = gmPre.new(self)
	self.GM_Start = gmStart.new(self)
	self.GM_Run = gmRun.new(self)
	self.GM_End = gmEnd.new(self)
	self.GM_Curse = gmCurse.new(self)
	self.GM_Pre:load()
	self.GM_Start:load()
	self.GM_Run:load()
	self.GM_End:load()
	self.GM_Curse:load()

	-- fsm transitions
	self.actionEnter = "enter"
	self.actionAllReady = "all_ready"
	self.actionCurseResult = "curse_result"
	self.actionPlayerWin = "player_win"
	self.actionBadGuyContact = "bad_guy_contact"
	
	-- flags for end game 
	self.playersVictory = false
	self.badGuyVictory = false
	
	-- caught player for curse
	self.caughtPlayer = nil
	
	-- generate curses
	self.curses = {
		"Curse 1",
		"Curse 2",
		"Curse 3",
		"Curse 4",
		"Curse 5",
		"Curse 6",
		"Curse 7",
		"Curse 8",
		"Curse 9",
		"Curse 10"
	}
	self.nextCurseA = nil
	self.nextCurseB = nil
	self.nextCurseC = nil
	
	-- starting point
	self.currentGameMode = self.GM_Pre
	
	return self
end

function gameStateClass:callGameModeAction(actionName)
	-- FSM transitions
	
	if actionName == self.actionAllReady and self.currentGameMode == self.GM_Start then
		self.currentGameMode = self.GM_Run
		
	elseif actionName == self.actionPlayerWin and self.currentGameMode == self.GM_Run then
		self.currentGameMode = self.GM_End
		
	elseif actionName == self.actionBadGuyContact and self.currentGameMode == self.GM_Run then
		-- set new random curses and change mode
		self.nextCurseA = self:getRandomCurse()
		self.nextCurseB = self:getRandomCurse()
		self.nextCurseC = self:getRandomCurse()
		self.currentGameMode = self.GM_Curse
		
	elseif actionName == self.actionCurseResult and self.currentGameMode == self.GM_Curse then
		self.currentGameMode = self.GM_Run
		
	elseif actionName == self.actionEnter and self.currentGameMode == self.GM_PRE then
		self.currentGameMode = self.GM_Start
		
	else
		error("invalid game state transition")
	end
end


function gameStateClass:getRandomCurse()
	return self.curses[math.random(1, table.getn(self.curses))]
end


return gameStateClass