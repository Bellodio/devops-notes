#!/bin/bash
echo " === DIAGNOSTICA RETE === "
echo -n "IP Pubblico: "
curl -s ifconfig.me
echo ""
echo "Test connessione Google DNS (8.8.8.8) ..."
ping -c 2 8.8.8.8 > /dev/null && echo "Stato: ONLINE" || echo "Stato: OFFLINE"
