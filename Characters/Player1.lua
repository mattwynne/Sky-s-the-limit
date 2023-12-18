Player1 = Object:extend()

function Player1:new()
    self.image = love.graphics.newImage("Sprites/P1_Right.png")
    self.x = 100
    self.y = 300
end

function Player1:update(dt)
    if love.keyboard.isDown("right", "d") then
        self.x = self.x + 300 * dt
        showHelp = false
        idleCount = 1
        currentFrame = 1
    end
    if love.keyboard.isDown("left", "a") then
        self.x = self.x - 300 * dt
        showHelp = false
        idleCount = 1
        currentFrame = 1
    end
end

function Player1:draw()
    if idleCount >= 4 then
        love.graphics.draw(p1_idleFrames[math.floor(currentFrame)], self.x, self.y, 0, imageScale, imageScale)
      else
        love.graphics.draw(self.image, self.x, self.y, 0, imageScale, imageScale)
      end
end