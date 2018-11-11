-- This is a base class representing any moving entity
-- The idea is to inherit this class and overwrite any
-- default behavior when designing a moving object for example 
-- a player, an enemy or a moving obstacle.

Entity = Object:extend()


-- Constructor
function Entity:new(x,y,w,h)
    
    -- The cordinations of the top left point of the starting position
    -- In Love the top left side of the window is the point (0,0)
    self.x = x   
    self.y = y

    -- Hight and width of the entity
    self.h = h
    self.w =w

end

-- Motion functions where dt is the time lapse between consequent updates
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

-- Default update and draw functions
function Entity:update()
    love.graphics.polygon( "line", self.x, self.y+self.h, self.x+(self.w/2), self.y, self.x+self.w, self.y+self.h )
end


function Entity:draw()
    love.graphics.polygon( "line", self.x, self.y+self.h, self.x+(self.w/2), self.y, self.x+self.w, self.y+self.h )
end