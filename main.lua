--
-- Github Game Off
---
--- Created by the team at Sydney Competitive Programming Meetup.

Object = require("src/classic")
require("src/player")


function love.load()
  --|| The master loading function ||--
  player = Player(100, 100)
end


function love.update(dt)
  --|| The master update function ||--
  player:update(dt)
end


function love.draw()
  --|| The master drawing function ||--
  player:draw()
end
