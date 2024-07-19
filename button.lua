local buttonMap = {}
local mouse = {x=0, y=0}
button = {}

local reservedID = {0}
local unpack = table.unpack or unpack
local function distanceBetween(x1, x2, y1, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end

local function triggerEffect(effect)
    if effect.args ~= nil then
        effect.func(unpack(effect.args))
    elseif effect.func ~= nil then
        effect.func()
    end
end

function button.update(mouseX, mouseY)
    mouse.x = mouseX
    mouse.y = mouseY
    for i, obj in ipairs(buttonMap) do
        local activated = false
        if obj.shape == "rec" then
            if mouse.x >= obj.x and
            mouse.x <= obj.x+obj.w and
            mouse.y >= obj.y and
            mouse.y <= obj.y+obj.h then
                if obj.effect ~= nil then
                    activated = true
                else
                    activated = false
                end
            end
        end
        if obj.shape == "circ" then
            if distanceBetween(obj.x, mouse.x, obj.y, mouse.y) < obj.r then
                if obj.effect ~= nil then
                    activated = true
                else
                    activated = false
                end
            end
        end
        -- activated means the cursor is on top of the button, falser means it is yet to be pressed
        for _, effect in ipairs(obj.effect) do
            if activated == true then

            if effect.type == "onClick" then
                if love.mouse.isDown(obj.mouseTrigger) and effect.falser == false then
                    triggerEffect(effect)
                    effect.falser = true
                elseif not love.mouse.isDown(obj.mouseTrigger) then
                    effect.falser = false
                end
            elseif effect.type == "onHover" and effect.falser == false then
                triggerEffect(effect)
                effect.falser = true
            elseif effect.type == "onMouseLeave" then
                effect.falser = false
            end

            else
                if effect.type == "onMouseLeave" and effect.falser == false then
                    triggerEffect(effect)
                    effect.falser = true
                elseif effect.type ~= "onMouseLeave" then
                    effect.falser = false
                end
            end
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
    for _, effect in ipairs(parameter.effect) do
        effect.falser = effect.falser or false
    end
    local mouseTrigger = parameter.mouseTrigger or 1
    buttonTable.id = id
    buttonTable.mouseTrigger = mouseTrigger
    table.insert(buttonMap, buttonTable)
end

function button.change_button(id, parameter)
    for _, obj in ipairs(buttonMap) do
        if obj.id == id then
            -- changes values of obj to parameter
            for key, value in pairs(parameter) do
                -- Check if the value is a table (I DON'T ABOUT THIS PART NESTED TABLE PART)
                if type(value) == "table" and type(obj[key]) == "table" then
                    -- Merge nested tables
                    for nested_key, nested_value in pairs(value) do
                        obj[key][nested_key] = nested_value
                    end
                else
                    -- Directly assign non-table values
                    obj[key] = value
                end
            end
        end
    end
end

function button.remove_button(id)
    for i, obj in ipairs(buttonMap) do
        if obj.id == id then
            table.remove(buttonMap, i)
        end
    end
end

function button.remove_all_buttons()
    buttonMap = {}
end

function button.settings(settings)
    if settings.globalButtonMap == true then
        _G.buttonMap = buttonMap
    end
end