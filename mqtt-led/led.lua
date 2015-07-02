ip = wifi.sta.getip()
m = mqtt.Client("clientid", 120)
pin=4
gpio.mode(pin,gpio.OUTPUT)
gpio.write(pin,gpio.LOW)
m:lwt("/lwt", wifi.sta.getmac(), 0, 0)
m:on("offline", function(con)
    print ("reconnecting...")
    tmr.alarm(1, 10000, 0, function()
        m:connect(mqtt_host, mqtt_port, 0)
    end)
end)
m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)
m:on("message", function(conn, topic, data)
    print(topic .. ":" )
    if data ~= nil then
        if (data=="on") then 
            gpio.write(pin,gpio.HIGH) 
        else 
            if (data=="off") then 
                gpio.write(pin,gpio.LOW)
            end
        end

        m:publish(topic_pub,data,0,0, function(conn) print("sent") end)
    end
end)
tmr.alarm(0, 1000, 1, function()
    if wifi.sta.status() == 5 then
        tmr.stop(0)
        m:connect(mqtt_host, mqtt_port, 0, function(conn)
            print("connected")
            m:subscribe(topic_sub,0, function(conn)
                m:publish(topic_pub,ip,0,0, function(conn) print("sent") end)
            end)
        end)
    end
end)
