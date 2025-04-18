#!/bin/bash

IP=$(hostname -I | awk '{print $1}')
echo "IP local: $IP"

echo "Escaneando puertos abiertos de $IP (8000-8100)..."
nmap -p8000-8100 "$IP" -oG - | grep "/open/" > puertos_abiertos.txt

echo "Resultado guardado en puertos_abiertos.txt"
