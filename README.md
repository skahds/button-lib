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
# functions
these are the functions you can put in your codes. in effect, put in functions as they will be called once pressed (has to be global). for triggerType, just empty it out
```lua
button.add_rec(x, y, w, h, effect, triggerType)
button.add_circle(x, y, r, effect, triggerType)
button.remove_all_buttons() --removes all buttons
```
