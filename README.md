# AC-DC Boost Converter (PFC) in Simulink

Single-phase AC-DC boost converter, built up in six stages from a plain
rectifier to a feed-forward controlled boost PFC. Simulink / Simscape
Electrical models (`.slx`), circuit screenshots (`a`) and output waveforms (`b`).

| # | Stage | Folder |
|---|-------|--------|
| 1 | Full-bridge diode rectifier | [1. Rectifier](<1. Rectifier>) |
| 2 | DC-DC boost converter, open loop | [2. Boost converter](<2. Boost converter>) |
| 3 | AC-DC boost, open loop | [3. AC-DC boost converter](<3. AC-DC boost converter>) |
| 4 | Outer voltage control loop | [4. Outer Voltage loop append](<4. Outer Voltage loop append>) |
| 5 | Inner current loop (two variants) | [5. Inner Current loop append](<5. Inner Current loop append>) |
| 6 | Feed-forward control | [6. Feed Forward control](<6. Feed Forward control>) |

## Usage
Open any `.slx` in MATLAB with Simulink and Simscape Electrical, then run.
Naming convention: `Na.png` = circuit, `Nb.png` = output.

## Author
Aayush Singh, NIT Goa (EEE)
