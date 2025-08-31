function love.keypressed(key)
    if key == "right" then
        selectedOption = selectedOption + 1
        if selectedOption > #menuOptions then
            selectedOption = 1
        end
    elseif key == "left" then
        selectedOption = selectedOption - 1
        if selectedOption < 1 then
            selectedOption = #menuOptions
        end
    elseif key == "return" or key == "kpenter" then
        local action = menuOptions[selectedOption]
        if action == "love" then
            print("Love action triggered!")
            -- Add love action code here
        elseif action == "feed" then
            print("Feed action triggered!")
            -- Add feed action code here
        elseif action == "play" then
            print("Play action triggered!")
            -- Add play action code here
        end
    end
end
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    corgi = love.graphics.newImage("/assets/corgi.png")

    love.graphics.setBackgroundColor(0.41, 0.8, 0.94) -- Set a sky-blue background color

    menuOptions = {"love", "feed", "play"}
    selectedOption = 1
end

function love.update(dt)
    -- Update game state here
end

function love.draw()
    -- Center the corgi image on screen
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    local corgiWidth = corgi:getWidth() * 5
    local corgiHeight = corgi:getHeight() * 5
    local corgiX = (screenWidth - corgiWidth) / 2
    local corgiY = (screenHeight - corgiHeight) / 2 - 50 -- Offset up a bit to make room for buttons

    love.graphics.draw(corgi, corgiX, corgiY, 0, 5)

    -- Draw buttons horizontally at the bottom
    local buttonWidth = 120
    local buttonHeight = 40
    local spacing = 20
    local totalWidth = #menuOptions * buttonWidth + (#menuOptions - 1) * spacing
    local startX = (screenWidth - totalWidth) / 2
    local startY = screenHeight - buttonHeight - 50 -- 50 pixels from bottom

    for i, option in ipairs(menuOptions) do
        local x = startX + (i - 1) * (buttonWidth + spacing)
        if i == selectedOption then
            love.graphics.setColor(1, 1, 0) -- Yellow for selected
        else
            love.graphics.setColor(1, 1, 1) -- White for others
        end
        love.graphics.rectangle("fill", x, startY, buttonWidth, buttonHeight, 10, 10)
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf(option, x, startY + 10, buttonWidth, "center")
    end
    love.graphics.setColor(1, 1, 1) -- Reset color
end
