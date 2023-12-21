Help = Object:extend()

function Help:new()
  self.show = true
  self.x = 300
  self.y = 50
  self.message = "Arrow keys or WASD to move."
end

function Help:draw()
  if self.show then
    local font = love.graphics.newFont("Code/Courier New.ttf", 30)
    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(self.message, self.x, self.y)
  end
end


function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  require "Characters"
  help = Help()
  player1 = Player1(help)
  player2 = Player2()

  imageScale = 5.5
  showHelp = true
  tile = love.graphics.newImage("Sprites/Tiles/Tile1.png")

  tilemap = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0},
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},  
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},  
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},  
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},  
    {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},  
  }
end

function love.update(dt)
  player1:update(dt)
  LuaReload.Monitor()
end
  
function love.draw()
  tileSize = tile:getWidth() * imageScale
  for row=1,#tilemap do
    for col=1,#tilemap[row] do
      if tilemap[row][col] ==1 then
        love.graphics.draw(tile, (col -1) * tileSize, (row -1) * tileSize, 0, imageScale, imageScale)
      end
    end
  end
  player1:draw()
  player2:draw()
  help:draw()

  if player1:hasCollidedWith(player2) then
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("COLLISION DETECTED", 100, 50)
  end  
end 