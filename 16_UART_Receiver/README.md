# UART Receiver (UART RX)

## Description

A UART (Universal Asynchronous Receiver Transmitter) Receiver implemented in Verilog HDL.

The receiver converts serial data received on the RX line into 8-bit parallel data using a Finite State Machine (FSM).

## UART Frame Format

```text
Start Bit | Data Bits (LSB First) | Stop Bit
     0    |      8 Bits           |    1
```

Example:

```text
Received on RX:

0 | 0 1 0 0 1 1 0 1 | 1

Output:

10110010
```

## Inputs

- `clk` : Clock signal
- `rst` : Reset signal
- `rx` : Serial input data

## Outputs

- `data_out[7:0]` : Received 8-bit parallel data
- `done` : Indicates successful reception of one complete byte

## FSM States

| State | Function |
|--------|----------|
| IDLE | Wait for Start Bit |
| START | Detect Start Bit |
| DATA | Receive 8 data bits |
| STOP | Receive Stop Bit and assert `done` |

## Working

1. The receiver waits in the IDLE state.
2. When the Start Bit (`0`) is detected, it enters the DATA state.
3. Eight data bits are received one by one (LSB first).
4. Each received bit is stored in `data_out[bit_count]`.
5. After all 8 bits are received, the STOP state is entered.
6. The `done` signal is asserted, indicating successful reception.
7. The receiver returns to the IDLE state, ready for the next frame.

## Files

- `uart_rx.v` – UART Receiver module
- `stimuli.v` – Testbench
- `waveform.png` – Simulation waveform
- `README.md`

## Tool Used

- Verilog HDL
- Xilinx Vivado 2025.2

## Learning Outcomes

- Finite State Machine (FSM)
- Serial-to-Parallel Data Conversion
- UART Communication
- Bit Counter Implementation
- Sequential Logic Design

## Author

**Yatharth Pathak**
