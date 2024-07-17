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

removes all buttons
```lua
button.remove_all_buttons()
```
<hr>

## parameters
- id : any var, leave empty for it to be set automatically from 1 to the next empty id
- shape : "rec" (rectangle) or "circ" (circle)
- x : int
- y : int
- triggerType : leave this out for now
- effect : add a callable function (has to be global)
- mosueTrigger : same parameters as loev.mouse.isDown(), defaults to 1
- w : width (specific for rectangles)
- h : height (specific for rectangles)