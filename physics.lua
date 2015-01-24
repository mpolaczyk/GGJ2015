-- physics.lua

local physicsClass = {}
physicsClass.__index = physicsClass
physicsClass.world = love.physics.newWorld(0, 10*22, true)

function physicsClass.init()
   love.physics.setMeter(22)
end

function physicsClass.update(dt)
   physicsClass.world:update(dt)
end

function physicsClass.new(pos, size, kind)
   kind = kind or "static"
   local self = setmetatable({}, physicsClass)
   self.body = love.physics.newBody(physicsClass.world, size.width/2, size.height/2, kind)
   self.body:setPosition(pos.x, pos.y)
   self.shape = love.physics.newRectangleShape(size.width, size.height)
   self.fixture = love.physics.newFixture(self.body, self.shape)
   return self
end

return physicsClass
