# ADR-0004: DNAT on VPS is optional and used only when needed

## Status
Accepted

## Context
Sometimes remote access is needed from machines where installing WireGuard is not possible.
DNAT can publish selected services through the VPS public IP.

## Decision
Use DNAT only for specific use-cases and ports:
- Requires DNAT (PREROUTING) + FORWARD rules
- Keep default posture as "VPN-first"

## Consequences
- Maintains flexibility for restricted environments
- Slightly higher latency and more public exposure when enabled
- Must be documented and reviewed to avoid accidental exposure
