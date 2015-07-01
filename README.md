# ESP-12 / Expérimentations

## Microcontrôleur ESP8266 / ESP-12
![Overview](https://github.com/ksahnine/nodemcu-projects/raw/master/hardware/img/pin_map-esp-12-small.png "Overview")

## Exemples de code
### LCD
* Câblage [LCM1602](http://www.ebay.fr/itm/New-Character-LCD-Module-Display-LCM-1602-16X2-HD44780-Blue-Blacklight-/181090708166?pt=LH_DefaultDomain_0&hash=item2a29d8eac6) (module I2C) :
<table>
  <tr>
    <td>SDA</td><td>GPIO02</td>
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
