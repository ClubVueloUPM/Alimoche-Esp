// Muestra no controlada. No reserva un código ni declara aprobación.
#import "/plantillas/alimoche.typ": documento, tabla-controlada, figura-controlada

#let meta = (
  codigo: "ALM-EJEMPLO",
  titulo: "Muestra de formato documental",
  tipo: "Demostración no controlada",
  revision: "0.1",
  estado: "Borrador",
  creado: "25/10/2026",
  revisado: "25/10/2026",
  autor: "Equipo ALIMOCHE",
  revisores: (),
  aprobador: "Pendiente de designar",
  aprobacion: "Pendiente",
  padre: none,
  sigue-a: none,
  dependencias: (),
)

#show: documento.with(meta)

= Objeto

Esta muestra enseña el formato común. Los datos son ficticios y no describen el proyecto.

= Tabla redactada

#tabla-controlada(
  table(
    columns: (1fr, 28mm, 35mm),
    table.header([Concepto], [Cantidad (ud)], [Coste (EUR)]),
    [Material A], [2], [12,50],
    [Material B], [1], [8,20],
  ),
  "Resumen ilustrativo de materiales",
  fuente: "Elaboración propia",
  nota: "Datos ficticios",
) <tab-materiales>

La @tab-materiales muestra cómo referenciar una tabla sin numerarla a mano.

= Tabla desde CSV exportado de Excel

#let datos = csv("datos/tabla_ejemplo.csv", delimiter: ";")
#tabla-controlada(
  table(
    columns: (1fr, 35mm, 40mm),
    table.header([Mes], [Muestras (ud)], [Importe (EUR)]),
    [#datos.at(1).at(0)], [#datos.at(1).at(1)], [#datos.at(1).at(2)],
    [#datos.at(2).at(0)], [#datos.at(2).at(1)], [#datos.at(2).at(2)],
  ),
  "Datos importados desde CSV",
  fuente: "datos/tabla_ejemplo.csv, exportación de muestra",
  nota: "Coma decimal conservada como texto",
)

= Gráfica vectorial

#figura-controlada(
  image("figuras/grafica_ejemplo.svg", width: 100%),
  "Muestras por mes",
  fuente: "datos/tabla_ejemplo.csv",
  nota: "Datos ficticios",
)

= Imagen compartida y fotografía

#figura-controlada(
  image("/recursos/logo-cuadrado.jpeg", width: 35mm),
  "Ejemplo de imagen con fuente identificada",
  fuente: "Recurso gráfico de ALIMOCHE",
)

Una fotografía propia se incluye con la misma función, guardando el original en `figuras/` y registrando autor, fecha y escala si son relevantes. Véase `docs/EJEMPLOS_DE_FORMATO.md`.
