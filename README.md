# Electronic Voting Machine (EVM) using Verilog and Artix-7 FPGA

This project implements a **4-candidate Electronic Voting Machine (EVM)** using **Verilog HDL**, tested on the **Xilinx Artix-7 FPGA**. It counts votes for each candidate, determines the winner in real-time, and supports a reset functionality. A clock divider is included to control the timing for stable operation.

---

## Features

* Supports **4 candidates** with 2-bit selection input.
* **Vote counting** implemented using 3-bit counters for each candidate.
* **Winner determination** logic updates automatically based on votes.
* **Reset functionality** to clear votes and start a new election.
* **Clock divider** to generate a slower clock suitable for counting and debouncing.
* **FPGA implementation** tested on Artix-7.

---

## Modules

### 1. `freq.v`

* Generates a slower clock from the main input clock.
* Uses a counter to toggle the output clock after a specified number of cycles.

### 2. `EVM.v`

* Main module handling:

  * Vote counting
  * Candidate selection
  * Winner determination
* **Inputs**:

  * `clk` – Main clock
  * `reset` – Active-high reset
  * `candidate` – 2-bit candidate selection
  * `vote` – Vote button input (active-high)
* **Outputs**:

  * `vote_count_1` to `vote_count_4` – 3-bit vote counters
  * `winner` – 2-bit code indicating the current winner
  * `clkout` – Divided clock signal

### 3. `EVM_tb.v`

* Testbench for simulating the EVM module.
* Simulates vote inputs, candidate selection, and observes vote counts and winner output.

---

## Usage

1. **Simulation**

   * Run `EVM_tb.v` in your preferred Verilog simulator (ModelSim, Vivado Simulator, etc.).
   * Apply different candidate selections and vote signals to verify counting and winner logic.

2. **FPGA Implementation**

   * Synthesize the design using Vivado targeting Artix-7 FPGA.
   * Connect push buttons for vote input and candidate selection.
   * Connect LEDs to display `vote_count` and `winner` output.
   * Use the reset button to clear all votes for a new election.

---

## Notes

* Vote counts are **limited to 3 bits** (max 7 votes per candidate). Adjust the width for higher counts.
* Winner logic defaults to **candidate 1 in case of a tie**.
* Tested successfully on **Xilinx Artix-7 FPGA**.

---

## Project Structure

```
EVM_using_FPGA/
├── EVM.v          # Main Verilog file
├── EVM_tb.v       # Testbench
├── README.md      # Project description
└── LICENSE        # MIT License
```

---

## Author

**Angam Jithendranath**

* [LinkedIn](https://www.linkedin.com/in/jithendranathangam)
* [GitHub](https://github.com/Jithendranath777)

---

## License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
