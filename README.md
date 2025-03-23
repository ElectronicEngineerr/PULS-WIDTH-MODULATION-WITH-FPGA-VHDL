# PULS-WIDTH-MODULATION---FPGA
PULS WIDTH MODULATION - FPGA




# PWM Generator in VHDL

This project implements a PWM (Pulse Width Modulation) generator in VHDL. The generator is configurable for different frequencies and duty cycles. Additionally, it includes a testbench to validate the design in a simulation environment.

## Features

- Configurable **clock frequency** and **PWM frequency** via generics.
- Supports three independent PWM outputs with configurable duty cycles:
  - `pwm_out1`: 25% duty cycle.
  - `pwm_out2`: 50% duty cycle.
  - `pwm_out3`: 75% duty cycle.
- Testbench provided to simulate the design with a clock signal and verify its functionality.

## Files
### 1. `PWM_GENERATOR.vhd`
The main module that generates three independent PWM signals based on the provided `clock_freq`, `pwm_freq`, and `duty_cycle` values.

### 2. `tb_pwm_generator.vhd`
A testbench to simulate and verify the functionality of the `PWM_GENERATOR`. It generates a clock signal and applies different duty cycle values for testing.

## Generic Parameters
The `PWM_GENERATOR` module includes the following generic parameters:
- `clock_freq`: Clock frequency of the FPGA in Hz (default: 100 MHz).
- `pwm_freq`: Desired PWM frequency in Hz (default: 10 kHz).

## Ports
### Input Ports:
- `clk`: Clock signal.
- `duty_cycle1`: Duty cycle for the first PWM output (8-bit vector).
- `duty_cycle2`: Duty cycle for the second PWM output (8-bit vector).
- `duty_cycle3`: Duty cycle for the third PWM output (8-bit vector).

### Output Ports:
- `pwm_out1`: PWM output 1.
- `pwm_out2`: PWM output 2.
- `pwm_out3`: PWM output 3.

## Usage
### Simulation
1. Load both `PWM_GENERATOR.vhd` and `tb_pwm_generator.vhd` into your VHDL simulator.
2. Run the simulation to verify the functionality. Observe the PWM outputs for different duty cycles.

### Synthesis
1. Include `PWM_GENERATOR.vhd` in your FPGA project.
2. Set the desired `clock_freq` and `pwm_freq` via the generic parameters.
3. Map the ports to the appropriate FPGA pins in your constraints file.

## Testbench Configuration
The testbench generates a 10 ns clock period (`clk` signal) and tests the PWM outputs with the following duty cycles:
- `duty_cycle1 = "00100000"` (25%).
- `duty_cycle2 = "01000000"` (50%).
- `duty_cycle3 = "10000000"` (75%).

Simulation waits for 100 us to allow observing the generated PWM signals.

![VIVADO - SIMULATION](simulationn)

![VIVADO - SIMULATION](stim)


