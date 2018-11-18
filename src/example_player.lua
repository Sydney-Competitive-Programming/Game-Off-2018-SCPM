
-- Player example class:
-- In this implementation the player moves with the arrow buttons with a given speed
-- The longer the button is pressed the faster the player moves to a maximum speed

Player = Entity:extend()

--constructor
function Player:new(x,y,w,h,speed,acceleration, max_speed)
    Player.super.new(self, x,y,w,h)
    
    -- MetaData
    self.name = "Player"
    self.image = love.graphics.newImage("graphics/enemy_example.png")
    
    -- The scale between the actual width and height of the player image and 
    -- The desired dimensions of the player entity
    self.scale_w = self.w/self.image:getWidth()
    self.scale_h = self.h/self.image:getHeight()

    -- The speed with which the object is moving 
    --  this value is multiplied by the frame rate to get the motion distance per screen update
    self.speed=speed
    self.max_speed =max_speed
    
    -- The acceleration Rate, This value will be multiplied by how long a button is being pressed
    -- To get the increment on the speed
    self.acceleration = acceleration
end

-- A simple drawing function
function Player:draw()
    love.graphics.draw(self.image,self.x ,self.y,0,self.scale_w,self.scale_h)
end

function Player:update(dt,duration_since_button_clicked)
    
    -- Speed = Initial_speed + acceleration * time (how long a button is pressed)
    -- Distance = Speed * time (time between two consequent updates)
    
    -- Make sure not to exceed maximum speed
    speed = math.min(self.max_speed , self.speed +self.acceleration * duration_since_button_clicked)
    distance = speed * dt

    -- Map motion direction into unit vectors (ux,uy)
    local ux, uy = 0, 0
    if love.keyboard.isDown("w") or love.keyboard.isDown('up') then
        uy = uy-1
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown('left') then 
        ux = ux-1 
    end
    if love.keyboard.isDown("s") or love.keyboard.isDown('down') then
        uy = uy+1
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown('right') then
        ux = ux+1
    end
   
    Player.move(self,ux,uy,distance)

end
