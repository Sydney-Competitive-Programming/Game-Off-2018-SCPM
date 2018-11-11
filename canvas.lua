
-- This Class should encapsulates the game field background information and behavior

Canvas = Object:extend()

function Canvas:new()
    self.width,self.height = love.graphics.getDimensions( )
end


function Canvas:draw()
    -- To be implemented
end

function Canvas:update(dt)
    -- To be implemented
end