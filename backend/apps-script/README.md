# Backend del formulario — Google Apps Script

`Codigo.gs` recibe las inscripciones y las escribe en una Google Sheet.

## Pasos
1. Crea una Google Sheet nueva (aquí caen las inscripciones).
2. **Extensiones → Apps Script**. Borra todo y pega `Codigo.gs`.
3. Cambia `TOKEN` por uno tuyo (el mismo que pongas en `docs/index.html`).
4. **Implementar → Nueva implementación → Aplicación web**
   - Ejecutar como: **Yo**
   - Quién tiene acceso: **Cualquiera**
   - Autoriza permisos y copia la URL que termina en `/exec`.
   - Pruébala en el navegador: debe responder `OK · endpoint activo`.
5. Pega esa URL en `docs/index.html` → constante `ENDPOINT`.

> Si luego editas el script, usa **Administrar implementaciones → editar → Versión: Nueva**
> para conservar la misma URL.

## Notas
- El `TOKEN` es protección liviana (el código del formulario es público). Para algo más
  estricto se puede agregar captcha o validación adicional; para una clase basta.
- Duplicados: si un correo ya existe, se **actualiza** su fila en vez de duplicar.
