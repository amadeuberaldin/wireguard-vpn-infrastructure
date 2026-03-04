# ADR-0001: Use a VPS as a WireGuard hub to bypass CGNAT

## Status
Accepted

## Context
Home ISP uses CGNAT, preventing inbound connections to the home server.
A VPS with a public IP can act as a stable rendezvous point for remote access.

## Decision
Adopt a hub-and-spoke WireGuard topology:
- VPS is hub (`10.10.10.1/24`)
- Home server and personal PC are peers (`10.10.10.2/32`, `10.10.10.10/32`)
- VPS routes traffic between peers

## Consequences
- Reliable remote access without ISP changes
- Added hop/overhead compared to direct public IP
- Central point to apply security controls and optional DNAT
