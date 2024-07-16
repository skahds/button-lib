local buttonMap = {}
local mouse = {x=0, y=0}
button = {}
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
    if love.mouse.isDown(1) or love.mouse.isDown(2) or love.mouse.isDown(3) then


    mouse.x = mouseX
    mouse.y = mouseY
    for i, obj in ipairs(buttonMap) do
        -- add a new variable to the obj and make it the falser, if the var is true then the button won't be pressed

        local trigger = obj.trigger
        local assignedTrigger = assignTrigger(trigger, obj.falser)
        local activated = false
        if assignedTrigger ~= false and obj.falser == false then

            if obj[1] == "rec" then
                if mouse.x >= obj.x and
                mouse.x <= obj.x+obj.w and
                mouse.y >= obj.y and
                mouse.y <= obj.y+obj.h then
                    if obj.effect ~= nil then
                        activated = true
                    end
                end
            end
            if obj[1] == "circ" then
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
    end

    else
        for i, obj in ipairs(buttonMap) do
            obj.falser = false 
        end
    end
end

local function assignTriggerType(triggerType)
    if triggerType == nil then
        return "press1"
    end
end

function button.add_rec(x, y, w, h, effect, triggerType)
    local trigger = triggerType
    trigger = assignTriggerType(triggerType)


    table.insert(buttonMap, {"rec",x=x, y=y, w=w, h=h, effect=effect, trigger=trigger, falser=false})
end

function button.add_circle(x, y, r, effect, triggerType)
    local trigger = triggerType
    trigger = assignTriggerType(triggerType)


    table.insert(buttonMap, {"circ",x=x, y=y, r=r, effect=effect, trigger=trigger, falser=false})
end

function button.remove_all_buttons()
    buttonMap = {}
end