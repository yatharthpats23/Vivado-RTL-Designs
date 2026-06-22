# 4:1 Multiplexer

## Description
A 4:1 Multiplexer selects one of four inputs and forwards it to the output based on the select lines.

## Truth Table

| S1 | S0 | Output |
|----|----|--------|
| 0  | 0  | I0 |
| 0  | 1  | I1 |
| 1  | 0  | I2 |
| 1  | 1  | I3 |

## Inputs
- i0
- i1
- i2
- i3
- s[1:0]

## Output
- y

## Files
- mux_4to1.v
- stimuli.v
- waveform.png

## Tool
Vivado 2025.2

## Author
Yatharth Pathak
