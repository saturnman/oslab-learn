#ifndef BASEADDR_H
#define BASEADDR_H
/*
https://www.raspberrypi.org/documentation/hardware/raspberrypi/peripheral_addresses.md
*/
/*
ARM-side physical address where peripherals are mapped,
0x20000000 on Pi Zero, Pi Zero W, and the first generation of the Raspberry Pi and Compute Module
*/
//#define PBASE 0x20000000 
/*
ARM-side physical address where peripherals are mapped,
0x3f000000 on the Pi 2, Pi 3 and Compute Module 3.
*/
#define PBASE 0x3F000000

#endif