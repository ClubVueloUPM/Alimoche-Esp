// =====================================================================
//  PROYECTO ALIMOCHE · Plantilla documental común (Typst 0.15.1)
//  Formato fijado por ALM-FMT-01. NO se copia ni se edita por documento:
//  cada documento la importa con  #import "../../plantilla/alimoche.typ": *
// =====================================================================

// ---------- Constantes de formato -------------------------------------
#let FUENTE = ("Arial", "Liberation Sans")      // Liberation Sans = métrica idéntica a Arial
#let FUENTE-MONO = ("Consolas", "DejaVu Sans Mono")
#let NEGRO = rgb("000000")
#let GRIS = rgb("555555")                          // textos secundarios (pie, fuentes)
#let GRIS-CLARO = rgb("e6e6e6")                    // único relleno admitido (cabecera de tabla)
#let TRAZO-MARCO = 0.8pt + NEGRO
#let TRAZO-CAJETIN = 0.6pt + NEGRO
#let TRAZO-TABLA = 0.5pt + NEGRO
#let ESTADOS = ("Borrador", "En revisión", "Aprobado", "Obsoleto")

// Geometría (A4: 210 × 297 mm)
#let M-MARCO = 10mm         // distancia del marco al borde del papel
#let H-CAJETIN = 33mm       // alto del cajetín
#let LOGO = "recursos/logo-cuadrado.jpeg"
#let MARCA-AGUA = "recursos/logo-marca-agua.png"

// ---------- Números: punto decimal, millares con espacio fino ----------
// num(1569) -> 1569 · num(15690) -> 15 690 · num(0.055, dec: 3) -> 0.055
#let num(x, dec: none) = {
  let v = if dec == none { x } else { calc.round(x, digits: dec) }
  let neg = v < 0
  let s = str(calc.abs(v))
  if dec != none and dec > 0 {
    if not s.contains(".") { s = s + "." }
    let partes = s.split(".")
    let frac = partes.at(1)
    while frac.len() < dec { frac = frac + "0" }
    s = partes.at(0) + "." + frac
  }
  let partes = s.split(".")
  let ent = partes.at(0)
  if ent.len() > 4 {                       // agrupar de 3 en 3 a partir de 5 cifras
    let grupos = ()
    while ent.len() > 3 {
      grupos.insert(0, ent.slice(ent.len() - 3))
      ent = ent.slice(0, ent.len() - 3)
    }
    grupos.insert(0, ent)
    ent = grupos.join(sym.space.nobreak.narrow)
  }
  let r = if partes.len() > 1 { ent + "." + partes.at(1) } else { ent }
  if neg { "−" + r } else { r }
}

// Cantidad con unidad, espacio no separable: q(9.81, "m/s²", dec: 2) -> 9.81 m/s²
#let q(x, unidad, dec: none) = [#num(x, dec: dec)#sym.space.nobreak#unidad]

// ---------- Bloques de contenido --------------------------------------
// Identificadores con nombre propio (ASM-01, REQ-01, CRIT-01, ...)
#let item(id, titulo, cuerpo) = block(
  above: 0.9em, below: 0.9em, breakable: true,
  grid(
    columns: (19mm, 1fr), column-gutter: 2mm, row-gutter: 0.45em,
    text(weight: "bold")[#id], text(weight: "bold")[#titulo],
    [], cuerpo,
  ),
)

