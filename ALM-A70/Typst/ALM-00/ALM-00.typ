#import "../../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-00",
  titulo: "Enunciado y bases de diseño",
  tipo: "Bases de diseño",
  revision: "0.4",
  estado: "Borrador",
  creado: "23/10/2026",
  autor: "Augusto Aizpún",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
)

= Objetivo del proyecto

Se propone diseñar y construir un planeador monoplaza, ligero, económico y de vuelo seguro y estable. Este documento plantea el enunciado del problema y fija sus bases, sin determinar una solución técnica.

= Requisitos y criterios de partida

La @tab:bases recoge los requisitos y criterios de los que parte el proyecto.

#figure(
  table(
    columns: (42mm, 1fr),
    align: (left, left),
    table.header([Aspecto], [Requisito o criterio]),
    [Tipo de aeronave], [Planeador monoplaza.],
    [Masa en vacío (OEW)], [Inferior a #q(70, "kg"), sin incluir al piloto. Límite obligatorio del proyecto.],
    [Piloto], [Masa máxima de #q(90, "kg").],
    [Seguridad], [Diseño seguro, con comportamiento en vuelo estable y predecible. Entrenador básico.],
    [Presupuesto], [Coste de materiales objetivo de 3500 € ± 500 €.],
    [Tiempo de fabricación], [150 horas-persona, como objetivo preliminar.],
    [Transporte], [Transportable por carretera.],
    [Fabricación], [Viable en un espacio reducido y con medios sencillos y accesibles.],
    [Mantenimiento], [Fácil de inspeccionar, reparar y mantener.],
    [Filosofía de diseño], [Simplicidad y accesibilidad. Materiales y componentes disponibles en España.],
  ),
  caption: [Requisitos y criterios de partida.],
) <tab:bases>
