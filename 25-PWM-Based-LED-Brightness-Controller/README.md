# PWM-Based LED Brightness Controller

## Project 25 – Vivado RTL Design Roadmap

This project implements a PWM-based LED brightness controller using Verilog HDL.

A 2-bit `brightness_level` input selects one of four LED brightness levels. The selected level is converted into a duty-cycle value, which controls the width of the LED's HIGH pulse.

## Features

- Four LED brightness levels
- 2-bit brightness control input
- PWM-based brightness control
- 3-bit free-running counter
- Case-statement-based duty-cycle selection
- Combinational comparator logic
- Verified using behavioral simulation
- RTL schematic analyzed in Vivado

## Brightness Levels

| brightness_level | duty_cycle | PWM Duty Cycle | LED State |
|---|---:|---:|---|
| `00` | 0 | 0% | OFF |
| `01` | 2 | 25% | DIM |
| `10` | 4 | 50% | MEDIUM |
| `11` | 6 | 75% | BRIGHT |

## Working Principle

The complete signal flow is:

```text
brightness_level
        ↓
Case Statement
        ↓
duty_cycle
        ↓
Counter Comparison
        ↓
counter < duty_cycle
        ↓
LED PWM Output
```

The LED is ON whenever:

```text
counter < duty_cycle
```

Otherwise, the LED is OFF.

## Brightness Selection Logic

```verilog
always @(*) begin
    case (brightness_level)
        2'b00: duty_cycle = 0;
        2'b01: duty_cycle = 2;
        2'b10: duty_cycle = 4;
        2'b11: duty_cycle = 6;
        default: duty_cycle = 0;
    endcase
end
```

The `case` statement selects the required duty-cycle value.

## Counter Logic

```verilog
always @(posedge clk) begin
    if (reset)
        counter <= 0;
    else
        counter <= counter + 1;
end
```

The 3-bit counter repeatedly counts:

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 0
```

One complete count from `0` to `7` forms one PWM period.

## PWM Comparison Logic

```verilog
always @(*) begin
    if (counter < duty_cycle)
        led = 1;
    else
        led = 0;
end
```

A larger duty-cycle value keeps the LED HIGH for a longer portion of each PWM period.

```text
Short HIGH pulse  → DIM LED
Medium HIGH pulse → MEDIUM brightness
Long HIGH pulse   → BRIGHT LED
```

## Example: Medium Brightness

```text
brightness_level = 10
        ↓
duty_cycle = 4
        ↓
Counter:  0  1  2  3  4  5  6  7
LED:      1  1  1  1  0  0  0  0
        ↓
50% duty cycle
        ↓
MEDIUM brightness
```

## RTL Hardware

![RTL Schematic](rtl_schematic.png)

The RTL schematic shows how the Verilog code is converted into digital hardware:

```text
counter <= counter + 1
        ↓
Register + Adder

case (brightness_level)
        ↓
Multiplexer (MUX)

counter < duty_cycle
        ↓
Less-Than Comparator
```

The synthesized hardware flow is:

```text
                  Clock
                    ↓
             Counter Register
                    ↕
                  Adder

brightness_level → MUX → duty_cycle
                           ↓
Counter ─────────────→ Comparator
                           ↓
                          LED
```

## Simulation Waveform

![Simulation Waveform](waveform.png)

The waveform verifies:

- `00` produces an always-LOW LED output
- `01` produces a short HIGH pulse for 25% duty cycle
- `10` produces equal HIGH and LOW times for 50% duty cycle
- `11` produces a long HIGH pulse for 75% duty cycle

As `brightness_level` increases, the HIGH pulse becomes longer.

## Simulation Timing

The testbench clock period is:

```text
10 ns
```

The counter has eight values:

```text
0 to 7
```

Therefore:

```text
PWM Period = 8 × 10 ns
           = 80 ns
```

Each brightness level is tested for one complete 80 ns PWM period.

## Concepts Practiced

- Pulse Width Modulation
- Duty cycle
- LED brightness control
- Free-running counters
- Case statements
- Multiplexer inference
- Comparator inference
- Sequential logic
- Combinational logic
- RTL schematic analysis
- Testbench development
- Waveform analysis

## Project Files

```text
25-PWM-Based-LED-Brightness-Controller/
│
├── led_brightness_controller.v
├── led_brightness_controller_tb.v
├── waveform.png
├── rtl_schematic.png
└── README.md
```

## Author

**Yatharth Pathak**

B.Tech Electronics and Communication Engineering  
RTL Design | Verilog HDL | FPGA | Vivado