// Nota aclaratoria y asunto pendiente (sin color: solo trazo)
#let nota(cuerpo) = block(
  width: 100%, inset: (x: 3mm, y: 2.2mm), stroke: 0.5pt + NEGRO, above: 1em, below: 1em,
)[#text(weight: "bold")[Nota.] #cuerpo]

#let pendiente(cuerpo) = block(
  width: 100%, inset: (x: 3mm, y: 2.2mm), above: 1em, below: 1em,
  stroke: (paint: NEGRO, thickness: 0.5pt, dash: "dashed"),
)[#text(weight: "bold")[Pendiente.] #cuerpo]

// Línea de fuente bajo tablas y figuras
#let fuente(cuerpo) = align(left, text(8pt, fill: GRIS)[Fuente: #cuerpo])

// Tabla a partir de un CSV ya leído en el documento (primera fila = cabecera):
//   #tabla-csv(csv("datos/masas.csv"), alinear: (left, right, right))
// (csv() se llama en el documento porque Typst resuelve rutas desde el archivo que llama)
// Si el CSV viene de un Excel en español («;» y coma decimal):
//   #tabla-csv(csv("datos/x.csv", delimiter: ";"), coma-a-punto: true)
#let tabla-csv(filas, columnas: auto, alinear: auto, coma-a-punto: false) = {
  if coma-a-punto {
    filas = filas.map(f => f.map(c => if c.match(regex("^[−-]?\d+,\d+$")) != none { c.replace(",", ".") } else { c }))
  }
  let n = filas.at(0).len()
  table(
    columns: if columnas == auto { n } else { columnas },
    align: if alinear == auto { (left,) + (right,) * (n - 1) } else { alinear },
    table.header(..filas.at(0)),
    ..filas.slice(1).flatten(),
  )
}

