# Johnson Counter

## Description
A 4-bit Johnson Counter implemented using Verilog HDL.

The complemented output of the last flip-flop is fed back to the input of the first flip-flop.

## Sequence

0000 → 0001 → 0011 → 0111 → 1111 → 1110 → 1100 → 1000 → 0000

## Inputs
- clk
- rst

## Output
- q[3:0]

## Files
- johnson_counter.v
- stimuli.v
- waveform.png

## Tool Used
- Vivado 2025.2
- Verilog HDL

## Author
Yatharth Pathak
