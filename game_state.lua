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
	
	common.introSound:setLooping(true)
	common.mapSound:setLooping(true)
	common.curseAppliedSound:setLooping(true)
	
	-- game modes and its activation
	self.GM_Pre = gmPre.new(self)
	self.GM_Rules = gmRules.new(self)
	self.GM_Start = gmStart.new(self)

	physicsClass.init()
	self.tileMap = tileMapClass.new({x = 220, y = 0}, 22)
	self.coinsToSpawn = 0
	self.badGuyRespawn = false
	self.coinsToWin = 10
	self.catchesToWin = 5

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
	self.player1 = playerClass.new("img/player_A_map.png", "img/player_a.png", self.tileMap:getPos(2, 2),
				  {width = common.tileSize*3, height = common.tileSize*3}, "Knight", self)
	self.player2 = playerClass.new("img/player_B_map.png", "img/player_b.png", self.tileMap:getPos(2, 8),
				  {width = common.tileSize*3, height = common.tileSize*3}, "Princess", self)
	self.player3 = playerClass.new("img/player_C_map.png", "img/player_c.png", self.tileMap:getPos(8, 2),
				  {width = common.tileSize*3, height = common.tileSize*3}, "Peasant", self)
	self.player4 = playerClass.new("img/evil.png", "img/player_d.png", self.tileMap:getPos(20, 15),
				  {width = common.tileSize*3, height = common.tileSize*3}, "BadGuy", self)
	
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
	
	-- curses state
	self.nextCurseA = nil
	self.nextCurseB = nil
	self.nextCurseC = nil
	
	-- start game
	self:callGameModeAction("sdad")
	
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
		love.audio.play(common.screenTransitionSound)
	
	-- Rules screen
	elseif self.currentGameMode == self.GM_Rules  and actionName == self.actionStart then
		-- goto start
		self.currentGameMode = self.GM_Start
		love.audio.play(common.screenTransitionSound)
		
	-- Start screen
	elseif self.currentGameMode == self.GM_Start and actionName == self.actionAllReady then
		-- goto run
		common.stopAllAmbientSounds()
		love.audio.play(common.mapSound)
		self.currentGameMode = self.GM_Run
	
	-- Run screen
	elseif self.currentGameMode == self.GM_Run and actionName == self.actionEndGame then
		-- goto end
	   common.stopAllAmbientSounds()
	   self.currentGameMode = self.GM_End
	
	-- Run screen		
	elseif self.currentGameMode == self.GM_Run and actionName == self.actionBadGuyContact then
		-- goto curse
		self.nextCurseA = common.getRandomCurse()
		self.nextCurseB = common.getRandomCurse()
		self.nextCurseC = common.getRandomCurse()
		self.currentGameMode = self.GM_Curse

		common.stopAllAmbientSounds()
		love.audio.play(common.curseAppliedSound)
	
	-- Curse screen
	elseif self.currentGameMode == self.GM_Curse and actionName == self.actionCurseResult then
		common.stopAllAmbientSounds()
		love.audio.play(common.mapSound)
		self.currentGameMode = self.GM_Run
	else
		common.stopAllAmbientSounds()
		love.audio.play(common.introSound)
		self.currentGameMode = self.GM_Pre
		
		--error("invalid game state transition")
	end
end

return gameStateClass
