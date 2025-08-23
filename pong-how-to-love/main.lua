function love.load()
    love.window.setFullscreen(true, "desktop")
    Object = require "classic"
    require "game"
    require "entity"
    require "pad"
    require "ball"
    
    game = Game()

end

function love.update(dt)
    game:update(dt)
end

function love.draw()
    game:draw()
end