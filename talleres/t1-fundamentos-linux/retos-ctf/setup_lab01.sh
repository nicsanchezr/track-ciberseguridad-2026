#!/usr/bin/env bash
# ============================================================
#  setup_lab01.sh  ·  Track Ciberseguridad · CITT Varas
#  Prepara el reto "captura la bandera" del Lab 01 (T1).
#  Lo ejecuta el/la DOCENTE en cada máquina Kali antes de la clase
#  (o se despliega en la imagen base). NO compartir con estudiantes.
#
#  Uso:   bash setup_lab01.sh            -> crea ~/lab01
#         bash setup_lab01.sh /ruta      -> crea /ruta/lab01
# ============================================================
set -euo pipefail

BASE="${1:-$HOME}/lab01"
rm -rf "$BASE"
mkdir -p "$BASE/logs" "$BASE/.oculto"

cat > "$BASE/README.txt" <<'TXT'
Lab 01 - Primer contacto con la terminal.
Tu mision: encontrar la bandera con formato FLAG{...}
Empieza revisando los registros dentro de la carpeta logs/.
TXT

# Ruido: muchas lineas de log con UNA pista escondida en medio.
for i in $(seq 1 40); do
  echo "$(date '+%F %T') servicio[$RANDOM]: evento rutinario $i" >> "$BASE/logs/sistema.log"
done
echo "$(date '+%F %T') nota[hint]: la bandera esta codificada en base64 dentro de un archivo oculto con extension .b64" >> "$BASE/logs/sistema.log"
for i in $(seq 41 60); do
  echo "$(date '+%F %T') servicio[$RANDOM]: evento rutinario $i" >> "$BASE/logs/sistema.log"
done

# Bandera falsa (para practicar descartar).
echo "FLAG{esta_no_es_la_correcta}" > "$BASE/logs/descartado.txt"

# Bandera real, codificada en base64 y con permisos restringidos (solo el dueño).
printf '%s' 'RkxBR3trNGxpX3ByMW0zcl9jMG50NGN0MH0=' > "$BASE/.oculto/bandera.b64"
chmod 600 "$BASE/.oculto/bandera.b64"

echo "[+] Reto del Lab 01 preparado en: $BASE"
echo "[+] Listo. El/la estudiante debe encontrar la bandera FLAG{...}"
