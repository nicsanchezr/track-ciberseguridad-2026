#!/usr/bin/env bash
# ============================================================
#  preparar_retos.sh  ·  Track Ciberseguridad · CITT Varas
#  Deja listos los retos de Lab 01 (~/lab01) y Lab 02 (~/desafio)
#  en un Kali. El Kali OFICIAL viene limpio: hay que ejecutar
#  ESTE script para que los retos existan.
#
#  IMPORTANTE: ejecútalo con el usuario 'kali' (NO como root),
#  para que los archivos queden en /home/kali y sean del alumno.
#
#  Uso:   bash preparar_retos.sh
# ============================================================
set -euo pipefail
BASE_HOME="${1:-$HOME}"

# ---------------- Lab 01 · ~/lab01 ----------------
L1="$BASE_HOME/lab01"
rm -rf "$L1"; mkdir -p "$L1/logs" "$L1/.oculto"
cat > "$L1/README.txt" <<'TXT'
Lab 01 - Primer contacto con la terminal.
Tu mision: encontrar la bandera con formato FLAG{...}
Empieza revisando los registros dentro de la carpeta logs/.
TXT
for i in $(seq 1 40); do echo "$(date '+%F %T') servicio[$RANDOM]: evento rutinario $i" >> "$L1/logs/sistema.log"; done
echo "$(date '+%F %T') nota[hint]: la bandera esta codificada en base64 dentro de un archivo oculto con extension .b64" >> "$L1/logs/sistema.log"
for i in $(seq 41 60); do echo "$(date '+%F %T') servicio[$RANDOM]: evento rutinario $i" >> "$L1/logs/sistema.log"; done
echo "FLAG{esta_no_es_la_correcta}" > "$L1/logs/descartado.txt"
printf '%s' 'RkxBR3trNGxpX3ByMW0zcl9jMG50NGN0MH0=' > "$L1/.oculto/bandera.b64"   # FLAG{k4li_pr1m3r_c0nt4ct0}
chmod 600 "$L1/.oculto/bandera.b64"

# ---------------- Lab 02 · ~/desafio ----------------
D="$BASE_HOME/desafio"
rm -rf "$D"; mkdir -p "$D/.5"
cat > "$D/README.txt" <<'TXT'
DESAFIO DE TERMINAL - Operacion terminal_ninja
Mision: encontrar la bandera FLAG{...} encadenando lo que aprendiste.
Pista 1: en registros.log, cuantas lineas dicen ERROR? Ese numero abre la puerta.
TXT
for i in $(seq 1 12); do echo "$(date '+%F %T') INFO  servicio ok $i" >> "$D/registros.log"; done
for i in $(seq 1 5);  do echo "$(date '+%F %T') ERROR fallo en modulo $i" >> "$D/registros.log"; done
for i in $(seq 1 8);  do echo "$(date '+%F %T') INFO  servicio ok $((i+12))" >> "$D/registros.log"; done
cat > "$D/.5/pista.txt" <<'TXT'
Bien! Llegaste a la carpeta oculta.
La bandera esta en 'secreto.txt', pero no tienes permiso de lectura: arreglalo.
Cuando lo leas, veras que esta en base64: decodificala.
TXT
printf '%s' 'RkxBR3t0M3JtMW40bF9uMW5qNH0=' > "$D/.5/secreto.txt"   # FLAG{t3rm1n4l_n1nj4}
chmod 000 "$D/.5/secreto.txt"

echo "[+] Retos preparados:"
echo "    Lab 01 -> $L1"
echo "    Lab 02 -> $D"
echo "[i] Verifica con:  ls -la $L1  ;  ls -la $D"
