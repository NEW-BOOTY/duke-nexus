# DUKE®-NEXUS Language Hooks Framework

/*
 * Copyright © 2025 Devin B. Royal.
 * All Rights Reserved.
 */

## Overview

DUKE®-NEXUS is an enterprise-grade, modular framework designed to extend large language models (LLMs) with secure, pluggable "hooks" for external tools and reasoning systems. This single-file Bash script serves as a Cognitive Operating System, enabling flexible connections to APIs, databases, vision systems, and robotics, while enforcing compliance, monetization, and ethical safeguards. It is cross-platform (macOS-native, Linux), self-contained, and production-ready with zero external dependencies beyond standard tools like curl and base64.

Built for scalability and security, DUKE®-NEXUS transitions LLMs from monolithic architectures to modular cognitive systems, complete with audit trails, sandboxing, and real-time integrations.

## Features

- **Modular Hooks**: Dynamic attachments for augmented reasoning (fact-checking via Grok API), multimodal expansion (vision via LLaVA/Ollama, audio transcription), enterprise integration (PostgreSQL with vector support), and robotics (ROS2 bridge).
- **Ethical Safeguards**: Preflight bias filters, toxicity thresholds, and policy-driven capability checks to mitigate misinformation and bias.
- **Ultra Extreme Error Handling**: Circuit breakers, retries, latency budgets, and self-healing mechanisms for resilience in production environments.
- **Monetization & Compliance**: Stripe sidecar for metered billing, runtime license enforcement with server validation, and forensic audit logging.
- **Sandboxing & Security**: Per-hook isolation with permissive mode for macOS compatibility; strict mode for Linux with firejail.
- **On-Demand Capabilities**: Attach tools like database queries or simulations without retraining models.
- **Cognitive OS Shift**: Orchestrates agents with compliance gates, monetization scaffolds, and multi-faceted reasoning.

## Prerequisites

- macOS (stock Bash 3.2) or Linux (Bash 4+).
- Optional for real hooks:
  - Ollama running locally for vision (install via `curl -fsSL https://ollama.com/install.sh | sh`).
  - Grok API key (`export GROK_API_KEY=...`).
  - PostgreSQL connection string (`export PG_CONN=postgres://...`).
  - ROS2 installed for robotics.
- No Homebrew or additional installs required for core functionality.

## Installation

1. Save the script as `duke-nexus.sh` and make it executable:
   ```bash
   chmod +x duke-nexus.sh

   Install hooks:Bash./duke-nexus.sh ensure-hooks

Usage
Run commands directly:

Vision analysis (LLaVA/Ollama):Bash./duke-nexus.sh vision ./samples/cat.jpg
Fact-checking (Grok API):Bashexport GROK_API_KEY=sk-...
./duke-nexus.sh fact "The capital of France is Berlin"
Database query (PostgreSQL + vector):Bashexport PG_CONN=postgres://user:pass@localhost/db
./duke-nexus.sh db "SELECT version();"
Robotics command (ROS2):Bash./duke-nexus.sh robot "move forward" /cmd_vel

For full CLI help:
Bash./duke-nexus.sh
Security & Compliance

License Enforcement: Runtime validation with dev mode time-boxing; production requires server-side check.
Auditing: All actions logged to audit.log with timestamps and trace IDs.
Error Handling: Retries, circuit breakers, and safe fallbacks prevent failures.
Sandboxing: Permissive mode on macOS; extend with firejail on Linux for strict isolation.

Contributing
This is proprietary software. Contributions are not accepted without explicit written consent from Devin B. Royal.
License
See LICENSE for details. All rights reserved.
Support
For enterprise licensing or customization, contact Devin B. Royal at devin.royal@duke-nexus.com.
/*

Copyright © 2025 Devin B. Royal.
All Rights Reserved.
*/
