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

function Entity:move(ux,uy,displacement)
    --|| Runs the update method for WASD keys ||--

    if ux ~= 0 or uy ~= 0 then
        local magnitude = math.sqrt(ux*ux + uy*uy)
        ux, uy = ux/magnitude, uy/magnitude  -- Normalise the unit vector
      end
      
    self.x = self.x + ux*displacement
    self.y = self.y + uy*displacement

end

-- Default update and draw functions
function Entity:update()
    -- Place Holder --
end


function Entity:draw()
   -- Place Holder --
end