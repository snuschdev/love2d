Game = Object:extend()

function Game:new()
    local windowWidth = love.graphics.getWidth()
	self.padLeft = Pad()
    self.padLeft.keyUp = "w"
    self.padLeft.keyDown = "s"
    self.padRight = Pad()
    self.padRight.x = windowWidth - 50
    self.ball = Ball()

    self.scoreLeft = 0
    self.scoreRight = 0
end

function Game:update(dt)
	self.padLeft:update(dt)
    self.padRight:update(dt)
    self.ball:update(dt)
    self.ball:bounce(self.padRight)
    self.ball:bounce(self.padLeft)

    local ball_status = self.ball:getOutOfBounds()
    if ball_status == "left" then
        self.scoreRight = self.scoreRight + 1
        self.ball = Ball()
    elseif ball_status == "right" then
        self.scoreLeft = self.scoreLeft + 1
        self.ball = Ball()
    end 

    if love.keyboard.isDown("escape") then
        love.window.setFullscreen(false, "desktop")
        local windowWidth = love.graphics.getWidth()
        self.padRight.x = windowWidth - 50
    end
end

function Game:draw()
    self.padLeft:draw()
    self.padRight:draw()
    self.ball:draw()

    love.graphics.print(self.scoreLeft .. " - " .. self.scoreRight, 350, 20, 0, 4, 4)
end

