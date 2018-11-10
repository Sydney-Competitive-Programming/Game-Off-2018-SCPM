Canvas = Object:extend()

function Canvas:new()
    self.width,self.height = love.graphics.getDimensions( )
end