function love.load()
   love.physics.set_meter(64) -- px per meter
   world = love.physics.newWorld(0, 0, true)

   objects = {}
   objects.ball = {}
   objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")

   objects.ball.shape = love.physics.newRectangleShape(650, 50)
   objects.ball.fixture = love.physics.newFixture(objects.ball.body,
						  objects.ball.shape,
						  1)
end

function love.update(dt)
   world:update(dt)
end

function love.draw()
end
