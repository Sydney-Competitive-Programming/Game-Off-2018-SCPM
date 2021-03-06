
function love.load()
    -- Load all required classes
    Object = require "lib/classic"
    require "src/entity"
    require "src/canvas"
    require "src/example_player"
    require "src/example_enemy"
    require "src/map"

    -- Initiate game field

    Game_field = Canvas()

    -- initiate player and an enemy
    player = Player(
        Game_field.width/2
            ,Game_field.height
            ,50,50,10,500,500,Game_field)

    enemy = Enemy(
        0,0
        ,50,50,70,Game_field)

    -- to measure the duration of any key being pressed
    key_counter =0
    key_pressed =false

end

function love.update(frame_rate)
    Game_field:update()

    if key_pressed then
        key_counter = key_counter +1;
    end

    player:update(frame_rate,key_counter*frame_rate)
    enemy:update(frame_rate)

end

function love.draw()
    Game_field:draw()
    player:draw()
    enemy:draw()
end

-- Callback functions for key pressed
function love.keypressed (key,unicode)
    key_pressed =true
end

function love.keyreleased (key,unicode)
    key_pressed =false
    key_counter = 0
end
