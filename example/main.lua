function love.load()
    require("button")
    number = 0

    mouseX  = love.mouse.getX()
    mouseY  = love.mouse.getY()

    button.add_button({shape="rec", x=50, y=50, w=100, h=100, effect=Add_num})
end

function love.update(dt)
    mouseX  = love.mouse.getX()
    mouseY  = love.mouse.getY()
    button.update(mouseX, mouseY)
end

function love.draw()
    love.graphics.rectangle("fill", 50, 50, 100, 100)
    love.graphics.print(number)
end

function love.keyreleased(key)
    if key == "escape" then
        love.event.quit()
    end
end

function Add_num()
    number = number+1
end