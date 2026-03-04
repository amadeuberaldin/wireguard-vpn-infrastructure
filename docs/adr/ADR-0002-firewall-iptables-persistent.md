# ADR-0002: Manage VPS forwarding with iptables + netfilter-persistent

## Status
Accepted

## Context
The VPS functions as a router between WireGuard peers.
Default FORWARD policy may be DROP, breaking peer-to-peer reachability despite WG handshake.

## Decision
Explicitly allow wg0 -> wg0 forwarding and persist rules:
- `iptables -I FORWARD 1 -i wg0 -o wg0 -j ACCEPT`
- Persist with `iptables-persistent` / `netfilter-persistent`

## Consequences
- Peers can communicate through hub as intended
- Firewall becomes explicitly defined and reproducible
- Requires discipline to avoid exposing services unintentionally
