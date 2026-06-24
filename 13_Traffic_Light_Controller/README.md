# Traffic Light Controller

## Description
A Finite State Machine (FSM) based Traffic Light Controller implemented in Verilog. The controller cycles through RED, GREEN, and YELLOW states on each clock pulse.

## State Sequence

RED → GREEN → YELLOW → RED

## Inputs

- `clk` : Clock signal
- `rst` : Reset signal

## Outputs

- `red` : Red light output
- `green` : Green light output
- `yellow` : Yellow light output

## State Encoding

| State | Binary |
|---------|---------|
| RED | 00 |
| GREEN | 01 |
| YELLOW | 10 |

## Working

- On reset, the controller starts in the RED state.
- After one clock cycle, it changes to GREEN.
- After the next clock cycle, it changes to YELLOW.
- After the next clock cycle, it returns to RED.
- The sequence repeats continuously.

## Files

- `traffic_light_controller.v` - Main Verilog design
- `stimuli.v` - Testbench
- `traffic_light_waveform.png` - Simulation result

## Tool Used

- Vivado 2025.2

## Simulation Result

Behavioral simulation verifies the correct sequence:

RED → GREEN → YELLOW → RED

## Author

Yatharth Pathak
ECE Engineering Student
