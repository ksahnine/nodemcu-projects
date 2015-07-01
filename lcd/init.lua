i2c.setup(0, 4, 5, i2c.SLOW)
lcd = dofile("lcd1602.lua")()
lcd.put(lcd.locate(0, 5), "Hello, kad!")
function notice() print(node.heap()); lcd.run(0, "Bienvenue! Welcome!", 150, 1, notice) end; notice()
