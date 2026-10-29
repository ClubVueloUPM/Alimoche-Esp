#import "../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-A70-IND",
  titulo: "Índice documental de ALM-A70",
  tipo: "Índice documental",
  revision: "0.2",
  estado: "Borrador",
  creado: "29/10/2026",
  autor: "Equipo ALIMOCHE",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
  indice: false,
)

#figure(
  table(
    columns: (29mm, 1fr, 15mm, 23mm),
    align: (left, left, center, left),
    table.header([Código], [Documento], [Rev.], [Estado]),
    [ALM-00], [Enunciado y bases de diseño], [0.4], [Borrador],
    [ALM-P00], [Pliego de especificaciones], [0.2], [Borrador],
    [ALM-P00-A01], [Estudio legal], [0.5], [Borrador],
    [ALM-P00-A04], [Estudio de operaciones], [0.2], [Borrador],
    [ALM-P00-A05], [Estudio de motorización y mejoras], [0.5], [Aprobado],
    [ALM-P00-A06], [Estimación aerodinámica preliminar], [0.2], [Borrador],
  ),
  caption: [Documentos disponibles de la serie ALM-A70.],
)
