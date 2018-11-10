
Entity = Object:extend()

function Entity:new(x,y,w,h)
    self.x = x
    self.y = y
    self.speed = speed
    self.h = h
    self.w =w

end

function Entity:move_left(dt, distance)
    self.x = self.x- distance
end
function Entity:move_right(dt, distance)
    self.x = self.x + distance
end
function Entity:move_up(dt, distance)
    self.y = self.y- distance
end
function Entity:move_down(dt, distance)
    self.y = self.y+ distance
end

function Entity:update()
   -- love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end


function Entity:draw()
    -- love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.polygon( "line", self.x, self.y+self.h, self.x+(self.w/2), self.y, self.x+self.w, self.y+self.h )
end