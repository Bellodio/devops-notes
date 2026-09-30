#!/bin/bash
echo "=========================================="
echo "    MONITORAGGIO SISTEMA E RISORSE"
echo "=========================================="
echo "Data e Ora: $(date)"
echo ""
echo "--- USO MEMORIA RAM ---"
free -h
echo ""
echo "--- USO DISCO ---"
df -h / | tail -n 1
echo ""
echo "--- TOP 5 PROCESSI PER USO CPU ---"
ps aux --sort=-%cpu | head -n 6
echo "=========================================="
