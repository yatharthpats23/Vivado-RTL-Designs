# ⭐ Project 21: Seven-Segment Display Driver

## Overview

This project implements a seven-segment display decoder using Verilog HDL.

The design converts a 4-bit binary input representing decimal digits 0–9 into a 7-bit output that controls segments a–g of a common-cathode seven-segment display.

## Features

- Displays decimal digits 0–9
- 4-bit binary input
- 7-bit segment output
- Pure combinational logic
- No clock or reset required
- Invalid inputs 10–15 turn all segments OFF
- Verified using Vivado Behavioral Simulation

## Block Diagram

```text
      digit[3:0]
           |
           v
+-----------------------+
| Seven-Segment Decoder |
|                       |
|   Combinational Logic |
+-----------------------+
           |
           v
       seg[6:0]
    {a,b,c,d,e,f,g}
