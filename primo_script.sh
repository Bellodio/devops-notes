#!/bin/bash
echo "=== VERIFICA SISTEMA ==="
echo "Utente corrente: $(whoami)"
echo "Data e ora: $(date)"
echo "Spazio disco disponibile:"
df -h / | tail -n 1
