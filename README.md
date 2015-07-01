# ESP-12 / Expérimentations

## Microcontrôleur ESP8266 / ESP-12
### Schéma
![Overview](https://github.com/ksahnine/nodemcu-projects/raw/master/hardware/img/pin_map-esp-12-small.png "Overview")
### Mode flash
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

### Firmware nodeMCU
Testé avec la version [0.9.5 du 17/01/2015](https://github.com/nodemcu/nodemcu-firmware/blob/master/pre_build/0.9.5/nodemcu_20150107.bin).

## Exemples de code
### LCD
* Câblage [LCM1602](http://www.ebay.fr/itm/New-Character-LCD-Module-Display-LCM-1602-16X2-HD44780-Blue-Blacklight-/181090708166?pt=LH_DefaultDomain_0&hash=item2a29d8eac6) (module I2C) :
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