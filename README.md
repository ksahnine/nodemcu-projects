# ESP-12 / Expérimentations

## Microcontrôleur ESP8266 / ESP-12
Ce repository héberge le code source de différents projets et expérimentations réalisés sur des microcontrôleurs ESP d'[Espressif Systems](http://espressif.com/) (principalement ESP-12).

Les projets sont développés en Lua sur le firmware [NodeMCU](https://github.com/nodemcu/nodemcu-firmware)
 
### 1. Schéma
![Overview](https://github.com/ksahnine/nodemcu-projects/raw/master/hardware/img/pin_map-esp-12-small.png "Overview")
### 2. Mode flash
<table>
  <tr>
    <td>GPIO0</td><td>LOW</td>
  </tr>
  <tr>
    <td>GPIO2</td><td>HIGH</td>
  </tr>
  <tr>
    <td>GPIO15</td><td>LOW</td>
  </tr>
  <tr>
    <td>CH_PD</td><td>HIGH</td>
  </tr>
  <tr>
    <td>VCC</td><td>+3,3V (batterie)</td>
  </tr>
  <tr>
    <td>GND</td><td>GND (batterie)</td>
  </tr>
</table>

### 3. Firmware nodeMCU
Testé avec la version [0.9.5 du 17/01/2015](https://github.com/nodemcu/nodemcu-firmware/blob/master/pre_build/0.9.5/nodemcu_20150107.bin).

## Exemples de code
### 1. [Enregistreur de température](https://github.com/ksahnine/nodemcu-projects/tree/master/humidity-temp-logger)
Enregistreur de température et d'humidité publiant les relevés sur [ThingSpeak](https://thingspeak.com/) :
![ThingSpeak](https://github.com/ksahnine/nodemcu-projects/raw/master/hardware/img/ThingSpeak.png)

* Branchement du capteur d'humidité et de température DHT11 :
<table>
  <tr>
    <th>DHT11</th><th>ESP</th>
  </tr>
  <tr>
    <td>Pin 1</td><td>VCC</td>
  </tr>
  <tr>
    <td>Pin 2</td><td>GPIO2</td>
  </tr>
  <tr>
    <td>Pin 4</td><td>GND</td>
  </tr>
</table>
![DHT11](https://github.com/ksahnine/nodemcu-projects/raw/master/hardware/img/dht11.png) 

* Configuration du module ESP dans le fichier ```settings.lua```
  * ```ssid``` : SSID du réseau WiFi
  * ```passwd``` : mot de passe du réseau WiFi
  * ```apikey``` : Clé API du channel ThingSpeak où publier
  * ```publish_delay``` : intervalle entre 2 relevés de température (en millis)
  

### 2. [MQTT LED](https://github.com/ksahnine/nodemcu-projects/tree/master/mqtt-led)

### 3. [LCD](https://github.com/ksahnine/nodemcu-projects/tree/master/lcd)
* Branchement de l'afficheur LCD [LCM1602](http://www.ebay.fr/itm/New-Character-LCD-Module-Display-LCM-1602-16X2-HD44780-Blue-Blacklight-/181090708166?pt=LH_DefaultDomain_0&hash=item2a29d8eac6) (module I2C) :
<table>
  <tr>
    <td>SDA</td><td>GPIO2</td>
  </tr>
  <tr>
    <td>SCL</td><td>GPIO14</td>
  </tr>
  <tr>
    <td>GND</td><td>GND</td>
  </tr>
  <tr>
    <td>VCC</td><td>+5V</td>
  </tr>
</table>
* [Code source](https://github.com/ksahnine/nodemcu-projects/tree/master/lcd)

### 4. [MQTT Tilt](https://github.com/ksahnine/nodemcu-projects/tree/master/mqtt-tilt-sensor)
