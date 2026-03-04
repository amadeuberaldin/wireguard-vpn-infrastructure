# Publishing Services via VPS (DNAT)

This setup supports publishing selected services running on the home server
(behind CGNAT) by terminating public traffic on the VPS and forwarding it through
WireGuard to the home server.

> Important: publishing requires BOTH DNAT (PREROUTING) and FORWARD rules.

## Example: Bedrock (UDP 19132) -> Home Server 10.10.10.2:19132

## DNAT:
sudo iptables -t nat -A PREROUTING -i eth0 -p udp --dport 19132 \
  -j DNAT --to-destination 10.10.10.2:19132

## FORWARD:
sudo iptables -A FORWARD -p udp -d 10.10.10.2 --dport 19132 -j ACCEPT

## Save:
sudo netfilter-persistent save

## Verify:
sudo iptables -t nat -L PREROUTING -v -n
sudo iptables -L FORWARD -v -n

## Notes:
For personal/private usage, prefer using WireGuard directly (no public DNAT).

Use DNAT only when needed (e.g. accessing from a machine where you cannot use VPN).
