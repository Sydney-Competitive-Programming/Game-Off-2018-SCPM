
-- Player Class -----------------------

Player = Entity:extend()

function Player:new(x,y,w,h,speed,acceleration, max_speed,canvas)
    Player.super.new(self, x,y,w,h)
    
    self.name = "Player"
    self.image = love.graphics.newImage("assets/PNG/shipBeige_manned.png")
    self.max_x = canvas.width
    self.max_y = canvas.height
    self.scale_w = self.w/self.image:getWidth()
    self.scale_h = self.h/self.image:getHeight()

    self.speed=speed
    self.max_speed =max_speed
    self.acceleration = acceleration
end
function Player:draw()
    love.graphics.draw(self.image,self.x ,self.y,0,self.scale_w,self.scale_h)
end

function Player:update(dt,duration_since_button_clicked)
    speed = math.min(self.max_speed , self.speed +self.acceleration * duration_since_button_clicked)
    distance = speed * dt

    if love.keyboard.isDown('right') then
        Player.move_right(self,dt,distance)
    end
    if love.keyboard.isDown('down') then
        Player.move_down(self,dt,distance)
    end
    if love.keyboard.isDown('left') then
        Player.move_left(self,dt,distance)
    end
    if love.keyboard.isDown('up') then
        Player.move_up(self,dt,distance)
    end
    
    if self.x < 0 then self.x = 0 end
    if (self.x+self.w) > self.max_x then self.x = self.max_x-self.w end
    if self.y < 0 then self.y = 0 end
    if (self.y+self.h) > self.max_y then self.y = self.max_y-self.h end
end