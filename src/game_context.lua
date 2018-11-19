
-- This is an entry class which encapsulate all the game components
-- And makes sure the entities behavior does not violate the game rules
-- Any Interaction between the game entities should be implemented in this class

Game_Context = Object:extend()

-- Loads all required dependencies and initiates the game componentes
function Game_Context:new()
    
    -- Initiate game field
    require "src/canvas"
    require "src/map"
    self.Game_field = Canvas()

    
    -- initiate player and 
    require "src/entity"
    require "src/example_player"
    self.player = self.create_player(self,self.Game_field.width/2,self.Game_field.height,10,500);
    
    -- initiate enemies
    require "src/example_enemy"
    math.randomseed(os.time())
    self.enemy_number =4
    self.enemies={}

    for e =1,self.enemy_number do
        -- randomly choose a position for the enemy witihin 10%-90% of the width of the canvas
        local x_pos = math.random(self.Game_field.width*0.1,self.Game_field.width*0.9)
        self.enemies[e]= self.create_enemy(self,x_pos,0,70)
    end
    

end

function Game_Context:update(frame_rate , key_counter)

    self.Game_field:update()
    self.player:update(frame_rate,key_counter*frame_rate)
    
    for i,e in ipairs(self.enemies)do
        e:update(frame_rate)
    end

    -- Ensure the player stays within the game field boundary
    if self.player.x < 0 then 
        self.player.x = 0 
    end
    if (self.player.x+self.player.w) > self.Game_field.width then 
        self.player.x = self.Game_field.width-self.player.w 
    end
    if self.player.y < 0 then 
        self.player.y = 0 
    end
    
    if (self.player.y+self.player.h) > self.Game_field.height then
        self.player.y = self.Game_field.height-self.player.h 
    end

    -- if an enemy gets out of the canvas box kill it
    for i,e in ipairs(self.enemies) do
        if e.x < 0 
            or (e.x+e.w) > self.Game_field.width
            or e.y < 0
            or (e.y+e.h) > self.Game_field.height
            then
                table.remove(self.enemies,i)
                --print(#self.enemies)
        end

    end
end


function Game_Context:draw()

    self.Game_field:draw()
    self.player:draw()
    for i,e in ipairs(self.enemies)do
        e:draw(frame_rate)
    end
end


function Game_Context:create_player(init_x,init_y,init_speed,acceleration)
    
    player = Player(init_x,init_y
    ,50,50,init_speed,acceleration,500)
    return player
end
function Game_Context:create_enemy(pos_x,pos_y,speed)
    enemy = Enemy(
        pos_x,pos_y
        ,50,50,speed)
    return enemy
end