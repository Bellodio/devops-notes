#!/bin/bash
echo "=========================================="
echo "      ANALIZZATORE LOG E FILE - DEVOPS"
echo "=========================================="
echo "Data analisi: $(date)"
echo ""

echo "--- 1. CONTEGGIO SCRIPT .SH NELLA CARTELLA ---"
TOTAL_SCRIPTS=$(find . -maxdepth 1 -name "*.sh" | wc -l)
echo "Trovati $TOTAL_SCRIPTS script eseguibili."
echo ""

echo "--- 2. RICERCA PAROLA 'ERROR' NEI LOG DI SISTEMA ---"
if [ -f /var/log/syslog ]; then
    grep -i "error" /var/log/syslog | tail -n 5
else
    echo "File /var/log/syslog non accessibile direttamente senza sudo."
fi
echo ""

echo "=========================================="
