Player1 = Object:extend()

function Player1:new()
    self.image = love.graphics.newImage("Sprites/P1_Right.png")
    self.x = 100
    self.y = 300
    self.idleCount = 1
    self.currentFrame = 1
    
    p1_idleFrames = {}
      for i = 1, 11 do
      table.insert(p1_idleFrames, love.graphics.newImage("Sprites/Animations/p1_idle_Frame" .. i .. ".png"))
    end
end

function Player1:update(dt)
    self.idleCount = self.idleCount + dt
    if love.keyboard.isDown("right", "d") then
        self.x = self.x + 300 * dt
        showHelp = false
        self.idleCount = 1
        self.currentFrame = 1
    end
    if love.keyboard.isDown("left", "a") then
        self.x = self.x - 300 * dt
        showHelp = false
        self.idleCount = 1
        self.currentFrame = 1
    end
    if self.idleCount >= 4 then
        self.currentFrame = self.currentFrame + dt * 5
        if self.currentFrame >= 11 then
          self.currentFrame = 1
          self.idleCount = 1
          self.currentFrame = 1
        end
    end
end

function Player1:draw()
    if self.idleCount >= 4 then
        love.graphics.draw(p1_idleFrames[math.floor(self.currentFrame)], self.x, self.y, 0, imageScale, imageScale)
      else
        love.graphics.draw(self.image, self.x, self.y, 0, imageScale, imageScale)
      end
end

function Player1:hasCollidedWith(other)
  local my_left = self.x
  local my_right = self.x + self.image:getWidth() * imageScale
  local my_top = self.y
  local my_bottom = self.y + self.image:getHeight() * imageScale

  local other_left = other.x
  local other_right = other.x + other.image:getWidth() * imageScale
  local other_top = other.y
  local other_bottom = other.y + other.image:getHeight() * imageScale

  return (
    my_right > other_left
    and my_left < other_right
    and my_bottom > other_top
    and my_top < other_bottom
  )
end