--
-- The player class.
--
Player = Object:extend()


function Player:new()
  -- Initialise the player --
  self.image = love.graphics.newImage("assets/graphics/player.png")
  self.x = 100
  self.y = 100
  self.vx = 100
  self.vy = 100
end


function Player:update(dt)
  -- Run the internal logic on the player. --
  self:WASD(dt)
end


function Player:draw()
  -- Render the player --
  love.graphics.draw(self.image, self.x, self.y)
end


function Player:WASD(dt)
  -- Runs the update method for WASD keys --
  if love.keyboard.isDown("w") then
    self.y = self.y - self.vy*dt
  elseif love.keyboard.isDown("a") then
    self.x = self.x - self.vx*dt
  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.vy*dt
  elseif love.keyboard.isDown("d") then
    self.x = self.x + self.vx*dt
  end
end
