/**
 * Inscripción Talleres de Ciberseguridad — CITT Varas
 * Backend Google Apps Script -> escribe en la Google Sheet a la que está asociado.
 *
 * Pasos:
 *  1. Crea una Google Sheet nueva.
 *  2. Extensiones > Apps Script. Borra todo y pega ESTE archivo.
 *  3. Cambia TOKEN por uno tuyo (debe ser el MISMO que pongas en index.html).
 *  4. Implementar > Nueva implementación > Aplicación web:
 *       - Ejecutar como: Yo
 *       - Quién tiene acceso: Cualquiera
 *     Implementa y AUTORIZA los permisos. Copia la URL que termina en /exec.
 *  5. Pega esa URL en index.html (constante ENDPOINT).
 *  Nota: si luego editas este script, usa "Administrar implementaciones" >
 *        editar (lápiz) > Versión: Nueva, para conservar la MISMA URL.
 */

const TOKEN = 'citt2026';                                   // <-- cámbialo (igual en index.html)
const HOJA  = 'Inscripciones';
const HEAD  = ['Fecha', 'Nombre', 'Apellido', 'Correo', 'Carrera', 'Intereses'];

function doPost(e) {
  const lock = LockService.getScriptLock();
  try {
    lock.waitLock(20000);
    const data = JSON.parse((e && e.postData && e.postData.contents) || '{}');
    if (data.token !== TOKEN) return json({ ok: false, error: 'token' });

    const nombre   = String(data.nombre   || '').trim();
    const apellido = String(data.apellido || '').trim();
    const correo   = String(data.correo   || '').trim().toLowerCase();
    const carrera  = String(data.carrera  || '').trim();
    const interes  = Array.isArray(data.interes) ? data.interes.join(', ') : String(data.interes || '');
    if (!nombre || !apellido || !correo || !carrera) return json({ ok: false, error: 'campos' });

    const ss = SpreadsheetApp.getActiveSpreadsheet();
    let sh = ss.getSheetByName(HOJA);
    if (!sh) sh = ss.insertSheet(HOJA);
    if (sh.getLastRow() === 0) {
      sh.appendRow(HEAD);
      sh.getRange(1, 1, 1, HEAD.length).setFontWeight('bold');
      sh.setFrozenRows(1);
    }

    const fecha = Utilities.formatDate(new Date(), 'America/Santiago', 'yyyy-MM-dd HH:mm');
    const row = [fecha, nombre, apellido, correo, carrera, interes];

    // Evita duplicados: si el correo ya existe, actualiza esa fila.
    const values = sh.getDataRange().getValues();
    let found = -1;
    for (let i = 1; i < values.length; i++) {
      if (String(values[i][3] || '').trim().toLowerCase() === correo) { found = i + 1; break; }
    }
    if (found > 0) sh.getRange(found, 1, 1, row.length).setValues([row]);
    else sh.appendRow(row);

    return json({ ok: true, updated: found > 0 });
  } catch (err) {
    return json({ ok: false, error: String(err) });
  } finally {
    try { lock.releaseLock(); } catch (_) {}
  }
}

// Para probar en el navegador que el endpoint está vivo.
function doGet() {
  return ContentService.createTextOutput('OK · endpoint de inscripciones activo');
}

function json(obj) {
  return ContentService.createTextOutput(JSON.stringify(obj))
    .setMimeType(ContentService.MimeType.JSON);
}
