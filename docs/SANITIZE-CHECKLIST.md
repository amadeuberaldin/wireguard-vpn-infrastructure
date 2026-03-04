# Sanitization Checklist (Public Portfolio Repo)

This repository is public. Never commit real secrets, private identifiers, or data that can be used to attack the environment.

## Never commit (hard rules)
- WireGuard private keys (`PrivateKey = ...`)
- Any SSH private keys (`id_rsa`, `id_ed25519`, `.pem`)
- Passwords / tokens / API keys
- Real VPS public IP if you want to keep it private (use `<VPS_PUBLIC_IP>`)
- Real domain names, DDNS names, or DNS provider tokens
- Exact physical hostnames if they are tied to your identity (optional)
- Real internal LAN ranges if you want to anonymize (optional)
- Full `wg0.conf` from production (use templates with placeholders)

## Replace with placeholders
Use consistent placeholders:
- `<VPS_PUBLIC_IP>`
- `<VPS_PUBLIC_KEY>` / `<VPS_PRIVATE_KEY>`
- `<HOME_SERVER_PUBLIC_KEY>` / `<HOME_SERVER_PRIVATE_KEY>`
- `<CLIENT_PUBLIC_KEY>` / `<CLIENT_PRIVATE_KEY>`
- `<LAN_SUBNET>` / `<LAN_GATEWAY>`

## “Safe to commit” examples
- Sanitized config templates in `templates/`
- High-level topology, diagrams, port lists
- Commands used to debug (without secrets)
- iptables rules (without revealing public IPs/domains)

## Pre-push quick check (manual)
Run these before pushing:
```bash
git diff --staged
git grep -n "PrivateKey" .
git grep -n "BEGIN OPENSSH PRIVATE KEY" .
git grep -nE "(password|token|secret|api_key|Authorization:|Bearer )" .
