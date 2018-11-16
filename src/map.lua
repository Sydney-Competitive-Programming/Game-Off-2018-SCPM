--
-- Controls the map rendering
--

-------------
-- TILESET --
-------------

TILESET = {
  love.graphics.newImage("graphics/tile_floor.png"),
  love.graphics.newImage("graphics/tile_wall.png")
}

------------------------
-- ARENAS DECLARATION --
------------------------

N_WIDTH  = 8
N_HEIGHT = 8

EXAMPLE_ARENA_1 = {
  {2, 2, 2, 2, 2, 2, 2, 2,},
  {2, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 2, 1, 1, 2, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 2, 1, 1, 2, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 2,},
  {2, 2, 2, 2, 2, 2, 2, 2,}
}

---------------
-- MAP CLASS --
---------------
Map = Object:extend()


function Map:new(tilemap)
  --|| Initalises the game map ||--
  self.tilemap = tilemap
  self.tile_width, self.tile_height = TILESET[1]:getDimensions()
end


function Map:update(dt)
  --|| Updates the game map ||--
  -- Nothing is called here as the map remains static --
end


function Map:draw()
  --|| Draws the game map ||--
  for y, y_val in ipairs(self.tilemap) do  -- Iterate over rows
    for x, x_val in ipairs(y_val) do  -- Iterate over each column in row
      local tile = TILESET[x_val]
      love.graphics.draw(
      tile, (x-1)*self.tile_width, (y-1)*self.tile_height
      )
    end
  end
end
