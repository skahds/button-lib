local buttonMap = {}
local mouse = {x=0, y=0}
button = {}

local reservedID = {0}
local function distanceBetween(x1, x2, y1, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end

local function assignTrigger(trigger, falser)
    if trigger == "press1" then
        if falser == false then
            return "falserActivate"
        end
        -- return true
    end
end

function button.update(mouseX, mouseY)
    mouse.x = mouseX
    mouse.y = mouseY
    for i, obj in ipairs(buttonMap) do
        if love.mouse.isDown(obj.mouseTrigger) then

        local trigger = obj.trigger
        local assignedTrigger = assignTrigger(trigger, obj.falser)
        local activated = false
        if assignedTrigger ~= false and obj.falser == false then
            if obj.shape == "rec" then
                if mouse.x >= obj.x and
                mouse.x <= obj.x+obj.w and
                mouse.y >= obj.y and
                mouse.y <= obj.y+obj.h then
                    if obj.effect ~= nil then
                        activated = true
                    end
                end
            end
            if obj.shape == "circ" then
                if distanceBetween(obj.x, mouse.x, obj.y, mouse.y) < obj.r then
                    if obj.effect ~= nil then
                        activated = true
                    end
                end
            end
        end
        if activated == true then
            obj.effect()
            if assignedTrigger == "falserActivate" then
                obj.falser = true
            end
        end

        else
            obj.falser = false 
        end
    end


end

function button.add_button(parameter)
    local buttonTable = parameter
    local id = parameter.id
    if parameter.id == nil then
        id = #reservedID
        table.insert(reservedID, id)
    end

    local mouseTrigger = parameter.mouseTrigger or 1
    local trigger = parameter.triggerType or "press1"
    buttonTable.trigger = trigger
    buttonTable.id = id
    buttonTable.falser = false
    buttonTable.mouseTrigger = mouseTrigger
    table.insert(buttonMap, buttonTable)
end

function button.change_button(id, parameter)
    for _, obj in ipairs(buttonMap) do
        if obj.id == id then
            -- changes values of obj to parameter
            for key, value in pairs(parameter) do
                obj[key] = value
            end
        end
    end
end


function button.remove_all_buttons()
    buttonMap = {}
end