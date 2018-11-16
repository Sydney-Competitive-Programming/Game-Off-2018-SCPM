--
-- Controls the map rendering
--

-------------
-- TILESET --
-------------

TILE_WIDTH  = 32
TILE_HEIGHT = 32

TILESET = {
  love.graphics.newImage("graphics/tile_floor.png"),
  love.graphics.newImage("graphics/tile_wall.png")
}

------------------------
-- ARENAS DECLARATION --
------------------------

N_WIDTH  = 8
N_HEIGHT = 8

ARENA_1 = {
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


function Map:new(tilemap, tile_width, tile_height)
  --|| Initalises the game map ||--
  self.tilemap = tilemap
  love.window.setMode(TILE_WIDTH*N_WIDTH, TILE_HEIGHT*N_HEIGHT)
end


function Map:update(dt)
  --|| Updates the game map ||--
  -- Nothing is called here as the map remains static --
end


function Map:draw()
  --|| Draws the game map ||--
  for y, y_val in ipairs(self.tilemap) do
    for x, x_val in ipairs(y_val) do
      local tile = TILESET[x_val]
      love.graphics.draw(tile, (x-1)*TILE_WIDTH, (y-1)*TILE_HEIGHT)
    end
  end
end
