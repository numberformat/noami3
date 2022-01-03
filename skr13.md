# SKR 1.3

This page describes how to setup a Prusa i3 clone printer with the 32 bit SKR 1.3 board with Marlin firmware. The instructions may work with the 1.4 or later board.

## Build Details

My current setup is as follows:

* Board: SKR 1.3
* XYZ Steppers: TMC2130 v3.0 SPI mode
* E0 Steppers: DRV8825

## Tips:

Don't bother uploading the firmware via usb directly to the board. I had issues with my connection and it often corrupted the sd card. Take out the sd card from the printer and load it into your computer to update firmware. Also format the card each time.

## Stepper driver info

### Max steppings

```
4988 has 1/16 stepping
DRV8825 has 1/32 stepping
TMC2130 has 1/256 stepping

A4988 - vref: current limit = vref x 2.5,  0.8v - 2 amp stepper

MS0-2 settings ( jumpers start from MS0 at the top to bottom )
111 for 1/16 step

DRV8825 - vref: current limit = vref x 2, 1v - 2 amp stepper with heat sink to be on safe side use 0.8v

MS0-2 settings
001 for 1/16 step
111 for 1/32 step

TMC2130 vref: don't bother with the pcb because this value is software controlled.
```


## Setup instructions

```
Jumper settings

The XY axis jumpers should all be installed and on the left side for the TMC 2130 v3 SPI mode

Right above the limit switch headers The XST and YST jumpers should be ON for all the spots that you have the TMC2130 installed this enables the SPI communication. The other stepper please make sure the jumpers are off.

Switch the INT +5V USB jumper to usb.

connect the usb cable and you should see a new drive with FIRMWARE file in it. Check the date of it. after the procedure below is done that file will be updated with the latest firmware.

Download marlin firmware and then open Configuration.h

We need to find the SKR 1.3 board so we can update it in the configuration. The board name may change so check out what its called in boards.h

search for skr 1.3 motherboard, copy the board name

replace board_ramps_14_EFD with the pasted example: BOARD_BTT_SKR_V1_3

change Serial port 0 to -1

search for X_DRIVER_TYPE and replace with TMC2130 and

#define X_DRIVER_TYPE  TMC2130
#define Y_DRIVER_TYPE  TMC2130
#define Z_DRIVER_TYPE  DRV8825
#define Z2_DRIVER_TYPE TMC2130

#define E0_DRIVER_TYPE DRV8825

#define REPRAP_DISCOUNT_SMART_CONTROLLER
#define SDSUPPORT

#define EEPROM_SETTINGS

search for default axis

double the stepping for the z because we are using DRV drivers from 4000 to 8000

#define DEFAULT_AXIS_STEPS_PER_UNIT   { 80, 80, 8000, 500 }

search for AXIS_IS_TMC in configuration_adv.h

Find the current for your stepper motor.

change 800 -> 600

change y as well

leave microsteps as 16

search for TMC_USE_SW and uncomment the line

search for MONITOR_DRIVER_STATUS and uncomment

search for TMC_debug

search for SENSORLESS_HOMING and uncomment

#define HOMING_BUMP_MM      { 0, 0, 0 }

#define HYBRID_THRESHOLD

Customize X_STALL_SENSITIVITY based on what you want

4 is a good value for Y axis
4 is a good value for X axis

M914 X4 Y2

Z to set the stall threshold at runtime

change the Bed thermister type

#define TEMP_SENSOR_BED 1

open platformio.ini and set the default_envs

default_envs = LPC1768

press the upload the button.

disconnect usb then re-connect the firmware.bin file will disappear and the FIRMWARE file date will be most recent.

Switch the INT +5V USB jumper back to original

Connect the stepper motors.
Connect the board to a 12 or 24v supply

open pronterface and connect using 250000

type M122
```

## Filament Runout sensor

- reference:
  - https://www.youtube.com/watch?v=CDz2IxxINBE
  - https://www.youtube.com/watch?v=gwHpXaj_6xE
- Enable FILAMENT_RUNOUT_SENSOR
- Enable ADVANCED_PAUSE_FEATURE Configuration_adv.h to enable M600
- Enable NOZZLE_PARK_FEATURE in configuration.h
- #define NOZZLE_PARK_POINT { (X_MAX_POS - 10), (Y_MIN_POS + 10), 20 }

check src/pins/your board for the pin assignment.

For the SKR 1.3 pin 28 is x-max.

To check status of the runout sensor

M412 - get or set filament runout status and distance.

Open pronterface and heat the hot end to temperature.

To test the runout feature type M600 and follow the instructions on the printer screen. If everything is working it will detect the filament and allow you to load it.

### Print Fans

Test the hot end fan by hooking it up to the 12/24 v header on the top left corner of the board. The hot end fan should be on all the time.

Test the print cooling fan by issuing `M106 S200`

Test the hot end and bed thermisters. There are different types of thermisters out there. Adjust the type in the firmware if they are not showing the correct temperature.

## Quality checks

* Check thermister type and connectivity
* Test the Hot extruder and bed heaters
* Thermal runaway on extruder and bed by disconnecting the thermister when heat is on
* Stepper direction on XYZ and Z2
* Endstop sensitivity by homing and making sure belts don't slip when reaching endstop
* Steps / mm calibration
* Display and controller
* Filament runout sensor and print resume function by cutting the filament during a print

## G Code Quick reference
Using Pronterface

1. Home 3D printer
1. M851 Z0 - Reset Z0Offset
1. M500 - Store setting to eeprom
4. M501 - Set active parameters
5. M503 - Display Active Parameters
6. G28 Z - Home Z Axis
7. G1 F60 Z0 - Move nozzle to true 0 offset
8. M211 S0 - Switch off soft endstops
9. Move nozzle towards bed slowly until the paper can barely move
10. Take note of the Z on the printer display (take that number and add the measurment of the calibration sheet or device used)
11. M851 Z X.XX (X.XX being your z offset achieved)
12. M211 S1 - Enable Soft Endstops
13. M500 - Save settings to Eeprom
14. M501 - Set Active Parameters
15. M503 - display current settings
