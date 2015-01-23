-- physics.lua

local physicsClass = {}
physicsClass.__index = physicsClass

local world = love.physics.newWorld(0, 0, true)

function physicsClass.new(pos, size)
   local self = setmetatable({}, physicsClass)
   self.body = love.physics.newBody(world, size.width/2, size.height/2)
   self.shape = love.physics.newRectangleShape(size.width, size.height)
   self.fixture = love.physics.newFixture(self.body, self.shape)
   return self
end

return physicsClass
