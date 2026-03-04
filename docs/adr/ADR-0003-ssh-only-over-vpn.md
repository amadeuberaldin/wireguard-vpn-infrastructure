# ADR-0003: Restrict SSH access to WireGuard interface only

## Status
Accepted

## Context
SSH is a high-value target if exposed publicly.
The VPN already provides authenticated access to internal addresses.

## Decision
Bind/allow SSH only on WireGuard network:
- Home server: SSH reachable only via `10.10.10.2:22`
- Firewall rules allow `22/tcp` on `wg0` only

## Consequences
- Greatly reduced attack surface
- Requires VPN connectivity before administration
