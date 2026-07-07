# Traffic Light Controller with Pedestrian Request

## Project 23 – Vivado RTL Design Roadmap

This project implements an FSM-based traffic light controller with a pedestrian crossing request feature using Verilog HDL.

The controller normally keeps the vehicle traffic light GREEN. When a pedestrian presses the crossing button, the request is remembered and the controller safely moves through the following sequence:

```text
GREEN → YELLOW → RED → WALK → GREEN
```

## Features

- Four-state Finite State Machine (FSM)
- GREEN, YELLOW, RED, and WALK states
- Captures a short pedestrian button press
- Stores the request using `request_pending`
- Uses one shared timer for all timed states
- Configurable timing parameters
- Keeps vehicles stopped during pedestrian crossing
- Verified using a Verilog testbench and behavioral simulation

## FSM Sequence

```text
                 No Request
              ┌──────────────┐
              │              │
              ▼              │
           S_GREEN ───────────┘
              │
              │ Pedestrian Request
              ▼
           S_YELLOW
              │
              │ Yellow Time Complete
              ▼
            S_RED
              │
              │ Safety Time Complete
              ▼
           S_WALK
              │
              │ Walk Time Complete
              ▼
           S_GREEN
```

## Pedestrian Request Memory

A pedestrian may press the button for only one clock cycle.

```text
ped_request:       0  0  1  0  0  0
                          ↑
                     Short Press
```

The internal `request_pending` register remembers the request:

```text
ped_request:       0  0  1  0  0  0
request_pending:   0  0  1  1  1  1
```

The request remains stored until the complete crossing sequence has been serviced.

```text
Button Pressed
      ↓
request_pending = 1
      ↓
YELLOW
      ↓
RED
      ↓
WALK
      ↓
Crossing Complete
      ↓
request_pending = 0
```

## Timing Parameters

The state durations are configurable using parameters:

```verilog
parameter YELLOW_TIME = 3;
parameter RED_TIME    = 2;
parameter WALK_TIME   = 5;
```

Small timing values are used during simulation so that the complete FSM sequence can be observed quickly.

## State Encoding

Four states require two bits:

```verilog
localparam S_GREEN  = 2'b00;
localparam S_YELLOW = 2'b01;
localparam S_RED    = 2'b10;
localparam S_WALK   = 2'b11;
```

## Internal Registers

```verilog
reg [1:0] state;
reg [31:0] timer;
reg request_pending;
```

Their functions are:

- `state` stores the current FSM state.
- `timer` measures the duration of the current timed state.
- `request_pending` remembers a short pedestrian request.

## Output Behavior

| State | Green | Yellow | Red | Walk |
|---|---:|---:|---:|---:|
| S_GREEN | 1 | 0 | 0 | 0 |
| S_YELLOW | 0 | 1 | 0 | 0 |
| S_RED | 0 | 0 | 1 | 0 |
| S_WALK | 0 | 0 | 1 | 1 |

During `S_WALK`, both `red` and `walk` remain active:

```text
red  = 1 → Vehicles remain stopped
walk = 1 → Pedestrians may cross
```

## Timer Operation

The same timer is reused for multiple states:

```text
S_YELLOW → Timer measures yellow duration
S_RED    → Timer measures safety delay
S_WALK   → Timer measures pedestrian crossing duration
```

When the state duration is complete:

```text
Timer reaches limit
        ↓
Timer resets to 0
        ↓
FSM moves to next state
```

## Simulation Test

The testbench applies a pedestrian request for only one clock period:

```verilog
ped_request = 1;
#10;
ped_request = 0;
```

Even after `ped_request` returns to `0`, the stored request allows the controller to complete the full sequence:

```text
GREEN → YELLOW → RED → WALK → GREEN
```

## Simulation Waveform

![Simulation Waveform](waveform.png)

The waveform verifies:

- Correct reset behavior
- Initial GREEN state
- Detection of a short pedestrian request
- GREEN to YELLOW transition
- Correct YELLOW timing
- RED safety interval
- RED remaining active during WALK
- Return to GREEN after the request is serviced

## Tools Used

- Verilog HDL
- AMD Vivado
- Behavioral Simulation
- GitHub

## Concepts Practiced

- Finite State Machines
- Sequential logic
- Combinational output logic
- Non-blocking assignments
- Request storage using a pending flag
- Counter-based timing
- Parameterized RTL design
- Testbench development
- Waveform analysis

## Project Files

```text
Traffic-Light-Controller-with-Pedestrian-Request/
│
├── traffic_pedestrian_controller.v
├── traffic_pedestrian_controller_tb.v
├── waveform.png
└── README.md
```

## Author

**Yatharth Pathak**

B.Tech Electronics and Communication Engineering  
RTL Design | Verilog HDL | FPGA | Vivado
