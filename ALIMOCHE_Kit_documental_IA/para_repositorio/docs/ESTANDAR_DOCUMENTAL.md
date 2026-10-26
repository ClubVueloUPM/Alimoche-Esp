# ALIMOCHE · Estructura, nomenclatura y plantillas documentales

**Versión de esta propuesta:** 0.1 · **Fecha:** 25/10/2026 · **Estado:** propuesta para revisión. No es una emisión aprobada de ALM-01.

## 1. Alcance y autoridad

Esta guía ordena documentos técnicos, estudios, fuentes, PDF y evidencias del proyecto ALIMOCHE. Al integrarla, debe compararse con documentos activos y decisiones del equipo. La propuesta histórica `ALM-01` define la arquitectura documental y `ALM-02` describe su aplicación con Git y Typst; ambas se localizaron en la copia de seguridad del 23/10/2026 y no están en el Git activo. Si el equipo recupera y aprueba ALM-01, esa emisión será la norma de referencia y esta guía deberá alinearse con ella.

El contenido técnico y su autorización corresponden a las personas designadas. La IA puede preparar fuentes, comprobar forma y trazabilidad, y señalar conflictos. No puede atribuir aprobaciones ni convertir un borrador en emisión oficial.

## 2. Árbol de carpetas

```text
ALIMOCHE/
  README.md
  AGENTS.md
  docs/
    ESTANDAR_DOCUMENTAL.md
    INVENTARIO_Y_TRANSICION.md
  documentos/
    ALM-00/ALM-00.typ
    ALM-P00/ALM-P00.typ
    ALM-P00-A01/ALM-P00-A01.typ
  plantillas/
    alimoche.typ
    nuevo-documento.typ
    estudio.md
    ficha-salida.md
    manifiesto-publicacion.toml.ejemplo
  recursos/
  herramientas/
    typst-version.txt
  compilados/
  publicados/
    <CÓDIGO>/<CÓDIGO>_Rev-<REV>_<AAAAMMDD>.pdf
    <CÓDIGO>/<CÓDIGO>_Rev-<REV>_<AAAAMMDD>.toml
```

Las entradas de `documentos/` son **ejemplos de ruta**, no una instrucción para generar fuentes de los PDF activos. Todas están al mismo nivel. Una carpeta puede incluir `figuras/`, `datos/` y un `LEEME.md` si hacen falta; datos y figuras comunes van en `recursos/` solo cuando realmente se compartan. `cad/`, `calculos/` y almacenes de datos grandes se abren al definir propietario, formato y trazabilidad. No se colocan copias de seguridad ni archivos temporales dentro de `documentos/`.

## 3. Identificadores de documentos

| Forma | Uso | Ejemplo |
|---|---|---|
| `ALM-NN` | Documento general independiente | `ALM-00` |
| `ALM-PNN` | Documento principal de una fase o serie P | `ALM-P00` |
| `ALM-PNN-ANN` | Auxiliar subordinado a un documento P | `ALM-P00-A06` |

`NN` representa dos cifras en las series mostradas. El código es único, permanente y no se reutiliza. Las familias futuras se abren por decisión explícita del proyecto; no se inventan códigos por analogía. La carpeta y el fuente tienen exactamente el mismo código: `documentos/ALM-P00-A06/ALM-P00-A06.typ`. El título, la revisión y el estado se guardan en `meta`, no en el nombre del `.typ`.

Un auxiliar declara `padre: "ALM-P00"`. Un documento que sigue a otro del mismo nivel usa `sigue-a`; esto no lo convierte en hijo. Las entradas técnicas se enumeran en `dependencias`. Una referencia cruzada tampoco cambia la jerarquía. Si la relación de ALM-P00 con ALM-00 no está decidida formalmente, descríbela como fuente o dependencia; no la supongas a partir de la expresión «desarrolla» en un borrador.

## 4. Bloque de metadatos

Cada `.typ` tiene un solo bloque `meta` al inicio. Campos mínimos:

| Campo | Regla |
|---|---|
| `codigo`, `titulo`, `tipo` | Identidad, título legible y función documental. |
| `revision` | Texto `0.1`, `0.2`, `1.0`, etc.; no equivale a un commit. La política exacta de numeración está pendiente de aprobación. |
| `estado` | `Borrador`, `En revisión`, `Aprobado` u `Obsoleto`. |
| `creado`, `revisado` | Fechas `DD/MM/AAAA`; `creado` permanece estable. |
| `autor`, `revisores`, `aprobador`, `aprobacion` | Personas reales y evidencia. Hasta designarlas, usar `Pendiente`, nunca una firma supuesta. |
| `padre`, `sigue-a` | Código existente o `none`; relaciones distintas. |
| `dependencias` | Lista de códigos cuyas salidas usa el documento. |

