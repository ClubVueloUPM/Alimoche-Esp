# ALIMOCHE · Ejemplos de formato reutilizables

**Estado:** ejemplos de trabajo, no emisiones. La muestra compilable está en `ejemplos/documento_ejemplo.typ`; utiliza datos ficticios para enseñar el formato. Las funciones `tabla-controlada` y `figura-controlada` viven en `plantillas/alimoche.typ`.

## 1. Tabla redactada en Typst

```typst
#import "/plantillas/alimoche.typ": tabla-controlada

#tabla-controlada(
  table(
    columns: (1fr, 28mm, 35mm),
    table.header([Concepto], [Cantidad (ud)], [Coste (EUR)]),
    [Material A], [2], [12,50],
    [Material B], [1], [8,20],
  ),
  "Resumen ilustrativo de materiales",
  fuente: "Elaboración propia; datos/costes.csv, 25/10/2026",
  nota: "Importes sin impuestos; datos ficticios",
)
```

La unidad va en el encabezado. El título dice qué compara la tabla. La fuente y los límites van en la leyenda, que se numera automáticamente. En tablas largas se utiliza `table.header` para que el encabezado se repita; evitar capturas de pantalla de una hoja de cálculo.

## 2. Tabla desde Excel

Conservar el libro `.xlsx` si es el origen editable. Exportar la hoja o rango necesarios a CSV **UTF-8**, con nombre estable y una fila de encabezados. En Excel configurado en español es habitual el separador `;`; indicarlo explícitamente al leerlo. Ejemplo `datos/tabla_ejemplo.csv`:

```csv
Mes;Muestras (ud);Importe (EUR)
Enero;3;12,50
Febrero;4;16,80
```

```typst
#let datos = csv("datos/tabla_ejemplo.csv", delimiter: ";")
#tabla-controlada(
  table(
    columns: (1fr, 35mm, 40mm),
    table.header([Mes], [Muestras (ud)], [Importe (EUR)]),
    [#datos.at(1).at(0)], [#datos.at(1).at(1)], [#datos.at(1).at(2)],
    [#datos.at(2).at(0)], [#datos.at(2).at(1)], [#datos.at(2).at(2)],
  ),
  "Datos exportados de una hoja de cálculo",
  fuente: "Libro ejemplo.xlsx, hoja Resumen, rango A1:C3, exportación 25/10/2026",
  nota: "Datos ficticios; coma decimal preservada como texto",
)
```

Para tablas de longitud variable, generar la tabla con un script verificable o una función Typst y conservar el CSV de entrada. El informe debe indicar si las celdas exportadas son valores de fórmulas, qué versión del libro se usó y cómo se redondeó. Los decimales con coma se muestran como texto hasta convertirlos con una regla explícita; no asumir una conversión numérica implícita.

## 3. Gráfica de datos

Conservar el CSV de origen y el script. Usar SVG para líneas y texto nítidos; PNG de suficiente resolución para imágenes rasterizadas. Rotular ambos ejes y sus unidades, leyenda de series y condiciones. `ejemplos/generar_grafica.py` lee el CSV e imprime `ejemplos/figuras/grafica_ejemplo.svg`; se ejecuta desde la raíz con `python ejemplos/generar_grafica.py`.

```typst
#figura-controlada(
  image("figuras/grafica_ejemplo.svg", width: 100%),
  "Evolución ilustrativa de muestras por mes",
  fuente: "datos/tabla_ejemplo.csv; gráfica generada a partir de sus valores",
  nota: "Datos ficticios",
)
```

No usar solamente color para separar curvas: añadir trazos, marcadores o etiquetas. Una gráfica no sustituye los datos tabulados que permiten revisarla.

## 4. Fotografía, imagen o lámina

Guardar el archivo con el documento, por ejemplo `figuras/foto_20261025_union_01.jpg`. Conservar el original sin editar cuando la imagen sea evidencia; si se recorta o anota, guardar una copia derivada y explicar el cambio. Indicar autor, fecha, vista/escala cuando sea relevante y permiso de uso. La misma función también sirve para diagramas y láminas.

```typst
#figura-controlada(
  image("figuras/foto_20261025_union_01.jpg", width: 75%),
  "Vista frontal de la unión examinada",
  fuente: "Fotografía: Nombre Apellido, 25/10/2026",
  nota: "Escala visible; imagen original archivada junto al documento",
)
```

El archivo del fragmento es un **nombre de ejemplo** y debe reemplazarse por una fotografía real y autorizada. No se debe inventar procedencia. El documento `ejemplos/documento_ejemplo.typ` usa el logo compartido para mostrar una imagen sin depender de una foto externa.

## 5. Referencias y referencias cruzadas

```typst
#tabla-controlada(table(columns: 1, table.header([Dato]), [Ejemplo]),
  "Tabla de demostración", fuente: "Elaboración propia") <tab-demo>

Como indica la @tab-demo, los valores son solo ilustrativos.
```

Al citar otro documento, escribir código, revisión y apartado, por ejemplo `ALM-P00 Rev 0.1, §2`; si la revisión del PDF y su nombre no coinciden, registrar la incidencia antes de fijar la cita. Las fuentes externas necesitan título, autor/organismo, fecha o versión y enlace o localización estable.

## 6. Comprobación visual de cada documento

Revisar todas las páginas del PDF: cajetín, pie y número de hoja; títulos y leyendas completos; tablas sin columnas cortadas y con unidades visibles; ejes legibles; fotografías sin deformación; referencias correctas y ninguna página con leyenda huérfana. Si un elemento no cabe, reorganizarlo antes de reducir la letra.
