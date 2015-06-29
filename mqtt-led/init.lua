print("Setting up WIFI...")
dofile("settings.lua")
wifi.setmode(wifi.STATION)
wifi.sta.config(ssid,passwd)
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function() 
if wifi.sta.getip()== nil then 
print("IP unavaiable, Waiting...") 
else 
tmr.stop(1)
print("Config done, IP is "..wifi.sta.getip())
dofile("led.lua")
end 
end)
