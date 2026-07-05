# Project 22: Stopwatch + Seven-Segment Display

## Overview

This project integrates a digital stopwatch with a seven-segment display driver using hierarchical RTL design.

The stopwatch generates a 4-bit count from 0 to 9. This count is passed through an internal wire to the seven-segment display driver, which converts the count into the corresponding seven-segment output pattern.

## Block Diagram

Clock, Reset, Start
        |
        v
+------------------+
|    Stopwatch     |
+------------------+
        |
     count[3:0]
        |
        v
+------------------+
| Seven-Segment    |
| Display Driver   |
+------------------+
        |
      seg[6:0]

## Modules

### stopwatch.v

- Implements stopwatch counting logic
- Counts from 0 to 9
- Supports reset and start/pause control
- Uses a configurable `DIVIDER` parameter

### seven_segment.v

- Accepts a 4-bit digit
- Converts the digit into a 7-bit segment pattern

### stopwatch_display.v

- Top-level integration module
- Instantiates the stopwatch and seven-segment modules
- Uses an internal wire to connect both modules
- Passes the `DIVIDER` parameter to the stopwatch

### stopwatch_display_tb.v

- Generates the clock signal
- Tests reset operation
- Tests start and pause operation
- Uses a small divider value for faster simulation

## Key Concepts Learned

- Hierarchical RTL design
- Module instantiation
- Internal wire connections
- Parameterized modules
- Parameter passing between hierarchy levels
- Integration testing
- Seven-segment display decoding

## Simulation Result

The simulation verifies that:

- Reset initializes the stopwatch to 0
- The stopwatch counts when `start = 1`
- The seven-segment output changes with the count
- The stopwatch pauses when `start = 0`
- The final displayed value remains stable after pausing

Example output sequence:

`40 -> 79 -> 24 -> 30 -> 19 -> 12`

These hexadecimal values represent the seven-segment patterns for digits:

`0 -> 1 -> 2 -> 3 -> 4 -> 5`

## Tools Used

- Verilog HDL
- AMD Vivado
- Behavioral Simulation
