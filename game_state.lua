-- game_state.lua

local gmPre = require "game_mode_pre"
local gmRules = require "game_mode_rules"
local gmStart = require "game_mode_start"
local gmRun = require "game_mode_run"
local gmEnd = require "game_mode_end"
local gmCurse = require "game_mode_curse"

local common = require "common"

local physicsClass = require "physics"
local playerClass = require "player"
local tileMapClass = require "tilemap"

local gameStateClass = {}
gameStateClass.__index = gameStateClass

function gameStateClass.new()
	local self = setmetatable({}, gameStateClass)
	
	self.moduleName = "gameStateClass"
	
	-- game modes and its activation
	self.GM_Pre = gmPre.new(self)
	self.GM_Rules = gmRules.new(self)
	self.GM_Start = gmStart.new(self)
	physicsClass.init()
	self.tileMap = tileMapClass.new({x = 220, y = 0}, 22)
	self.GM_Run = gmRun.new(self, self.tileMap)
	self.GM_End = gmEnd.new(self)
	self.GM_Curse = gmCurse.new(self)
	self.GM_Pre:load()
	self.GM_Rules:load()
	self.GM_Start:load()
	self.GM_Run:load()
	self.GM_End:load()
	self.GM_Curse:load()

	-- players for Run modes
	self.player1 = playerClass.new("img/blue.png", self.tileMap:getPos(4, 4),
				  {width = common.tileSize*2, height = common.tileSize*2})
	self.player2 = playerClass.new("img/red.png", self.tileMap:getPos(4, 6),
				  {width = common.tileSize*2, height = common.tileSize*2})
	self.player3 = playerClass.new("img/yellow.png", self.tileMap:getPos(4, 8),
				  {width = common.tileSize*2, height = common.tileSize*2})
	self.player4 = playerClass.new("img/evil.png", self.tileMap:getPos(4, 10),
				  {width = common.tileSize*2, height = common.tileSize*2})
	
	-- fsm transitions
	self.actionRules = "rules"
	self.actionStart = "start"
	self.actionAllReady = "all_ready"
	self.actionCurseResult = "curse_result"
	self.actionEndGame = "endGame"
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

function gameStateClass:getPlayersScore()
	return self.player1.score +  self.player2.score + self.player3.score
end

function gameStateClass:getBadGuyScore()
	return self.player4.score
end

function gameStateClass:callGameModeAction(actionName)
	-- FSM transitions
	
	-- Pre screen
	if self.currentGameMode == self.GM_Pre  and actionName == self.actionRules then
		-- goto rules
		self.currentGameMode = self.GM_Rules
	
	-- Rules screen
	elseif self.currentGameMode == self.GM_Rules  and actionName == self.actionStart then
		-- goto start
		self.currentGameMode = self.GM_Start
		
	-- Start screen
	elseif self.currentGameMode == self.GM_Start and actionName == self.actionAllReady then
		-- goto run
		self.currentGameMode = self.GM_Run
	
	-- Run screen
	elseif self.currentGameMode == self.GM_Run and actionName == self.actionEndGame then
		-- goto end
		self.currentGameMode = self.GM_End
	elseif self.currentGameMode == self.GM_Run and actionName == self.actionBadGuyContact then
		-- goto curse
		self.nextCurseA = self:getRandomCurse()
		self.nextCurseB = self:getRandomCurse()
		self.nextCurseC = self:getRandomCurse()
		self.currentGameMode = self.GM_Curse
	
	-- Curse screen
	elseif self.currentGameMode == self.GM_Curse and actionName == self.actionCurseResult then
		self.currentGameMode = self.GM_Run
		
	else
		error("invalid game state transition")
	end
end


function gameStateClass:getRandomCurse()
	return self.curses[math.random(1, table.getn(self.curses))]
end


return gameStateClass