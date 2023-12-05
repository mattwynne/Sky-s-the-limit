function love.load()
  tilemap = {
    {1, 0, 0, 1, 0, 0, 1, 0, 0, 1},
    {0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
    {0, 0, 1, 0, 0, 1, 0, 0, 1, 0}  
  }
  idleCount = 1
  p1_idleFrames = {}
  
  for i = 1, 11 do
    table.insert(p1_idleFrames, love.graphics.newImage("Sprites/Animations/p1_idle_Frame" .. i .. ".png"))
  end

  currentFrame = 1
  showHelp = true
  
  p2 = {
    image = love.graphics.newImage('sprites/P2_Left.png'),
    x = 350,
    y = 50,
    draw = function(self)
      love.graphics.draw(self.image, self.x, self.y)
    end  
  }

  p1 = {
    image = love.graphics.newImage('sprites/P1_Right.png'),
    x = 100,
    y = 50,
    draw = function(self)
      if idleCount >= 4 then
        love.graphics.draw(p1_idleFrames[math.floor(currentFrame)], p1.x, p1.y)
      else
        love.graphics.draw(self.image, self.x, self.y)
      end
    end
  }
end

function love.update(dt)
  idleCount = idleCount + dt
  if idleCount >= 4 then
    currentFrame = currentFrame + dt * 5
    if currentFrame >= 11 then
      currentFrame = 1
      idleCount = 1
      currentFrame = 1
    end
  end
  LuaReload.Monitor()
  if love.keyboard.isDown("right", "d") then
    p1.x = p1.x + 300 * dt
    showHelp = false
    idleCount = 1
    currentFrame = 1
  end
  if love.keyboard.isDown("left", "a") then
    p1.x = p1.x - 300 * dt
    showHelp = false
    idleCount = 1
    currentFrame = 1
  end
  if love.keyboard.isDown("down", "s") then
    p1.y = p1.y + 300 * dt
    showHelp = false
    idleCount = 1
    currentFrame = 1
  end
  if love.keyboard.isDown("up", "w") then
    p1.y = p1.y - 300 *dt
    showHelp = false
    idleCount = 1
    currentFrame = 1
  end
end
  
function love.draw()
  for row=1,#tilemap do
    for col=1,#tilemap[row] do
      if tilemap[row][col] ==1 then
        love.graphics.rectangle("line", col * 25, row * 25, 25, 25)
      end
    end
  end      
  if showHelp then
    local font = love.graphics.newFont("Courier New.ttf", 30)
    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Arrow keys to move.", 300, 50)
  end
  p2:draw()
  p1:draw()
  
  if checkCollision(p1, p2) == true then
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("COLLISION DETECTED", 100, 50)
  end  
end

function checkCollision(p1, p2)
  local p1_left = p1.x
  local p1_right = p1.x + p1.image:getWidth()
  local p1_top = p1.y
  local p1_bottom = p1.y + p1.image:getHeight()

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