La plantilla común dibuja el cajetín y valida la forma. Cada documento la importa; no se copia el cajetín dentro de cada fuente. Un cambio de formato se hace en la plantilla y no modifica emisiones ya publicadas. Los metadatos constituyen la fuente para construir el árbol, la secuencia y el mapa de dependencias.

## 5. Estados, revisiones y trazabilidad

- `Borrador`: trabajo editable. `En revisión`: versión presentada para examen. `Aprobado`: autorización registrada por el aprobador designado. `Obsoleto`: fuera de uso corriente, con motivo y sucesor si existe.
- Un commit conserva un cambio; la revisión identifica una emisión documental. Integrar en `main` o generar un PDF no aprueba nada.
- Al cambiar una entrada, los documentos consumidores evalúan y registran `sin impacto`, `actualizar` o `pendiente`. No se altera automáticamente su estado.
- Una revisión aprobada que cambie inicia otra revisión controlada y conserva íntegra la emisión anterior.
- Para datos, cálculos, referencias externas y figuras, consigna origen, fecha/versión, unidades cuando apliquen, método y límites de uso. Distingue dato comprobado, hipótesis, resultado y decisión.

## 6. Nombres de archivos y publicaciones

| Elemento | Nombre/ruta propuesta | Regla |
|---|---|---|
| Fuente | `documentos/<CÓDIGO>/<CÓDIGO>.typ` | Editable; nombre estable. |
| PDF de trabajo | `compilados/<CÓDIGO>.pdf` | Regenerable; excluido de Git. |
| PDF aprobado | `publicados/<CÓDIGO>/<CÓDIGO>_Rev-<REV>_<AAAAMMDD>.pdf` | Inmutable. |
| Manifiesto | Mismo nombre base con `.toml` | Commit, etiqueta, aprobación, versión de Typst, hash y dependencias. |
| Rama de trabajo | `doc/<codigo-en-minusculas>-<tema-breve>` | Identifica trabajo, no estado. |
| Etiqueta de emisión | `doc/<CÓDIGO>/<REV>` | Solo tras autorización y validación. |

Los PDF existentes en la raíz del Git son **legado de trabajo**, no emisiones trasladables automáticamente a `publicados/`. La revisión del cajetín debe coincidir con la del nombre y el manifiesto antes de publicar. `ALM-P00_Rev-0.2.pdf` incumple esa coincidencia: en la cabecera dice 0.1. Conservarlo sin alterar y resolver la incidencia con el responsable.

Para archivos propios del documento, usar minúsculas, guiones bajos y nombres descriptivos: `datos/tabla_costes_20261025.csv`, `figuras/grafica_costes.svg`, `figuras/foto_20261025_detalle_01.jpg`. El nombre identifica el contenido; la leyenda identifica procedencia, fecha y condiciones. Evitar `final`, `nuevo`, `copia` y revisiones inventadas en nombres de trabajo. Si el original tiene un nombre externo fijo, conservarlo y documentar su alias en el `LEEME.md` del documento.

## 7. Salidas técnicas y referencias

El P00 activo usa `ASM-01`, `REQ-01`, `CRIT-01`, etc. Esos identificadores siguen siendo válidos para citar **ese borrador y su revisión**. La propuesta histórica de ALM-01 usa la forma `<DOC>_<TIPO>_<NN>`, por ejemplo `P00_REQ_05`, donde `<DOC>` identifica el documento que incorpora y utiliza la salida. Tipos propuestos: `REQ` requisito, `CRIT` criterio, `DEC` decisión, `HIP` hipótesis, `PAR` parámetro, `DAT` dato/resultado, `INT` interfaz, `VER` verificación y `RIE` riesgo. `LEG` y `REF` pueden preservarse donde ya existan.

**Regla de transición:** no sustituir `REQ-05` por `P00_REQ_05` en el P00 actual mediante búsqueda y reemplazo. Una adopción formal necesita una revisión controlada, tabla `identificador anterior → nuevo`, actualización de referencias y comprobación de duplicados. Una salida definida por un auxiliar recibe código del documento de uso solo cuando este la incorpora y cita el auxiliar, su revisión y apartado. Las referencias posteriores citan siempre documento, revisión y salida o apartado.

## 8. Plantillas y contenido mínimo