// Lista de referencias numeradas [1], [2]... (citar en el texto como [1])
#let referencias(lista) = {
  heading(numbering: none)[Referencias]
  set text(9pt)
  grid(
    columns: (9mm, 1fr), row-gutter: 0.6em,
    ..lista.enumerate().map(((i, r)) => ([[#(i + 1)]], r)).flatten(),
  )
}

// Paso a anexos: los títulos de nivel 1 pasan a «Anexo A», «Anexo B»...
#let anexos(cuerpo) = {
  counter(heading).update(0)
  set heading(numbering: (..n) => {
    let n = n.pos()
    if n.len() == 1 { "Anexo " + numbering("A", ..n) } else { numbering("A.1", ..n) }
  })
  pagebreak(weak: true)
  cuerpo
}

// ---------- Cajetín ------------------------------------------------------
#let _campo(etiqueta, valor, grande: false) = block(
  width: 100%, height: 100%, inset: (x: 1.8mm, top: 1.6mm, bottom: 1mm),
  stack(
    spacing: 1.3mm,
    text(5.6pt, weight: "bold", upper(etiqueta)),
    text(if grande { 9pt } else { 8pt }, weight: "bold", valor),
  ),
)

#let _cajetin(d) = {
  let fecha = if d.creado == d.modificado { d.creado } else { d.creado + " / " + d.modificado }
  let aprob = {
    if d.firma != none { box(height: 5mm, d.firma) }
    text(8pt, weight: "bold", d.aprobacion)
  }
  table(
    columns: (30mm, 1fr, 31mm, 15mm, 31mm),
    rows: (12mm, 10.5mm, 10.5mm),
    stroke: TRAZO-CAJETIN,
    fill: none,
    inset: 0pt,
    table.cell(rowspan: 3, align: center + horizon, image(LOGO, width: 24mm)),
    _campo("Documento", d.titulo, grande: true),
    _campo("Código", d.codigo, grande: true),
    _campo("Revisión", d.revision, grande: true),
    _campo("Hoja", context [#counter(page).display() / #counter(page).final().first()], grande: true),
    _campo("Tipo", d.tipo),
    table.cell(colspan: 2, _campo("Creación / últ. revisión", fecha)),
    _campo("Estado", d.estado),
    _campo("Elaboración", d.autor),
    table.cell(colspan: 2, _campo("Revisión técnica", d.revisor)),
    _campo("Aprobación", aprob),
  )
}

// ---------- Documento ----------------------------------------------------
#let documento(
  codigo: "ALM-XX",
  titulo: "Título del documento",
  tipo: "Documento técnico",
  revision: "0.1",
  estado: "Borrador",
  creado: "DD/MM/AAAA",
  modificado: none,
  autor: "Nombre Apellido",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
  firma: none,          // image("...") de la firma; SOLO si el responsable lo indica
  indice: false,        // índice tras el título (recomendado si > 6 hojas)
  cuerpo,
) = {
  assert(estado in ESTADOS, message: "Estado no admitido: " + estado)
  let d = (
    codigo: codigo, titulo: titulo, tipo: tipo, revision: revision, estado: estado,
    creado: creado, modificado: if modificado == none { creado } else { modificado },
    autor: autor, revisor: revisor, aprobacion: aprobacion, firma: firma,
  )

  set document(title: codigo + " · " + titulo, author: autor, keywords: ("ALIMOCHE", codigo))
  set text(font: FUENTE, size: 10pt, lang: "es", region: "ES", fill: NEGRO, hyphenate: true)
  set par(justify: true, leading: 0.62em, spacing: 0.95em, first-line-indent: 0pt)
  show raw: set text(font: FUENTE-MONO, size: 8.5pt)
  show math.equation: set text(font: "New Computer Modern Math")

  set page(
    paper: "a4",
    margin: (
      top: M-MARCO + H-CAJETIN + 8mm,
      bottom: M-MARCO + 12mm,
      left: M-MARCO + 10mm,
      right: M-MARCO + 10mm,
    ),
    header: none,
    footer: none,
    background: {
      place(center + horizon, image(MARCA-AGUA, width: 125mm))
      place(top + left, dx: M-MARCO, dy: M-MARCO,
        rect(width: 210mm - 2 * M-MARCO, height: 297mm - 2 * M-MARCO, stroke: TRAZO-MARCO))
      place(top + left, dx: M-MARCO, dy: M-MARCO,
        block(width: 210mm - 2 * M-MARCO, height: H-CAJETIN, _cajetin(d)))
      place(bottom + left, dx: M-MARCO + 4mm, dy: -(M-MARCO + 3.5mm),
        text(7pt, fill: GRIS)[#codigo · Rev. #revision · #estado])
      place(bottom + right, dx: -(M-MARCO + 4mm), dy: -(M-MARCO + 3.5mm),
        text(7pt, fill: GRIS)[PROYECTO ALIMOCHE])
    },
  )

  // Títulos: máximo dos niveles numerados; el tercero va sin número
  set heading(numbering: "1.1")
  show heading: set block(above: 1.35em, below: 0.7em)
  show heading.where(level: 1): set text(12pt, weight: "bold")
  show heading.where(level: 2): set text(10.5pt, weight: "bold")
  show heading.where(level: 3): it => block(above: 1.1em, below: 0.6em, text(10pt, weight: "bold", it.body))
  show heading: it => { set par(justify: false); it }

  // Listas
  set list(marker: [–], indent: 3mm, body-indent: 2mm)
  set enum(indent: 3mm, body-indent: 2mm, numbering: "a)")

  // Ecuaciones numeradas (1), (2)...
  set math.equation(numbering: "(1)", supplement: [Ec.])

  // Tablas: trazo negro fino, cabecera en negrita con gris claro
  set table(stroke: TRAZO-TABLA, inset: (x: 1.6mm, y: 1.25mm))
  show table: set text(9pt)
  show table: set par(justify: false, leading: 0.5em)
  show table.cell.where(y: 0): set text(weight: "bold")
  set table(fill: (_, y) => if y == 0 { GRIS-CLARO })

  // Figuras y tablas: «Tabla 1.» arriba, «Figura 1.» abajo
  set figure(gap: 2.2mm)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set figure(supplement: [Tabla])
  show figure.where(kind: image): set figure(supplement: [Figura])
  set figure.caption(separator: [. ])
  show figure.caption: it => {
    set text(8.5pt)
    set par(justify: true)
    block(width: 100%, [#text(weight: "bold")[#it.supplement #context it.counter.display(it.numbering)#it.separator]#it.body])
  }
  show figure: set block(above: 1.3em, below: 1.3em)

  // Referencias cruzadas: «Tabla 2», «Figura 1», «Ec. (3)», «apartado 4»
  set ref(supplement: it => if it.func() == heading { [apartado] } else { it.supplement })

  // ---- Título en la primera hoja (solo título; el resto está en el cajetín)
  align(center, block(below: 1.4em, text(14pt, weight: "bold", titulo)))
  if indice {
    outline(title: [Índice], depth: 2, indent: 5mm)
    v(4mm)
  }
  cuerpo
}
