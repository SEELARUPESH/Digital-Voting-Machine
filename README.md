# 🗳️ FPGA-Based Digital Voting Machine with Secure Memory

![Language](https://img.shields.io/badge/Language-Verilog-blue)
![Platform](https://img.shields.io/badge/Platform-FPGA-green)
![Simulation](https://img.shields.io/badge/Simulation-Icarus%20Verilog-orange)
![Waveform](https://img.shields.io/badge/Waveform-GTKWave-red)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📖 Project Overview

This project implements an **FPGA-Based Digital Voting Machine** using **Verilog HDL**. The system records votes for four candidates, securely stores vote counts using a simulated **EEPROM/Flash memory model**, determines the winning candidate through dedicated winner logic, and displays the winner on a **7-Segment Display**.

The design follows a modular architecture and is verified through simulation using **Icarus Verilog** and **GTKWave**.

---

## ✨ Features

- ✅ FPGA-Based Digital Voting Machine
- ✅ Finite State Machine (FSM) Control
- ✅ Four Candidate Voting System
- ✅ Push Button Debouncing
- ✅ Secure EEPROM/Flash Memory Simulation
- ✅ Vote Counter Module
- ✅ Automatic Winner Detection
- ✅ 7-Segment Display Driver
- ✅ Modular Verilog HDL Design
- ✅ Functional Simulation using Icarus Verilog
- ✅ Waveform Verification using GTKWave

---

# 🏗️ System Architecture

<p align="center">
<img src="IMAGES/architecture.png" width="700">
</p>

---

# 📊 Block Diagram

<p align="center">
<img src="IMAGES/block_diagram.png" width="700">
</p>

---

# 🔄 FSM State Diagram

<p align="center">
<img src="IMAGES/fsm_diagram.png" width="700">
</p>

---

# 📁 Project Structure

```text
Digital-Voting-Machine
│
├── README.md
├── LICENSE
├── .gitignore
│
├── RTL
│   ├── debounce.v
│   ├── secure_memory.v
│   ├── seven_segment.v
│   ├── top.v
│   ├── vote_counter.v
│   ├── vote_fsm.v
│   └── winner_logic.v
│
├── TB
│   └── voting_tb.v
│
├── DOCS
│   ├── 01_Project_Requirements.docx
│   ├── 02_Block_Diagram.docx
│   ├── 03_FSM_Diagram.docx
│   ├── 04_State_Encoding_Table.docx
│   ├── 05_State_Transition_Table.docx
│   ├── 06_System_Architecture.docx
│   └── 07_Test_Plan.docx
│
├── IMAGES
│   ├── architecture.png
│   ├── block_diagram.png
│   ├── fsm_diagram.png
│   └── waveform.png
│
└── WAVEFORMS
    └── voting.vcd
```

---

# 🧩 RTL Modules

| Module | Description |
|----------|-------------|
| debounce.v | Removes switch bouncing from the vote button |
| vote_fsm.v | Controls the voting sequence using an FSM |
| vote_counter.v | Maintains vote counts for four candidates |
| secure_memory.v | Simulates EEPROM/Flash memory storage |
| winner_logic.v | Determines the winning candidate |
| seven_segment.v | Drives the 7-Segment Display |
| top.v | Top-level integration of all modules |

---

# ⚙️ Working Principle

1. The voter selects one of the four candidates.
2. The vote button is pressed.
3. The Debounce Module removes switch bouncing.
4. The FSM validates the vote.
5. The Vote Counter updates the selected candidate's count.
6. The Secure Memory module stores the updated vote count.
7. When the **Show Result** button is pressed, the Winner Logic determines the candidate with the highest votes.
8. The winning candidate ID is displayed on the **7-Segment Display**.

---

# 📈 Simulation Results

The design was successfully verified using **Icarus Verilog**.

Simulation confirms:

- Correct vote counting
- Proper FSM transitions
- Debounce functionality
- Secure vote storage
- Accurate winner detection
- Correct 7-Segment display output

---

## 📷 Waveform Output

<p align="center">
<img src="IMAGES/waveform.png" width="900">
</p>

---

# 🛠️ Technologies Used

- Verilog HDL
- FPGA Digital Design
- Finite State Machine (FSM)
- Icarus Verilog
- GTKWave
- Visual Studio Code

---

# ▶️ How to Run

### Compile

```bash
iverilog -g2012 -o voting_sim RTL/*.v TB/voting_tb.v
```

### Run

```bash
vvp voting_sim
```

### View Waveform

```bash
gtkwave voting.vcd
```

---

# 📌 Applications

- Electronic Voting Systems
- FPGA Learning Projects
- Digital Logic Design
- Embedded Systems Education
- Academic Mini Projects

---

# 🚀 Future Enhancements

- LCD/OLED Display Interface
- Biometric Voter Authentication
- Password-Protected Administrator Mode
- Real EEPROM Integration
- FPGA Board Implementation
- Vote Encryption
- Remote Monitoring

---

# 👨‍💻 Author

**Seela Rupesh**

**B.Tech – Electronics and Communication Engineering**

Pragati Engineering College

GitHub: https://github.com/SEELARUPESH

LinkedIn: https://www.linkedin.com/in/seela-rupesh-168a712b8

---

# 📄 License

This project is licensed under the **MIT License**.

---

## ⭐ If you found this project useful, consider giving it a Star!
