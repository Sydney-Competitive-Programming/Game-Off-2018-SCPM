
function love.load()
    Object = require "classic"
    require "entity"
    require "canvas"
    require "player"
    require "enemy"

    canvas = Canvas()
    player = Player(
            canvas.width/2
            ,canvas.height
            ,50,50,10,50,500,canvas)

    enemy = Enemy(
        0,0
        ,50,50,70,canvas)

    key_counter =0
    key_pressed =false

end

function love.update(dt)
    
    if key_pressed then
        key_counter = key_counter +1;
    end

    player:update(dt,key_counter)
    enemy:update(dt)

end

function love.draw()
    player:draw()
    enemy:draw()
end

function love.keypressed (key,unicode)
    key_pressed =true
end

function love.keyreleased (key,unicode)
    key_pressed =false
    key_counter = 0
end