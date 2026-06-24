# Universal Shift Register

## Overview
A Universal Shift Register is a versatile register that can perform multiple operations:

- Hold data
- Shift Left
- Shift Right
- Parallel Load

This design is implemented using Verilog HDL and simulated in Xilinx Vivado.

---

## Features

| Mode | Operation |
|--------|----------|
| 00 | Hold Current Data |
| 01 | Shift Right |
| 10 | Shift Left |
| 11 | Parallel Load |

---

## Inputs

| Signal | Description |
|----------|------------|
| clk | Clock Signal |
| rst | Reset Signal |
| mode[1:0] | Operation Selection |
| serial_in_left | Serial Input for Left Shift |
| serial_in_right | Serial Input for Right Shift |
| parallel_in[3:0] | Parallel Data Input |

---

## Outputs

| Signal | Description |
|----------|------------|
| q[3:0] | Register Output |

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Testbench Simulation

---

## Files

- universal_shift_register.v
- stimuli.v
- README.md

---

## Applications

- Data Storage
- Serial Communication
- Data Transfer
- Digital Signal Processing

---

## Author

Yatharth Pathak  
B.Tech Electronics & Communication Engineering
