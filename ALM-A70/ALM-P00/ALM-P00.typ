#import "../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-P00",
  titulo: "Pliego de especificaciones",
  tipo: "Pliego",
  revision: "0.2",
  estado: "Borrador",
  creado: "23/10/2026",
  autor: "Augusto Aizpún",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
)

= Objeto y alcance

Este documento fija las hipótesis de diseño (ASM), los requisitos (REQ) y los criterios de selección (CRIT) comunes al prediseño de ALIMOCHE. Desarrolla ALM-00 e integra las salidas de sus anexos (@tab:entrada). No elige configuración ni geometría, ni declara cumplimiento normativo. Las convenciones de identificación se recogen en la @tab:convenciones.

#figure(
  table(
    columns: (32mm, 1fr),
    align: (left, left),
    table.header([Código], [Documento]),
    [ALM-00], [Enunciado y bases de diseño],
    [ALM-P00-A01], [Estudio legal],
    [ALM-P00-A02], [Estudio de modelos similares],
    [ALM-P00-A03], [Estudio de materiales],
    [ALM-P00-A04], [Estudio de operaciones],
    [ALM-P00-A05], [Estudio de motorización y mejoras],
  ),
  caption: [Documentación de entrada.],
) <tab:entrada>

#figure(
  table(
    columns: (20mm, 1fr),
    align: (left, left),
    table.header([Código], [Significado]),
    [ASM], [Hipótesis de diseño: datos y reglas de cálculo comunes a todas las propuestas. Usar otros valores requiere una solicitud de cambio.],
    [REQ], [Requisito. Obligatorio: su incumplimiento elimina la propuesta. Objetivo: se puntúa mediante un CRIT.],
    [CRIT], [Criterio de selección, con peso y escala de 0 a 10.],
    [TBD], [Dato pendiente de definir; se indica el anexo o responsable que lo cierra.],
  ),
  caption: [Convenciones.],
) <tab:convenciones>

= Hipótesis de diseño

#item("ASM-01", "Entorno de vuelo")[
  *Caso de diseño.* Aeródromo de Lillo (LELT), cota ≈ 681 m, 40 °C, presión ISA a la cota. Densidad ≈ #q(1.04, "kg/m³", dec: 2) (σ ≈ 0.85; altitud de densidad ≈ 1700 m).

  *Caso de comparación.* ISA a nivel del mar.
]

#item("ASM-02", "Piloto y carga")[
  *Piloto.* Equipado (ropa y casco), de 50 a 90 kg. Diseño trimado con 75 kg sin lastre. Los casos de masa se recogen en la @tab:casos.

  #figure(
    table(
      columns: (26mm, 16mm, 1fr, 1fr),
      align: (left, right, left, left),
      table.header([Caso], [Piloto], [Lastre], [Uso]),
      [M1 · Ligero], [50 kg], [Hasta igualar el CG de M2], [Límite trasero de centrado],
      [M2 · Diseño], [75 kg], [Ninguno], [Trimado y prestaciones],
      [M3 · Máximo], [90 kg], [Ninguno], [Caso estructural; límite delantero de centrado],
    ),
    caption: [Casos de piloto y carga.],
  ) <tab:casos>
]

#item("ASM-03", "Bases de cálculo")[
  *Normativa de referencia.* A definir con el estudio legal (A01). Fijará los factores de carga y de seguridad y los casos de carga. Candidata: CS-22 como guía voluntaria.

  *Métodos de estimación y herramientas.* $C_(L,max)$, factor de Oswald, resistencias y plantilla de desglose de masas comunes, TBD (A02). Cálculo manual y MEF de barras validado contra casos de solución conocida.
]

= Requisitos

Los requisitos se recogen en la @tab:req. Los obligatorios eliminan la propuesta que no los cumple; los objetivos se puntúan mediante un CRIT.

#figure(
  table(
    columns: (15mm, 1fr, 20mm, 22mm, 22mm),
    align: (left, left, left, left, left),
    table.header([ID], [Requisito], [Tipo], [Origen], [Verificación]),
    [REQ-01], [Masa en vacío inferior a 70 kg. Definición exacta TBD (A01).], [Obligatorio], [ALM-00], [Masas],
    [REQ-02], [Admitir pilotos de 50 a 90 kg (casos M1–M3).], [Obligatorio], [ALM-00; ASM-02], [Centrado],
    [REQ-03], [Resistir las cargas de ASM-03.], [Obligatorio], [ALM-00; ASM-03], [Cálculo y ensayo],
    [REQ-04], [Misión: lanzamiento con gomas desde terreno llano y planeo recto a baja altura. Altura y viento TBD (A04).], [Obligatorio], [ALM-00; A04], [Prestaciones],
    [REQ-05], [Construcción de tubo metálico y entelado.], [Obligatorio], [Proyecto], [Revisión],
    [REQ-06], [Vuelo estable y predecible de entrenador básico. Criterios cuantitativos TBD.], [Obligatorio], [ALM-00], [Estabilidad],
    [REQ-07], [CG dentro de límites en los casos M1, M2 y M3.], [Obligatorio], [ASM-02], [Centrado],
    [REQ-08], [Transportable por carretera. Envolvente TBD (A04).], [Obligatorio], [ALM-00; A04], [Cotas],
    [REQ-09], [Fabricable en espacio reducido con medios sencillos.], [Obligatorio], [ALM-00], [Procesos],
    [REQ-10], [Materiales y componentes disponibles en España.], [Obligatorio], [ALM-00; A03], [Materiales],
    [REQ-11], [Coste de materiales de 3500 € ± 500 €.], [Objetivo], [ALM-00], [Presupuesto],
    [REQ-12], [Fabricación en 150 horas-persona.], [Objetivo], [ALM-00], [Horas],
    [REQ-13], [Fácil de inspeccionar, reparar y mantener.], [Objetivo], [ALM-00], [Revisión],
    [REQ-14], [Estructura apta para remolque por coche o torno y aerorremolque.], [Objetivo], [Proyecto], [Cálculo],
  ),
  caption: [Requisitos.],
) <tab:req>

= Criterios de selección

Cada propuesta que cumpla los REQ obligatorios se puntúa de 0 a 10 en cada criterio según su escala (@tab:crit), y su nota final es la suma ponderada con pesos fijados antes de ver las propuestas.

#figure(
  table(
    columns: (16mm, 1fr, 13mm, 34mm, 34mm),
    align: (left, left, right, left, left),
    table.header([ID], [Criterio], [Peso], [0], [10]),
    [CRIT-01], [Margen de masa frente a 70 kg], [25 %], [≥ 70 kg], [Margen ≥ 15 %],
    [CRIT-02], [Sencillez de fabricación], [20 %], [Procesos externos], [Taladros y remaches],
    [CRIT-03], [Transporte y montaje], [15 %], [Más de 4 personas], [2 personas sin herramienta],
    [CRIT-04], [Cualidades de vuelo de entrenador], [15 %], [Estabilidad marginal], [Estable en 3 ejes],
    [CRIT-05], [Inspección y reparación], [10 %], [Uniones ocultas], [Uniones visibles],
    [CRIT-06], [Coste y horas de fabricación], [10 %], [> 4000 € o > 200 h], [≤ 3000 € y ≤ 150 h],
    [CRIT-07], [Potencial de evolución], [5 %], [Impide evolución], [Cumple REQ-14],
  ),
  caption: [Criterios de selección, pesos y escalas.],
) <tab:crit>

#pendiente[Pesos y escalas propuestos; se fijan en reunión del núcleo de prediseño.]
