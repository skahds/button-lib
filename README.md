# button-lib
just a test for buttons in love2D

add your path to the file
```lua
require(".../button")
```
put this in your love.update() and insert in your mouse position
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
button.change_button(parameter)
```
<hr>

## parameters
- id : any var, leave empty for it to be set automatically from 1 to the next empty id
- shape : "rec" (rectangle) or "circ" (circle)
- x : int
- y : int
- triggerType : leave this out for now
- effect : this needs to be made as a table
- effect.func : this will be called once the trigger is activated (effect.func())
- effect.args : this needs to be made as a table, leave nil if the effect.func does not need any argument
- effect.args[1], effect.args[2]... : this will be given to effect.func(effect.args[1], ...)  
- mosueTrigger : same parameters as love.mouse.isDown(), defaults to 1
- w : width (specific for rectangles)
- h : height (specific for rectangles)

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
button.settings
```
<hr>

## settings

- globalButtonMap : true (already defaults to false), sets the buttonMap table to be global