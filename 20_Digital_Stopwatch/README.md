# ⏱️ Digital Stopwatch (MM:SS)

## 📌 Overview

This project implements a Digital Stopwatch using Verilog HDL.

The design is fully synchronous and uses a single clock domain. A clock divider generates a one-second enable pulse, which is used to increment the stopwatch.

---

## ✨ Features

- Start
- Pause
- Resume
- Reset
- MM:SS Format
- Parameterized Clock Frequency
- Single Clock Design
- Finite State Machine (FSM)
- Vivado Compatible

---

## 📂 Project Files

- stopwatch.v
- stopwatch_tb.v
- waveform.png

---

## 🧠 Block Diagram

```

```
               +----------------------+
               |  Tick Generator      |
Clock -------->| (1 Second Pulse)     |
               +----------+-----------+
                          |
                          v
               +----------------------+
               |        FSM           |
               | IDLE                |
               | RUNNING             |
               | PAUSED              |
               +----------+-----------+
                          |
                          v
               +----------------------+
               | Seconds Counter      |
               +----------+-----------+
                          |
                 seconds == 59 ?
                          |
                 No ------+
                          |
                         Yes
                          |
                          v
               +----------------------+
               | Minutes Counter      |
               +----------------------+
```

---

## 🔄 FSM

```
           START
IDLE -----------------> RUNNING
 ^                         |
 |                         |
 | RESET                   | PAUSE
 |                         |
 +--------------------- PAUSED
              START
```

---

## ⚙️ Working

1. Reset initializes all registers.
2. Start moves the FSM to RUNNING.
3. The Tick Generator generates one pulse every second.
4. Seconds increment from 00 to 59.
5. After 59 seconds, minutes increment.
6. Pause freezes the stopwatch.
7. Start resumes counting.

---

## 🖥️ Simulation

The project has been verified in Xilinx Vivado.

Simulation confirms:

- Correct FSM operation
- Correct Tick Generation
- Correct Seconds Counter
- Correct Minutes Counter

---

## 🛠️ Tools Used

- Verilog HDL
- Xilinx Vivado 2025.2

---

## 📚 Concepts Covered

- Verilog HDL
- FSM Design
- Clock Divider
- Clock Enable
- Counters
- Parameterization
- Synchronous Design

---

## 🚀 Future Improvements

- HH:MM:SS Stopwatch
- Seven Segment Display
- Lap Timer
- BCD Counter
- FPGA Implementation