`plantillas/alimoche.typ` contiene el estilo, cajetín y validación; `plantillas/nuevo-documento.typ` contiene el bloque `meta` y se copia al crear el documento. `plantillas/estudio.md` orienta el contenido de un estudio antes de escribirlo en Typst. `plantillas/ficha-salida.md` ayuda a preparar una salida con fuente y destino, sin crear un registro paralelo autoritativo. El manifiesto TOML es un **ejemplo de campos**, nunca una emisión cumplimentada.

La plantilla común aporta `tabla-controlada` y `figura-controlada`. Toda tabla, gráfica, foto, esquema o lámina que se cite como evidencia lleva número automático, título descriptivo, fuente y, cuando proceda, nota de condiciones o limitaciones. La **gráfica, foto y lámina comparten la serie «Figura»**; las tablas llevan su propia serie «Tabla». Los documentos no numeran estos objetos a mano. `docs/EJEMPLOS_DE_FORMATO.md` contiene ejemplos completos de Typst, CSV exportado de Excel, gráfica SVG y fotografía.

Reglas de presentación comunes:

| Elemento | Convención propuesta |
|---|---|
| Página | A4, marco, cajetín, marca de agua y pie de commit de la plantilla común. No se redefinen en cada documento. |
| Texto | Español; títulos jerárquicos de Typst `=`, `==`, `===`; párrafos y listas consistentes. |
| Tablas | Cabecera con `table.header`, columnas con anchura deliberada, unidad en encabezado, cifras comparables con la misma precisión. Repetir encabezado si continúa en otra página. |
| Datos Excel | Conservar `.xlsx` solo si es la fuente editable; exportar a CSV UTF-8 para el documento, registrar hoja, rango, fecha, fórmula/valor y criterio de redondeo. No pegar capturas de celdas como tabla. |
| Gráficas | Generar desde datos versionados. Preferir SVG/PDF vectorial si se ve bien; rotular ejes, magnitudes, unidades, series y condiciones. No usar color como único medio de distinguir series. |
| Fotos e imágenes | Archivo original o copia trazable en `figuras/`; indicar autor/procedencia, fecha, objeto, orientación/escala cuando importe y permiso de uso. No estirar ni recortar de manera que cambie la interpretación. |
| Referencias | Citar código, revisión y apartado de documentos internos; autor/organismo, título, versión o fecha y enlace de fuentes externas. |
| Matemáticas y unidades | Definir símbolos, usar unidades SI y especificar qué es medido, calculado o supuesto. No presentar más cifras significativas que las justificadas por la entrada. |
| Accesibilidad | Título que explique la conclusión de tabla/figura, contraste suficiente y texto alternativo o descripción en prosa para la información esencial. |

El contenido debe caber en el ancho útil A4. Si una tabla es ancha, reducir columnas, dividirla o usar una página apaisada controlada por plantilla antes que bajar la letra a un tamaño ilegible. La edición de la plantilla común requiere recompilar una muestra con tabla larga, gráfica, foto y varias páginas para detectar cortes, desbordamientos y leyendas huérfanas.

La maqueta común se modifica en `plantillas/alimoche.typ`. Los documentos no redefinen localmente `page`, `text`, `heading`, `table` o `figure.caption` para resolver un caso particular: se corrige la plantilla o se crea una variante documentada y aprobada. Evitar numeración manual de secciones, tablas y figuras, saltos de página usados solo para maquillar un borrador, y pies de fuente escritos en texto libre con estilos distintos.

Un estudio debe indicar objeto, alcance, fuentes y revisión de las entradas, método, resultados, incertidumbre o límites, salidas propuestas para el documento de uso, referencias y cambios. Debe dejar claro qué está verificado y qué requiere decisión. Un documento no afirma conformidad, aptitud operativa o aprobación técnica por el solo hecho de compilar.

## 9. Comprobaciones de integración

1. El código, el nombre de carpeta, el `.typ` y `meta.codigo` coinciden; no hay duplicados ni referencias circulares.
2. Los valores `padre`, `sigue-a` y `dependencias` apuntan a códigos existentes o quedan anotados como pendientes, sin inventar documentos para satisfacer la validación.
3. Cada `.typ` nuevo compila desde la raíz con la versión de Typst declarada; se inspecciona el PDF resultante.
4. Los datos de aprobación solo se cumplimentan a partir de evidencia. Los PDF de `publicados/` conservan PDF, manifiesto y hash; no se sobreescriben.
5. El inventario de transición conserva el nombre, revisión y estado observados de cada archivo legado, incluso si se contradicen.
