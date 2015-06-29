wifi.setmode(wifi.STATION)
wifi.sta.config("foobar","XXXXXXXXXXXX")
ip = wifi.sta.getip()
m = mqtt.Client("clientid", 120)
pin=4
gpio.mode(pin,gpio.INT)
function tilt(level)
    if level == 1 then 
        gpio.trig(pin, "down") 
        --m:publish("/topic/esp","down",0,0, function(conn) print("sent") end)
    else 
        gpio.trig(pin, "up") 
        --m:publish("/topic/esp","up",0,0, function(conn) print("sent") end)
    end
end

m:lwt("/lwt", wifi.sta.getmac(), 0, 0)
m:on("offline", function(con)
    print ("reconnecting...")
    tmr.alarm(1, 10000, 0, function()
        m:connect("192.168.0.22", 1883, 0)
    end)
end)
m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)
m:on("message", function(conn, topic, data)
    print(topic .. ":" )
    if data ~= nil then
        if (data=="/led/on") then 
            gpio.write(pin,gpio.HIGH) 
        else 
            gpio.write(pin,gpio.LOW)
        end

        m:publish("/topic/esp",data,0,0, function(conn) print("sent") end)
    end
end)
tmr.alarm(0, 1000, 1, function()
    if wifi.sta.status() == 5 then
        tmr.stop(0)
        m:connect("192.168.0.22", 1883, 0, function(conn)
            print("connected")
            m:subscribe("/topic",0, function(conn)
                m:publish("/topic/esp","ready",0,0, function(conn) print("sent") end)
                --gpio.tilt(pin, "down",motion)
            end)
        end)
    end
end)
