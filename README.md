
# WiFi Auth Tool

A lightweight, modular bash-based toolkit for WiFi reconnaissance, authentication testing, and WPA/WPA2 handshake capture & cracking. Designed for penetration testers and red teamers working in Linux environments.

> [!WARNING] 
> Legal Notice: This tool is intended for authorized security testing only. Unauthorized use against networks you do not own or have explicit permission to test is illegal.
## 🛠️ Features

- Scan nearby WiFi networks
- Connect to open or password-protected networks (via NetworkManager)
- Enable/disable monitor mode automatically
- Capture WPA/WPA2 handshakes using `airodump-ng`
- Force client disconnection via deauthentication attacks
- Crack captured handshakes using a wordlist with `aircrack-ng`
## 📦 Requirements

- Linux OS only (Kali Linux, Parrot OS, Ubuntu, etc.) → macOS is not supported due to lack of monitor mode tools like `airmon-ng`
- Wireless interface supporting monitor mode
- Tools from the Aircrack-ng suite:
    - `airmon-ng`
    - `airodump-ng`
    - `aireplay-ng`
    - `aircrack-ng`
- `iw`, `iwlist`, `nmcli` (usually pre-installed on most distros)

Install dependencies (Kali/Debian/Ubuntu):

```bash
sudo apt update && sudo apt install aircrack-ng iw network-manager
```
## 🚀 Usage

Make the main script executable:

```bash 
chmod +x wifi_tool.sh
```

Scan Networks

```bash 
./wifi_tool.sh -s
```

Connect to a Network

```bash 
./wifi_tool.sh -c "MyWiFi" "MyPassword"
```

Capture Handshake

```bash
./wifi_tool.sh -p <BSSID> <CHANNEL>
# Example: ./wifi_tool.sh -p AA:BB:CC:DD:EE:FF 6
```
> Captured handshakes are saved as `capture/handshake-*.cap`

Deauthenticate Clients

```bash 
./wifi_tool.sh -d <BSSID>
# Example: ./wifi_tool.sh -d AA:BB:CC:DD:EE:FF
```

Crack Handshake
```bash 
./wifi_tool.sh -k handshake
# Uses capture/handshake.cap and wordlists/wordlist.txt
```

Show Help
```bash
./wifi_tool.sh -h
```
## 🔐 Wordlist

A minimal `wordlist.txt` is included in `wordlists/`. For real-world use, replace it with a larger dictionary (e.g., `rockyou.txt`):

```bash
gunzip /usr/share/wordlists/rockyou.txt.gz  # if available
cp /usr/share/wordlists/rockyou.txt wordlists/wordlist.txt
```
> Notes
> - The tool automatically enables monitor mode before capture/deauth and must be run with `sudo` (or as root).
> - After operations that use monitor mode (e.g., `-p`, `-d`), you may need to manually restore managed mode:

```bash 
sudo airmon-ng stop wlan0mon
sudo systemctl restart NetworkManager
```
- Handshake capture runs indefinitely—press `Ctrl+C` once you see `WPA handshake: <BSSID>` in the top-right of the `airodump-ng` window.


## License

This project is licensed under the `MIT` License. See the LICENSE file for more details.