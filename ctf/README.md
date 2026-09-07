# Campeonato CTF (actividad paralela)

Actividad **paralela e independiente** de los talleres. Arranca en **octubre**, dura
**3 semanas** con **liberación de desafíos cada semana**. Inscripción voluntaria.
6.ª edición desde 2022. En evaluación un formato **intersede**.

## Estructura
- `retos/` — por categoría (`web/`, `redes/`, `forense/`, `osint/`, `pwn/`).
  Cada reto en su carpeta: enunciado + archivos que recibe el participante.
- `infra/` — despliegue de la plataforma (CTFd / `docker-compose`).

## Seguridad (importante)
Este repositorio es **público**. NO subir:
- **Flags reales** — usa placeholders; guarda las flags en un repo/archivo **privado**
  o en variables de entorno del despliegue.
- **Soluciones / writeups** antes del cierre del campeonato.
- **Credenciales** ni payloads con uplift real.
