# Sequence Detector (1011)

## Overview

This project implements a Mealy Finite State Machine (FSM) to detect the binary sequence:

1011

The detector continuously monitors the input stream and generates an output whenever the sequence is detected.

Overlapping sequence detection is supported.

---

## Sequence Example

Input:

1 0 1 1 0 1 1

Output:

0 0 0 1 0 0 1

---

## State Diagram

States Used:

- S0 : Initial State
- S1 : Detected '1'
- S2 : Detected '10'
- S3 : Detected '101'

When the next input bit is '1' in S3, the sequence 1011 is detected and output becomes HIGH.

---

## Inputs

| Signal | Description |
|----------|------------|
| clk | Clock Signal |
| rst | Reset Signal |
| din | Serial Input Data |

---

## Outputs

| Signal | Description |
|----------|------------|
| dout | Sequence Detection Output |

---

## Design Methodology

- Verilog HDL
- Mealy FSM
- Overlapping Detection

---

## Files

- sequence_detector.v
- stimuli.v
- README.md

---

## Applications

- Digital Communication Systems
- Pattern Recognition
- Protocol Monitoring
- Data Stream Analysis

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Simulation Testbench

---

## Author

Yatharth Pathak  
B.Tech Electronics & Communication Engineering
