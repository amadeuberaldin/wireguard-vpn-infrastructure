# Firewall on VPS (iptables + netfilter-persistent)

## Key issue solved: WireGuard peers couldn't reach each other
Even with WireGuard handshakes working, traffic between peers (e.g. PC -> Home Server)
failed because the VPS was acting as a router and the FORWARD chain policy was DROP.

### Symptom
- `wg` shows handshake OK
- `ping 10.10.10.2` from the PC fails
- `ssh` between peers fails

### Root cause
- VPS: `iptables -L FORWARD` shows `policy DROP`
- Missing rule to allow traffic to traverse wg0 and exit wg0 (peer-to-peer routing through hub)

### Fix
Allow forwarding between WireGuard peers:
```bash
sudo iptables -I FORWARD 1 -i wg0 -o wg0 -j ACCEPT

### Persist rules:
sudo apt install -y iptables-persistent
sudo netfilter-persistent save

### Verify persistence:
sudo grep -n "wg0" /etc/iptables/rules.v4
