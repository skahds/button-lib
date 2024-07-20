# button-lib
just a test for buttons in love2D
only for collision, does not have gui

add your path to the file
```lua
require(".../button")
```
put this inside your love.update() and insert in your mouse position
```lua
button.update(mouseX, mouseY)
```
## functions
these are the functions you can put in your codes.

adds a button with parameters
```lua
button.add_button(parameter)
```
<hr>

change a button's parameters if they are different from the new one
```lua
button.change_button(id, parameter)
```
<hr>

```lua
-- order is the index of the desired effect
button.change_button_effect(id, order, parameter)
```
<hr>

## parameters
- id : any var, leave empty for it to be set automatically from 1 to the next empty id
- shape : "rec" (rectangle) or "circ" (circle)
- x : int
- y : int
- effect : this needs to be made as a table and inside will have tables of the effects, not of the effect parameters (see example bellow)
- w : width (specific for rectangles)
- h : height (specific for rectangles)
- r : radius (specific for circles)

## effect parameters
these will be inside the effect
- effect.func : this will be called once the trigger is activated (effect.func())
- effect.args : this needs to be made as a table, leave nil if the effect.func does not need any argument
- effect.args[1], effect.args[2]... : this will be given if exist to effect.func(effect.args[1], ...)  
- mosueTrigger : same parameters as love.mouse.isDown(), defaults to 1
- type : currently has 3 options, "onClick" for when the mouse clicks it, "onHover" for when the mouse is on top of the button, and "onMouseLeave" for when the mouse is not on top of the button
- falser : this does not matter for "onClick" as it will be defaulted, only for "onMouseLeave" (or "onHover" if the mouse loads on top of it), having this as true means that it will not trigger the effect once loaded, already defaults to false

removes a button with specific id
```lua
button.remove_button(id)
```
<hr>

removes all buttons
```lua
button.remove_all_buttons()
```
<hr>

adds some settings
```lua
button.settings(settings)
```
<hr>

## settings

- globalButtonMap : true (already defaults to false), sets the buttonMap table to be global

## Example uses for button usage
this will add the button lib, make a rectangle shaped button in x position 50, y 50, have a widht of 100 and height of 100 and once clicked will do Add_num(10, 5), and once hovered will do Add_num(5)
```lua
    function love.load()
        require("button")

        button.add_button({id=1, shape="rec", x=50, y=50, w=100, h=100, effect={{
            type="onClick",
            func=Add_num,
            args={10, 5}},
            {
            type="onHover",
            func=Add_num,
            args={5}
            }}
            })
    end
```
<hr>

```lua
    -- somewhere inside love.load

    -- changes button of id 1 to have the x and y of 100 and 200
    button.change_button(1, {x=100, y=200})

    -- changes the second effect of button with id 1 to have the type to "onMouseLeave"
    button.change_button_effect(1, 2, {type="onMouseLeave"})
```