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