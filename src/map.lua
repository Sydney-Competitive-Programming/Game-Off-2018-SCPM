--
-- Controls the map rendering
--

----------------------
-- HELPER FUNCTIONS --
----------------------

local function scalingFactor(tilemap, canvas_width, canvas_height)
  --|| Computes the scaling factor for the drawing ||--
  local width, height = TILESET[1]:getDimensions()
  local total_draw_width = width*table.getn(tilemap[1])
  local total_draw_height = height*table.getn(tilemap)

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
  self.sx, self.sy = scalingFactor(tilemap, canvas_width, canvas_height)
end


function Map:update(dt)
  --|| Updates the game map ||--
  -- Nothing is called here as the map remains static --
end


function Map:draw()
  --|| Draws the game map ||--

  -- Figure out the scaling factor for the map so it fits the canvas.


  -- Finally draw the canvas.
  for y, y_val in ipairs(self.tilemap) do
    for x, x_val in ipairs(y_val) do
      local tile = TILESET[x_val]
      love.graphics.draw(
        tile,
        (x-1)*self.tile_width*self.sx, -- Xpos
        (y-1)*self.tile_height*self.sy,  -- Ypos
        0, self.sx, self.sy
      )
    end
  end
end
