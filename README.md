# WireGuard VPN Infrastructure (VPS Gateway) — CGNAT Bypass

Homelab infrastructure project demonstrating how to bypass ISP CGNAT using a VPS as a WireGuard gateway,
with SSH isolation and firewall hardening.

## Goals
- Secure remote access to a home server behind CGNAT
- SSH access only over the VPN
- Minimal public exposure on the VPS (WireGuard only)
- Documented and reproducible setup

## Tech stack
- Ubuntu Server 24.04 LTS
- WireGuard
- Firewall: iptables + netfilter-persistent (VPS), UFW
- OpenSSH hardening
- (Optional) Docker networking

## Repository contents
- `docs/`: architecture + step-by-step
- `config-templates/`: sanitized templates (no secrets)
- `scripts/`: audit scripts and helpers
- `examples/`: masked outputs (IPs and hostnames removed)

## Security & Documentation
- [Sanitization checklist](docs/SANITIZE-CHECKLIST.md)
- [Architecture Decisions (ADRs)](docs/adr/)

> This repository does not include private keys, real IP addresses, or sensitive logs.
