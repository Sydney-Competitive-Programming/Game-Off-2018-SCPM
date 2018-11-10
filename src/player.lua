--
-- The player class.
--
Player = Object:extend()


function Player:new(x, y)
  --|| Initialise the player ||--
  self.image = love.graphics.newImage("assets/graphics/player.png")
  self.x = x
  self.y = y
  self.speed = 100
end


function Player:update(dt)
  --|| Run the internal logic on the player. ||--
  self:WASD(dt)
end


function Player:draw()
  --|| Render the player ||--
  love.graphics.draw(self.image, self.x, self.y)
end


function Player:WASD(dt)
  --|| Runs the update method for WASD keys ||--

  local ux, uy = 0, 0

  if love.keyboard.isDown("w") then uy = uy-1 end
  if love.keyboard.isDown("a") then ux = ux-1 end
  if love.keyboard.isDown("s") then uy = uy+1 end
  if love.keyboard.isDown("d") then ux = ux+1 end

  if ux ~= 0 or uy ~= 0 then
    local magnitude = math.sqrt(ux*ux + uy*uy)
    ux, uy = ux/magnitude, uy/magnitude  -- Normalise the unit vector
  end

  self.x = self.x + ux*self.speed*dt
  self.y = self.y + uy*self.speed*dt
end
