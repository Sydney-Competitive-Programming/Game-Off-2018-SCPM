--
-- Controls the map rendering
--

----------------------
-- HELPER FUNCTIONS --
----------------------

local function getScalingFactor(tilemap, canvas_width, canvas_height)
  --|| Computes the scaling factor for the drawing ||--
  local tile_width, tile_height = TILESET[1]:getDimensions()
  local ntiles_width = table.getn(tilemap[1])
  local ntiles_height = table.getn(tilemap)

  local total_draw_width = tile_width*ntiles_width
  local total_draw_height = tile_height*ntiles_height

  local sx = canvas_width/total_draw_width
  local sy = canvas_height/total_draw_height

  return sx, sy
end

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

-- Example Arena 1 -- Used for testing --
EXAMPLE_ARENA_1 = {
  {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,},
  {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,}
}

---------------
-- MAP CLASS --
---------------
Map = Object:extend()


function Map:new(tilemap, canvas_width, canvas_height)
  --|| Initalises the game map ||--
  self.tilemap = tilemap
  self.tile_width, self.tile_height = TILESET[1]:getDimensions()
  self.sx, self.sy = getScalingFactor(tilemap, canvas_width, canvas_height)
end


function Map:update(dt)
  --|| Updates the game map ||--
  -- Nothing is called here as the map currently remains static --
end


function Map:draw()
  --|| Draws the game map ||--
  for y, y_val in ipairs(self.tilemap) do
    for x, x_val in ipairs(y_val) do
      love.graphics.draw(
        TILESET[x_val],  -- Draw the tile as per tilemap key
        (x-1)*self.tile_width*self.sx, -- Xpos
        (y-1)*self.tile_height*self.sy,  -- Ypos
        0,  -- Rotation
        self.sx, self.sy  -- Scaling
      )
    end
  end
end
