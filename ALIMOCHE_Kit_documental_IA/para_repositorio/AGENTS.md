# Instrucciones para IA en el repositorio ALIMOCHE

Lee `README.md`, `docs/ESTANDAR_DOCUMENTAL.md`, `docs/EJEMPLOS_DE_FORMATO.md` y `docs/INVENTARIO_Y_TRANSICION.md` antes de crear o renombrar documentos.

- Conserva las fuentes, PDF y referencias existentes. No deduzcas que una revisión está aprobada por el nombre del archivo.
- Usa un código estable `ALM-...` para cada documento. Reserva uno nuevo creando `documentos/<CÓDIGO>/<CÓDIGO>.typ` con metadatos completos y estado `Borrador`; comprueba antes que no existe ni se reutilizó.
- Mantén todas las carpetas de documentos al mismo nivel. Declara `padre`, `sigue-a` y `dependencias` en el bloque `meta`; no infieras la jerarquía a partir de rutas.
- Para documentos nuevos, parte de `plantillas/nuevo-documento.typ` e importa `plantillas/alimoche.typ`. Separa datos comprobados, hipótesis, resultados y decisiones; cita fuentes, revisión y apartado.
- Conserva los identificadores históricos de ALM-P00 (`ASM-01`, `REQ-01`, `CRIT-01`) hasta una migración aprobada. No crees una segunda identidad para la misma salida.
- Las carpetas `compilados/` contienen PDF de trabajo. `publicados/` recibe solo emisiones aprobadas con PDF y manifiesto; nunca modifiques una emisión previa.
- Antes de terminar, compila los `.typ` modificados, revisa el PDF, verifica referencias y describe los archivos cambiados. Si falta una fuente o una decisión humana, registra el punto pendiente sin inventar datos.

Este archivo guía la edición. No concede aprobación documental ni sustituye una decisión del responsable.
