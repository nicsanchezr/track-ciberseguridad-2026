# track-ciberseguridad-2026

> `root@citt-varas:~/track$ cat README.md`
>
> **Track de Ciberseguridad · CITT Duoc UC — Sede Antonio Varas · 2.º semestre 2026**

Repositorio del track: material de los talleres, sistema de inscripción, Campeonato CTF y documentación.

- **Profesor guía:** Nicolás Sánchez
- **Alumnos líderes:** Pedro Campos · Gladys Espinoza
- **Enfoque:** educativo y defensivo. Las técnicas ofensivas se practican solo en entornos controlados y autorizados.

## Mapa del repo

| Carpeta | Qué contiene |
|---|---|
| `docs/` | Sitio de **inscripción** (se publica con GitHub Pages). |
| `backend/` | Apps Script del formulario (backend en Google Sheets). |
| `plan/` | Plan formativo y cronograma. |
| `talleres/` | Material por taller (T1–T4): guías, slides, recursos y retos. |
| `ctf/` | Campeonato CTF: bases, retos e infraestructura. |
| `identidad/` | Logos, paleta y plantillas del track. |
| `comunicaciones/` | Mensajes y difusión (WhatsApp, etc.). |

## Talleres

| # | Taller | Horas | Requisito previo |
|---|--------|:---:|---|
| T1 | Fundamentos de Linux y Laboratorio | 12 | — (base) |
| T2 | Reconocimiento de Redes y Detección de Vulnerabilidades | 12 | T1 o equivalente |
| T3 | Defensa de Sistemas y Blue Team | 12 | T1 o equivalente |
| T4 | Técnicas Ofensivas y Red Team | 9 | T1 (recomendable T2) |

Son modulares: cada estudiante toma los que le interesen. **T1 es la base** para los demás.

## Inscripción (GitHub Pages)

El formulario vive en `docs/index.html` y guarda en una Google Sheet vía Apps Script (`backend/apps-script/`).

1. Configura y publica el Apps Script (ver `backend/apps-script/README.md`).
2. Pega tu URL `/exec` y tu `TOKEN` en `docs/index.html` (bloque CONFIG).
3. **Settings → Pages → Deploy from a branch → `main` / `docs`.**
4. (Opcional) dominio propio: `docs/CNAME` → `inscripcion.cybervaras.xyz`.

## Ética y seguridad

Repo **público**: no subir flags reales, credenciales, ni payloads de explotación con uplift.
Mantén soluciones/flags en privado. Ver `ctf/README.md`.

## Licencia

Sugerencia: material docente **CC BY-NC-SA 4.0**; código **MIT**. Ajusta `LICENSE`.

> `> repo_cargado_`
