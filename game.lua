function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  require "Characters"
  player1 = Player1()
  imageScale = 5.5
  currentFrame = 1
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

  idleCount = 1
  p1_idleFrames = {}
  
  for i = 1, 11 do
    table.insert(p1_idleFrames, love.graphics.newImage("Sprites/Animations/p1_idle_Frame" .. i .. ".png"))
  end
  
  p2 = {
    image = love.graphics.newImage('sprites/P2_Left.png'),
    x = 350,
    y = 50,
    draw = function(self)
      love.graphics.draw(self.image, self.x, self.y, 0, imageScale, imageScale)
    end  
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
  if showHelp then
    local font = love.graphics.newFont("Code/Courier New.ttf", 30)
    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Arrow keys or WASD to move.", 300, 50)
  end
  p2:draw()
  
  if checkCollision(p1, p2) == true then
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("COLLISION DETECTED", 100, 50)
  end  
end

function checkCollision(p1, p2)
  local p1_left = player1.x
  local p1_right = player1.x + player1.image:getWidth()
  local p1_top = player1.y
  local p1_bottom = player1.y + player1.image:getHeight()

  local p2_left = p2.x
  local p2_right = p2.x + p2.image:getWidth()
  local p2_top = p2.y
  local p2_bottom = p2.y + p2.image:getHeight()

  if p1_right > p2_left
  and p1_left < p2_right
  and p1_bottom > p2_top
  and p1_top < p2_bottom then
      return true
  else
      return false
  end  
end 