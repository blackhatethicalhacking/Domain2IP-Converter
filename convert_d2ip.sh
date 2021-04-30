#!/bin/bash
# Written by SaintDrug for Black Hat Ethical Hacking - 2021 Copyrights All Rights Reserved
# With this script, you can convert domain lists to resolved IP lists without duplicates.
# Usage: ./convert_d2ip.sh [domain-list-file] [output-file]



figlet Black Hat Ethical Hacking
echo -e "[+] Convert Domain 2 IP without Duplicates by SaintDruG\n"
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "[!] Usage: ./convert_d2ip.sh [domain-list-file] [output-file]"
  exit 1
fi
echo "[+] Resolving domains to IPs Just Chill a bit..."
while read d || [[ -n $d ]]; do
  ip=$(dig +short $d|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"|head -1)
  if [ -n "$ip" ]; then
    echo "[+] '$d' => $ip"
    echo $ip >> $2
  else
    echo "[!] '$d' => [RESOLVE ERROR]"
  fi
done < $1
echo -e "\n[+] Removing duplicates...Told ya ;)"
sort $2 | uniq > $2.new
mv $2.new $2
echo -e "\n[+] Done You can Light one up, IPs saved to '$2'."
figlet Security is a myth..
