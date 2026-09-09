#!/usr/bin/env bash
# ============================================================
#  setup_desafio.sh  ·  Track Ciberseguridad · CITT Varas
#  Prepara el DESAFÍO del Lab 02 (para quienes terminan antes).
#  Lo ejecuta el/la DOCENTE en cada Kali (o va en la imagen base).
#  Uso:  bash setup_desafio.sh          -> crea ~/desafio
#        bash setup_desafio.sh /ruta    -> crea /ruta/desafio
# ============================================================
set -euo pipefail

BASE="${1:-$HOME}/desafio"
rm -rf "$BASE"
mkdir -p "$BASE/.5"

cat > "$BASE/README.txt" <<'TXT'
DESAFIO DE TERMINAL - Operacion terminal_ninja
Mision: encontrar la bandera FLAG{...} encadenando lo que aprendiste.
Pista 1: en registros.log, ¿cuantas lineas dicen ERROR? Ese numero abre la puerta.
TXT

# registros.log: 5 lineas ERROR entre ruido INFO
for i in $(seq 1 12); do echo "$(date '+%F %T') INFO  servicio ok $i" >> "$BASE/registros.log"; done
for i in $(seq 1 5);  do echo "$(date '+%F %T') ERROR fallo en modulo $i" >> "$BASE/registros.log"; done
for i in $(seq 1 8);  do echo "$(date '+%F %T') INFO  servicio ok $((i+12))" >> "$BASE/registros.log"; done

# La carpeta oculta se llama como el numero de ERRORES: .5
cat > "$BASE/.5/pista.txt" <<'TXT'
Bien! Llegaste a la carpeta oculta.
La bandera esta en 'secreto.txt', pero no tienes permiso de lectura: arreglalo.
Cuando lo leas, veras que esta codificada en base64: decodificala.
TXT

# Bandera real, codificada en base64 y SIN permisos de lectura
printf '%s' 'RkxBR3t0M3JtMW40bF9uMW5qNH0=' > "$BASE/.5/secreto.txt"
chmod 000 "$BASE/.5/secreto.txt"

echo "[+] Desafio del Lab 02 preparado en: $BASE"
