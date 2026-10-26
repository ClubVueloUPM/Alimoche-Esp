# ALIMOCHE · Inventario de partida y transición

**Comprobado el 25/10/2026.** Este registro describe lo observado; no atribuye aprobación documental.

## Git activo `Repositorio/`

| Archivo | Observación | Acción propuesta |
|---|---|---|
| `ALM-00_Rev-0.4.pdf` | Cabecera: ALM-00, Rev 0.4, Borrador, 23/10/2026. | Conservar; localizar y cotejar el fuente si se quiere migrar a Typst. |
| `ALM-P00_Rev-0.2.pdf` | Cabecera de ambas páginas: ALM-P00, Rev 0.1, Borrador, 23/10/2026. Nombre y cabecera discrepan. | Conservar intacto; decidir revisión correcta antes de renombrar, regenerar o publicar. |

No hay `documentos/`, `plantillas/`, `recursos/` ni `publicados/` en el estado activo inspeccionado. La propuesta crea esas carpetas al integrar contenido real.

## Material fuera del Git activo

| Ubicación observada | Uso posible | Precaución |
|---|---|---|
| `Copias de seguridad/Alimoche23-10-26/Alimoche/Repositorio/` | Fuente de la plantilla Typst común, esqueleto, recursos y borradores ALM-01/ALM-02. | Es una copia histórica; revisar diferencias y estados antes de reincorporar. |
| `ALM-P00-A01_Estudio_legal_Rev-0.1.pdf` | Estudio auxiliar existente. | Cotejar cabecera y responsable; no reservar A01 de nuevo. |
| `ALM-P00-A05_Estudio_tecnologico_y_mercado_motorizacion_Rev-0.1.pdf` | Estudio auxiliar existente. | Cotejar revisión y relación con P00. |
| `Estudios/ALM-P00-A06/` | Fuente Typst editable, recursos y PDF de trabajo Rev 0.3. | Revisar si se integra y sus dependencias; no tratar el PDF de `compilados/` como emisión aprobada. |
| `ALIMOCHE_Objetivo_estudios_P00.pdf` | Encargo de estudios A01–A05. | Documento de contexto; no es una lista definitiva de códigos reservados. |
| `Plantillas y graficos/` | Logos y plantillas Word heredadas. | Elegir recurso autorizado; el kit incluye solo dos gráficos que usa la plantilla Typst recuperada. |

## Decisiones antes de migrar

1. Resolver con el responsable la discrepancia de revisión de ALM-P00.
2. Decidir qué fuentes históricas corresponden realmente a cada PDF activo, comparando texto, cajetín, revisión y fecha.
3. Confirmar si ALM-01 y ALM-02 de la copia de seguridad se recuperan como borradores y quién los revisará.
4. Definir responsables, revisores y aprobadores; revisar cualquier `equipo.toml` histórico antes de usarlo, porque puede contener entradas duplicadas o desactualizadas.
5. Aprobar o adaptar la política de revisiones y la migración de identificadores `ASM/REQ/CRIT` existentes al esquema largo propuesto.

Mientras estas decisiones estén abiertas, se puede incorporar la estructura y la plantilla como **propuesta de trabajo** sin renombrar ni alterar los PDF activos.
