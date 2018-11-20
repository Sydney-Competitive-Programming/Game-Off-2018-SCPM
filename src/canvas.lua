
-- This Class should encapsulates the game field background information and behavior

Canvas = Object:extend()

function Canvas:new(width,height,map)
    self.width = width
    self.height = height
    self.map = map
end


function Canvas:update(dt)
    self.map:update(dt)
end


function Canvas:draw()
    self.map:draw()
end
