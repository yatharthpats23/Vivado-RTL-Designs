# UART Transmitter (UART TX)

## Description

A UART (Universal Asynchronous Receiver Transmitter) Transmitter implemented in Verilog HDL.

The transmitter sends 8-bit parallel data serially through the TX line using a Finite State Machine (FSM).

## UART Frame Format

```text
Start Bit | Data Bits (LSB First) | Stop Bit
     0    |      8 Bits           |    1
```

Example:

```text
Data = 10110010

Transmitted as:

0 | 0 1 0 0 1 1 0 1 | 1
```

## Inputs

- `clk` : Clock signal
- `rst` : Reset signal
- `start` : Starts transmission
- `data_in[7:0]` : Data to be transmitted

## Output

- `tx` : Serial transmit line

## FSM States

| State | Description |
|---------|-------------|
| IDLE | Wait for transmission request |
| START | Send start bit (0) |
| DATA | Send 8 data bits |
| STOP | Send stop bit (1) |

## Working

1. UART remains in IDLE state with `tx = 1`.
2. When `start = 1`, transmission begins.
3. A start bit (`0`) is transmitted.
4. Data bits are transmitted one by one (LSB first).
5. A stop bit (`1`) is transmitted.
6. UART returns to IDLE state.

## Files

- `uart_tx.v`
- `stimuli.v`
- `waveform.png`

## Tool Used

- Xilinx Vivado 2025.2
- Verilog HDL

## Author

Yatharth Pathak
