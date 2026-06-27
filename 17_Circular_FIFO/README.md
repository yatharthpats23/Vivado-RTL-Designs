# Circular FIFO (First In First Out)

## Description

This project implements an **8×8 Synchronous Circular FIFO** using Verilog HDL.

The FIFO stores data in the order it is received and outputs data in the same order (First In First Out). It supports write, read, simultaneous read/write operations, and uses circular pointers for efficient memory utilization.

---

## Features

- 8-bit Data Width
- 8 Memory Locations
- Synchronous Design
- Circular Write Pointer
- Circular Read Pointer
- Full Flag
- Empty Flag
- Simultaneous Read & Write Support
- Synthesizable RTL Design

---

## FIFO Architecture

```
          +-----------------------+
Data In ->|                       |
Write --> |      FIFO Memory      | --> Data Out
Read ---->|        (8 × 8)        |
          +-----------------------+
              ↑             ↑
           Write Ptr     Read Ptr
```

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| rst | Active High Reset |
| wr_en | Write Enable |
| rd_en | Read Enable |
| data_in[7:0] | Input Data |

---

## Outputs

| Signal | Description |
|---------|-------------|
| data_out[7:0] | Output Data |
| full | FIFO Full Flag |
| empty | FIFO Empty Flag |

---

## FIFO Operations

### Write

- Data is written when:
  - `wr_en = 1`
  - `full = 0`

### Read

- Data is read when:
  - `rd_en = 1`
  - `empty = 0`

### Simultaneous Read & Write

- One element is read.
- One element is written.
- FIFO count remains unchanged.

---

## Circular Pointer Operation

```
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7
↑                             ↓
└─────────────────────────────┘
```

---

## Simulation Results

The simulation verifies:

- Reset Operation
- Write Operation
- Read Operation
- FIFO Full Condition
- FIFO Empty Condition
- Simultaneous Read and Write
- Circular Pointer Wrap-around

---

## Files Included

- `fifo.v` — FIFO Design
- `stimuli.v` — Testbench
- `waveform.png` — Simulation Result
- `README.md`

---

## Tool Used

- Verilog HDL
- Xilinx Vivado 2025.2

---

## Concepts Learned

- FIFO Memory
- Circular Buffer
- Write Pointer
- Read Pointer
- Occupancy Counter
- Full & Empty Flag Generation
- Sequential Logic
- RTL Design
- FSM-Based Hardware Design Concepts

---

## Author

**Yatharth Pathak**
