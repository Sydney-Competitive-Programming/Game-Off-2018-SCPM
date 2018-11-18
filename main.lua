
function love.load()

    -- Load the class functions
    Object = require "lib/classic"

    -- Load the Game context
    require("src/game_context")
    Context = Game_Context()

    -- Initiate the keys constants (speed of players depends on how long a key is pressed)
    key_counter =0
    key_pressed =false

end

function love.update(frame_rate)
    
    if key_pressed then
        key_counter = key_counter +1;
    end

    -- Updat the game context passing the time a key was pressed
    Context:update(frame_rate,key_counter)
    

end

function love.draw()
    
    Context:draw()

end

-- Callback functions for key pressed
function love.keypressed (key,unicode)
    key_pressed =true
end

function love.keyreleased (key,unicode)
    key_pressed =false
    key_counter = 0
end
