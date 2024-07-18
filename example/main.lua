function love.load()
    require("button")
    number = 0

    mouseX  = love.mouse.getX()
    mouseY  = love.mouse.getY()
    buttonX = 50

    button.settings({globalButtonMap=true})
    button.add_button({id=1, shape="rec", x=50, y=50, w=100, h=100, effect={func=Add_num, args={5}}})
    button.add_button({id="a", shape = "circ", x = 300, y=300, r = 100, effect={func=Add_num, args={5, 5}}})

end

function love.update(dt)
    mouseX  = love.mouse.getX()
    mouseY  = love.mouse.getY()

    buttonX = buttonX + 50*dt

    button.update(mouseX, mouseY)
    button.change_button(1, {x=buttonX, effect={args={5, math.floor(buttonX/100)}}})
end

function love.draw()
    love.graphics.setBackgroundColor(0.3, 0.4, 0.5)

    love.graphics.rectangle("fill", buttonX, 50, 100, 100)
    love.graphics.circle("fill", 300, 300, 100)
    love.graphics.print(number)
end

function Add_num(...)
    for i, num in ipairs({...}) do
        number = number + num
    end

end

function love.keyreleased(key)
    if key == "escape" then
        love.event.quit()
    end
end
