# Cloud-Native GPU Cluster Bootstrap & CUDA Inference Pipeline

An automated, reproducible infrastructure blueprint designed to set up cloud servers (like Vultr, AWS, or CoreWeave) with Nvidia graphics chips, configure secure application environments, and run hardware-accelerated AI workloads entirely in isolated containers.

---

## 💡 What is this project? (Explained Simply)

Imagine you want to run a powerful AI model (like an automatic voice transcriber or a chat assistant) across thousands of cloud computers. Doing this manually on every computer takes days and leads to human errors. 

This project is an **"Automated Blueprint."** With a single command, it handles everything:
1. It configures the server's operating system.
2. It installs **Nvidia CUDA** (the software layer that unlocks the lightning-fast math power of a graphics card).
3. It bundles the AI model into a clean, isolated package (**Docker**) so it runs perfectly every single time, without messing up the rest of the system.

---

## 🏗️ Architecture Layout

This diagram illustrates how this repository safely links physical cloud hardware to an active AI program:

┌────────────────────────────────────────────────────────┐
│               Application Layer (PyTorch / Whisper)    │
├────────────────────────────────────────────────────────┤
│               Docker Container (Nvidia Runtime)        │
├────────────────────────────────────────────────────────┤
│               Nvidia Container Toolkit Layer           │
├────────────────────────────────────────────────────────┤
│               Host OS (CUDA Drivers & Toolkit 12.4)    │
├────────────────────────────────────────────────────────┤
│               Physical Hardware (Nvidia A100 / H100)   │
└────────────────────────────────────────────────────────┘


### Core Engineering Features:
* **Infrastructure as Code (IaC):** Complete zero-touch setup via a single shell script. It configures security repositories and kernel updates automatically.
* **Hardware Passthrough Virtualization:** Maps physical graphics chips safely into secure, lightweight container boundaries (`docker-compose`).
* **Continuous Integration (CI):** An automated pipeline via GitHub Actions that scans every code change for safety, optimization, and errors before it touches a live server.

---

## 🛠️ Project File Structure

Here is where every component lives inside this workspace:
* `scripts/install_cuda.sh` — The master automation script that updates the cloud server and flashes the graphic drivers.
* `docker/Dockerfile` — The secure container configuration based on official Nvidia software.
* `docker/docker-compose.yml` — The manager file that tells the container exactly how much graphics card power to access.
* `src/benchmark.py` — A validation script written in Python that tests the system by making the graphics card run heavy math calculations.
* `.github/workflows/ci.yml` — The automatic quality tester that runs on GitHub to verify code health.

---

## 🚀 How to Run It

### Step 1: Initialize the Server
Execute the automation script on a fresh Ubuntu cloud instance to download and deploy all required drivers:
```bash
chmod +x scripts/install_cuda.sh
./scripts/install_cuda.sh
sudo reboot
```

### Step 2: Spin Up the AI Pipeline
Boot up the isolated container application loop. This automatically passes the graphics engine directly to your active code space:
```bash
docker compose -f docker/docker-compose.yml up --build
```

---

## 📈 Scaled Production Concepts (For Architects and Hiring Managers)

In high-volume business infrastructure, this core framework scales into enterprise production workflows via two key practices:

### 1. Multi-Instance GPU (MIG) Slicing
Running a small task (like transcribing audio from a pocket device) on a massive cloud graphics card wastes computing budget. In production, we programmatically fragment large graphics cards into smaller, independent sub-cards to process multiple tasks simultaneously, cutting cloud costs.

### 2. High-Speed Interconnects (NCCL / NVLink)
When training giant AI models, computers have to talk to each other constantly. 

