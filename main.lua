--
-- Github Game Off
---
--- Created by the team at Sydney Competitive Programming Meetup.

Object = require "src/classic"
require "src/map"


function love.load()
  --|| The master loading function ||--
  map = Map(ARENA_1, 32, 32)
end


function love.update(dt)
  --|| The master update function ||--
end


function love.draw()
  --|| The master drawing function ||--
  map:draw()
end
