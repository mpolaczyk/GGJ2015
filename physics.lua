-- physics.lua

local physicsClass = {}
physicsClass.__index = physicsClass
physicsClass.world = love.physics.newWorld(0, 0, true)

function physicsClass.init()
   love.physics.setMeter(22)
   physicsClass.world:setCallbacks(beginContact, 
				   endContact, 
				   preSolve, 
				   postSolve)
end

function physicsClass.update(dt)
   physicsClass.world:update(dt)
end

function physicsClass.new(pos, size, userData, kind)
   kind = kind or "static"
   local self = setmetatable({}, physicsClass)
   self.body = love.physics.newBody(physicsClass.world, 
				    size.width/2, 
				    size.height/2, 
				    kind)
   self.shape = love.physics.newRectangleShape(size.width, size.height)
   self.fixture = love.physics.newFixture(self.body, self.shape)
   self.body:setPosition(pos.x, pos.y)
   if userData then
      self.fixture:setUserData(userData)
   end 
   return self
end

function beginContact(a, b, coll)
   if coll:isTouching() then
      aobj = a:getUserData()
      bobj = b:getUserData()
      aobj:onCollision(bobj)
      bobj:onCollision(aobj)
   end
end

function endContact(a, b, coll)
end

function preSolve(a, b, coll)
end

function postSolve(a, 
		   b, 
		   coll, 
		   normalimpulse1, 
		   tangentimpulse1, 
		   normalimpulse2, 
		   tangentimpulse2)
end

return physicsClass
