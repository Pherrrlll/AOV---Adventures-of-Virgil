-- AoV - Adventures of Virgil
-- Top-down 2D game built with LÖVE (https://love2d.org)

local virgil = {
    x = 0,
    y = 0,
    width = 48,
    height = 20,
    speed = 220,
}

function love.load()
    love.window.setTitle("AoV - Adventures of Virgil")
    love.graphics.setBackgroundColor(0.36, 0.62, 0.34)

    virgil.x = love.graphics.getWidth() / 2
    virgil.y = love.graphics.getHeight() / 2
end

function love.update(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("left", "a") then dx = dx - 1 end
    if love.keyboard.isDown("right", "d") then dx = dx + 1 end
    if love.keyboard.isDown("up", "w") then dy = dy - 1 end
    if love.keyboard.isDown("down", "s") then dy = dy + 1 end

    -- Normalise so diagonal movement isn't faster
    if dx ~= 0 and dy ~= 0 then
        dx, dy = dx * 0.7071, dy * 0.7071
    end

    virgil.x = virgil.x + dx * virgil.speed * dt
    virgil.y = virgil.y + dy * virgil.speed * dt

    -- Keep Virgil on screen
    local halfW, halfH = virgil.width / 2, virgil.height / 2
    virgil.x = math.max(halfW, math.min(love.graphics.getWidth() - halfW, virgil.x))
    virgil.y = math.max(halfH, math.min(love.graphics.getHeight() - halfH, virgil.y))
end

function love.draw()
    -- Placeholder dachshund until sprites exist
    love.graphics.setColor(0.45, 0.26, 0.13)
    love.graphics.rectangle(
        "fill",
        virgil.x - virgil.width / 2,
        virgil.y - virgil.height / 2,
        virgil.width,
        virgil.height,
        8, 8
    )

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("WASD / arrow keys to move, Esc to quit", 10, 10)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
