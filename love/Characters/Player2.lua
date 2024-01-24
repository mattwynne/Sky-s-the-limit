Player2 = Object:extend()

function Player2:new()
    self.image = love.graphics.newImage('Sprites/P2_Left.png')
    self.x = 350
    self.y = 300
end

function Player2:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, imageScale, imageScale)
end