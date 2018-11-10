Enemy = Entity:extend()

function Enemy:new(x,y,w,h,speed,canvas)
    Enemy.super.new(self, x,y,w,h )--,acceleration, max_speed)
    
    self.name = "Alien"
    self.image = love.graphics.newImage("assets/PNG/shipBlue_manned.png")
    self.max_x = canvas.width
    self.max_y = canvas.height
    self.scale_w = self.w/self.image:getWidth()
    self.scale_h = self.h/self.image:getHeight()
    self.speed =speed
    self.motion_counter =0
end

function Enemy:draw()
    love.graphics.draw(self.image,self.x ,self.y,0,self.scale_w,self.scale_h)
end

function Enemy:update(dt)
    self.motion_counter = self.motion_counter +1;

        speed = self.speed
        distance = speed * dt 
        self.move_down(self,dt,distance)
        self.motion_counter =0

end