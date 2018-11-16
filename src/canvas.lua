
-- This Class should encapsulates the game field background information and behavior

Canvas = Object:extend()

function Canvas:new()
    self.width,self.height = love.graphics.getDimensions()
    self.map = Map(EXAMPLE_ARENA_1)
end


function Canvas:update(dt)
    self.map:update(dt)
end


function Canvas:draw()
    self.map:draw()
end
