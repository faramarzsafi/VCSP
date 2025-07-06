
# VCSP: Virtual CPU Scheduling for Post-Copy Live Migration

This repository provides the implementation and evaluation of the **VCSP (Virtual CPU Scheduling for Post-Copy)** framework — a method for improving live migration of virtual machines through adaptive scheduling of virtual CPUs.

> 📚 Based on the published paper:  
> Jalaei, N., & Safi-Esfahani, F. (2021).  
> _"VCSP: virtual CPU scheduling for post-copy live migration of virtual machines."_  
> [Int. J. Inf. Tecnol. 13, 239–250 (2021)](https://doi.org/10.1007/s41870-020-00483-z)

---

## 📌 Overview

VCSP aims to reduce the negative impact of page faults during **post-copy live migration** of virtual machines by slowing down the virtual CPU of the destination VM, aligning the processing rate with the page transmission rate.

Two versions are proposed:
- **VCSP**: Pure post-copy with vCPU speed control.
- **VCSP-Prefetching**: Extended VCSP with page prefetching to reduce fault overhead.

---

## 🔬 Key Features

- Reduced **downtime** during migration by up to **8.17%**
- Reduced **total migration time** by up to **30.33%**
- Reduced **data transferred** by up to **54.49%**
- Improved **system throughput** by up to **23.65%**

---

## 🛠️ Technologies Used

- **KVM**: Kernel-based Virtual Machine (as hypervisor)
- **QEMU 2.5**: Emulator used for virtual CPU throttling
- **Debian 7.8** (VM OS), **Ubuntu 14.04** (host OS)
- **Telnet**: To send QEMU commands for vCPU control

---

## 📊 Experimental Setup

| Metric               | VCSP Improvement vs. Post-Copy |
|----------------------|-------------------------------|
| Downtime             | 8.17%                         |
| Total Migration Time | 30.33%                        |
| Pages Transferred    | 54.49%                        |
| System Throughput    | 23.65%                        |

---

## 🚀 How It Works

- The **target VM's CPU frequency** is reduced during migration.
- Memory pages are fetched using **demand paging** or **prefetching**.
- **Bitmaps** track the availability of memory pages in target host.
- A **migration controller** coordinates the transfer and processing.

---

## 🧪 Reproduction & Testing

To test or reproduce:

1. Setup two KVM-capable Linux hosts with QEMU installed.
2. Clone this repository on both source and target.
3. Run provided migration scripts and monitor with stress workloads.
4. Evaluate downtime, migration time, throughput using provided logs.

---

## 📁 Repository Structure

```
VCSP/
├── migration/               # Migration control scripts
├── qemu-commands/           # QEMU vCPU control examples
├── evaluation/              # Results and charts
├── README.md
└── paper/                   # Copy of the published article
```

---

## 👨‍🔬 Authors

- **Narges Jalaei** — n.jalaei@sco.iaun.ac.ir  
- **Faramarz Safi-Esfahani** — fsafi@iaun.ac.ir

---

## 📖 Citation

If you use this work, please cite:

```bibtex
@article{jalaei2021vcsp,
  title={VCSP: virtual CPU scheduling for post-copy live migration of virtual machines},
  author={Jalaei, Narges and Safi-Esfahani, Faramarz},
  journal={International Journal of Information Technology},
  volume={13},
  number={1},
  pages={239--250},
  year={2021},
  publisher={Springer}
}
```

---

## 🧭 Future Work

- Explore integration with **queuing theory** for page scheduling
- Investigate **pre-paging** and **dynamic page prediction**
- Analyze VCSP in **heterogeneous cloud environments**
