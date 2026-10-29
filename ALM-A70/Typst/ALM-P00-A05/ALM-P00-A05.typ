#import "../../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-P00-A05",
  titulo: "Estudio de motorización y mejoras",
  tipo: "Estudio auxiliar",
  revision: "0.5",
  estado: "Aprobado",
  creado: "26/10/2026",
  autor: "Francisco Alanís Cañamero",
  revisor: "Augusto Aizpún",
  aprobacion: "Augusto Aizpún",
  indice: true,
)

// Tablas largas: se permite partirlas entre hojas para no dejar huecos
#show figure.where(kind: table): set block(breakable: true)

= Objeto y alcance

Este estudio responde a la pregunta que el P00 asigna al A05: qué no debemos impedir hoy para poder crecer mañana. Su salida es la lista de provisiones para P01 del @sec:lista (CRIT-07) y los datos de remolque para REQ-14. No elige motor ni configuración. Se distinguen dos arquitecturas, definidas por lo que representan:

- *A-70:* ALIMOCHE con motor dentro de la misma categoría legal que el planeador ligero. Su límite es legal antes que de masa: menos de 70 kg al despegue sin piloto ni paracaídas, con motor, hélice y energía incluidos.
- *A-120:* estructura similar, reforzada, con motor, evaluada en otra categoría legal (hasta 120 kg). Es otro avión, no una mejora del ALIMOCHE base, y se incluye solo como referencia.

*Regla del A05:* ninguna provisión puede comprometer los 70 kg del planeador base (REQ-01).

= Entradas

La @tab:entradas recoge las entradas del estudio y su procedencia.

#figure(
  table(
    columns: (32mm, 1fr, 40mm, 26mm),
    align: (left, left, left, left),
    table.header([Entrada], [Valor], [Fuente], [Clase]),
    [Masa sin piloto ni paracaídas del planeador], [< 70 kg], [ALM-00 Rev. 0.3; RD 765/2022 art. 2.2 d)], [Requisito (REQ-01)],
    [Piloto de cálculo], [90 kg (50, 70 y 90 kg para centrado)], [ALM-00 Rev. 0.3], [Requisito],
    [Polar del ala], [$S$ = 10 m², AR = 10, $C_(D 0)$ = 0.055 (+0.005 por instalación), $e$ = 0.70, $C_(L,max)$ = 1.5], [ALM-P00-A02-01 Rev. 0.1], [Hipótesis de A02],
    [Condición de cálculo], [Lillo a 40 °C, ρ = #q(1.04, "kg/m³", dec: 2)], [ALM-P00, ASM-01], [Hipótesis],
    [Velocidad de referencia], [$1.30 V_s$ ($V_s$ = 51 km/h a 160 kg)], [Este estudio], [Criterio de cálculo],
    [Criterio común de subida], [$V_z >= 1.0$ m/s a la masa real de cada sistema (sensibilidad a 0.7 m/s)], [Este estudio], [Criterio de cálculo],
    [Batería], [165 Wh/kg de pack hasta 10C], [Celda Molicel P45B: 4.5 Ah, 45 A, 68–70 g; factor de pack 0.7], [Hipótesis],
    [Rendimientos], [Hélice 0.70; motor y controlador 0.90], [Valores típicos de prediseño], [Hipótesis],
    [Turbinas], [90 % del empuje de catálogo; consumo de catálogo a plena potencia], [Fichas Xicoy X240 y X380], [Dato e hipótesis],
    [Geometría para centrado], [Referencia en el borde de ataque de la raíz; cuerda 1.60 m; CG en vuelo 25–30 % (400–480 mm); piloto a −251 mm], [Manual de vuelo del SG-38 (BWLV)], [Dato del semejante],
    [Célula ALIMOCHE para centrado], [62 kg, CG en vacío a 1221 mm (centra al piloto de 70 kg en el 27.5 %)], [Este estudio], [Hipótesis a confirmar en P01],
  ),
  caption: [Entradas del estudio y su procedencia.],
) <tab:entradas>
#fuente[posiciones medidas desde el borde de ataque de la raíz, positivas hacia atrás.]

= Consecuencia legal de motorizar <sec:legal>

Lectura del RD 765/2022, consolidado tras el RD 182/2026 (@tab:legal). La conclusión corresponde a A01, que debe contrastarla antes del 30/10.

#figure(
  table(
    columns: (19mm, 1fr, 34mm, 1fr),
    align: (left, left, left, left),
    table.header([Arquitectura], [Categoría], [Cómo cuenta la masa], [Exigencias]),
    [Planeador base], [Planeador: no es ULM (art. 2.2 a); normativa UE y nacional de planeadores (art. 2.3)], [Masa en vacío < 70 kg (REQ-01)], [Las que fije A01 para planeadores],
    [A-70], [Aeronave de peso total al despegue < 70 kg sin piloto ni paracaídas: no es ULM (art. 2.2 d)], [Motor, hélice, batería, combustible y lastre cuentan dentro de los 70 kg], [Disposición adicional cuarta: arnés, casco en aeronave abierta, ≤ 3000 m, fuera de espacio controlado y zonas urbanas, VFR diurno. Registro, licencia y seguro: A01],
    [A-120], [Aeronave motorizada de estructura ligera, ≤ 120 kg al despegue sin piloto ni paracaídas: fuera del RD (art. 2.1 d)], [Igual que A-70, con 120 kg], [Las mismas limitaciones de la disposición adicional cuarta. Registro, licencia y seguro: A01],
    [Más de 120 kg], [ULM de categoría A (art. 1.2)], [—], [Licencia de ULM, aeronavegabilidad y matrícula. Fuera del alcance de ALIMOCHE],
  ),
  caption: [Categoría legal de cada arquitectura según la lectura del RD 765/2022.],
) <tab:legal>
#fuente[RD 765/2022, texto consolidado a 12/03/2026. Pendiente de confirmación por A01.]

Motorizar cambia la categoría en cualquier caso: el planeador deja de serlo y pasa a las limitaciones de la disposición adicional cuarta. Entre A-70 y A-120 la diferencia es de masa admisible, no de exigencias. A01 debe confirmar además que el combustible y la batería computan (el texto habla de «peso total al despegue») y que un avión de tubo y tela encaja en «estructura ligera».

*Respuestas preliminares para A01.* El paracaídas no computa en los límites de 70 y 120 kg: ambos artículos se refieren a la masa «descontando piloto y paracaídas», y no distinguen entre paracaídas personal y sistema de rescate de la aeronave, por lo que se entiende que este último también queda fuera. El lastre, en cambio, sí computa en A-70. Como norma de cargas, CS-22 en su redacción vigente eleva las cargas de aterrizaje de emergencia a 15 g hacia delante, 7.5 g hacia arriba, 6 g lateral y 9 g hacia abajo (antes 9 / 4.5 / 3 / 4.5 g), y su AMC 22.561 las vincula a los sistemas de rescate por paracaídas. Son los valores que se proponen para la bancada del motor y el anclaje del paracaídas.

= Opciones de motorización y masa máxima de célula <sec:opciones>

Las opciones son tres: ninguna, sustentador (mantener altura tras un lanzamiento externo) y autolanzamiento (subir por sus medios). En A-70 la pregunta decisiva no es qué motor, sino cuánta célula queda después de instalarlo. La @fig:celula lo resume con el criterio común: subida de al menos 1.0 m/s, cada sistema calculado a su masa real. La @tab:sistemas da los valores por sistema.

#figure(
  image("figuras/celula_max_A70_original.png", width: 100%),
  caption: [Masa máxima de célula que mantiene la versión motorizada por debajo de 70 kg, frente a la altura ganada a motor. Sin refuerzos de instalación ni tren (ver @sec:refuerzos); la franja gris es la célula que A02 considera realista. Imagen conservada del original.],
) <fig:celula>
#fuente[@anx:calculos; datos/celula_max_A70.csv.]

#pendiente[Regenerar la @fig:celula con `plantilla/graficas/alimoche_graficas.py` a partir de `datos/celula_max_A70.csv` (no incluido en el material de entrada). La imagen conservada usa coma decimal en la leyenda.]

#figure(
  table(
    columns: (30mm, 1fr, 1fr, 1fr, 26mm),
    align: (left, left, left, left, left),
    table.header([Sistema], [Masa añadida con célula de 60 kg, 400 m (kg)], [Célula máx. A-70 a 200 / 400 / 600 m (kg)], [Masa añadida A-120, célula de 100 kg, 400 m (kg)], [Coste instalado (sin IVA)]),
    [HPD8 (eléctrico 8 kW)], [11.7], [61.1 / 58.4 / 54.8], [No sube a 1 m/s], [3800–5300 €],
    [HPD12 (eléctrico 12 kW)], [12.9], [60.0 / 57.3 / 53.7], [15.6 (21.2 a 600 m: supera 120 kg)], [4000–5600 €],
    [Atom80 (2T, 11.9 kW)], [12.7], [57.5 / 57.3 / 57.0], [12.9], [2800–3800 €],
    [Xicoy X240 (240 N)], [No sube a 1 m/s (0.65 m/s)], [Descartada], [Descartada (0.13 m/s)], [3450–3650 €],
    [Xicoy X380 (380 N)], [7.8], [63.9 / 62.1 / 60.3], [9.7], [5100–5300 €],
  ),
  caption: [Masa, célula máxima y coste de cada sistema con criterio común de subida.],
) <tab:sistemas>
#fuente[@anx:calculos (@tab:a1 y @tab:a2). Coste de motor, controlador o ECU, batería o depósito, hélice y montaje; solo las turbinas tienen tarifa pública completa.]

*Conclusiones para P01:*

- *A-70 es casi inviable:* con una célula realista de 60–65 kg, casi ningún sistema cabe en A-70. Solo la X380 lo permite: con los refuerzos del @sec:refuerzos, célula de hasta 61 kg para 200 m y 59.5 kg para 400 m como sustentador; con tren de autolanzamiento, 59 kg y 57.5 kg. Eléctricos y 2T exigen células de 53–58 kg.
- *La X240 no cumple el criterio común:* ni con célula de 60 kg pasa de 0.65 m/s. Relajar el criterio a 0.7 m/s tampoco la rescata: exigiría una célula de 50 kg o menos. A 0.7 m/s los eléctricos empeoran (la subida dura más) y Atom80 y X380 apenas cambian.
- *Sustentador:* para mantener 10 minutos de vuelo nivelado a 170 kg hacen falta ≈ 8 kg de batería, ≈ 0.6 kg de gasolina o 5–8 kg de queroseno. La turbina, ligera para una subida corta, deja de serlo en cuanto el motor trabaja más de unos minutos.
- *A-120:* todos los sistemas de hélice caben en 120 kg salvo el HPD8 (potencia insuficiente) y el HPD12 a 600 m. Es la arquitectura en la que una motorización tiene sentido.
- *Coste:* cualquier sistema instalado cuesta entre el 80 % y el 160 % del presupuesto de materiales del planeador (3500 ± 500 €). El 2T es el más barato; el eléctrico cuesta en torno a un 30 % más que un 2T equivalente, según el propio fabricante, sobre todo por la batería.

En consecuencia, la motorización no debe condicionar P01 más allá de las provisiones del @sec:lista. *Un ALIMOCHE motorizado realista es A-120, es decir, otro avión.*

= Refuerzos de instalación <sec:refuerzos>

La masa fija de los sistemas (@anx:calculos) solo incluye 1.5–1.8 kg de montaje. Instalar un motor exige además una bancada, transmitir el empuje y las cargas de choque, proteger al piloto y, para autolanzamiento, un tren. La @tab:refuerzos estima estas partidas.

#figure(
  table(
    columns: (1fr, 36mm, 34mm),
    align: (left, left, left),
    table.header([Partida], [Masa (kg)], [Aplica a]),
    [Pilón o bancada: dos tubos de aluminio de ≈ 0.8 m, placa y silentblocks], [1.0–1.8], [Sustentador y autolanzamiento],
    [Puntal de compresión hasta la quilla para las cargas de choque hacia delante], [0.3–0.6], [Sustentador y autolanzamiento],
    [Refuerzo local del nudo central y de la quilla], [0.3–0.6], [Sustentador y autolanzamiento],
    [Cortafuegos (2T) o caja ignífuga de batería (eléctrico)], [0.2–0.5], [Sustentador y autolanzamiento],
    [Tren: rueda de 200–260 mm, eje, horquilla y refuerzo del patín], [1.5–2.5], [Solo autolanzamiento],
    [*Total*], [*1.8–3.5 (sustentador) · 3.3–6.0 (autolanzamiento)*], [],
  ),
  caption: [Masa estimada de refuerzo por instalar un motor.],
) <tab:refuerzos>
#fuente[estimación del autor. No incluye el sobredimensionado de la estructura primaria para A-120.]

Los casos de carga que dimensionan estas piezas son tres. El choque: con 15 g hacia delante, un 2T de 12.7 kg detrás del piloto genera ≈ 1.9 kN últimos (1.1 kN con los antiguos 9 g), un eléctrico de 5.5 kg ≈ 0.8 kN y la X380 ≈ 0.6 kN. El empuje y el par del motor, más las cargas giroscópicas de la hélice, que solo afectan a los sistemas de hélice. Y el aterrizaje con más masa, que en autolanzamiento recae sobre el tren. Restando los valores centrales (2.65 kg como sustentador y 4.65 kg con tren), la célula máxima de A-70 queda como indica la @tab:celula-refuerzos.

#figure(
  table(
    columns: (1fr, 46mm, 46mm),
    align: (left, left, left),
    table.header([Sistema], [200 m: sin refuerzo / sustentador / con tren (kg)], [400 m: sin refuerzo / sustentador / con tren (kg)]),
    [HPD8 (eléctrico 8 kW)], [61.1 / 58.4 / 56.4], [58.4 / 55.7 / 53.7],
    [HPD12 (eléctrico 12 kW)], [60.0 / 57.3 / 55.3], [57.3 / 54.6 / 52.6],
    [Atom80 (2T 11.9 kW)], [57.5 / 54.9 / 52.9], [57.3 / 54.6 / 52.6],
    [Xicoy X380 (380 N)], [63.9 / 61.3 / 59.3], [62.1 / 59.5 / 57.5],
  ),
  caption: [Célula máxima compatible con A-70 incluyendo los refuerzos de instalación.],
) <tab:celula-refuerzos>
#fuente[refuerzos.py; datos/celula_max_con_F4.csv. La X240 queda fuera en todos los casos.]

Con refuerzos incluidos, ningún sistema de hélice deja más de 58.4 kg de célula, y la X380 solo supera los 60 kg como sustentador a 200 m. El dato de entrada para P01 es claro: *A-70 motorizado exige una célula de 53–61 kg según sistema y misión*, por debajo de lo que A02 considera realista.

= Centrado y volumen <sec:centrado>

Se usa la geometría y los límites del manual de vuelo del SG-38: referencia en el borde de ataque de la raíz, cuerda de 1.60 m y CG en vuelo entre el 25 % y el 30 % (400–480 mm). El brazo del piloto, −251 mm, se deduce del propio manual: una célula de 110 kg con el CG en vacío a 880 mm y un piloto de 70 kg dan el CG normal de 440 mm. Para ALIMOCHE se supone una célula de 62 kg centrada para el mismo piloto de 70 kg. El lastre se coloca, como en el SG-38, delante bajo los pedales (−1200 mm) o detrás en el montante trasero (+1500 mm). La @tab:centrado recoge el resultado para cada instalación.

#figure(
  table(
    columns: (38mm, 14mm, 24mm, 24mm, 1fr),
    align: (left, right, left, left, left),
    table.header([Instalación], [Masa añadida (kg)], [CG con piloto 90 / 70 / 50 kg (% cuerda)], [Lastre con piloto 90 kg / 50 kg (kg)], [Volumen y encaje en una célula tipo SG-38]),
    [Planeador base (sin motor)], [0.0], [21.8 / 27.5 / 35.2], [7.0 tras. / 5.6 del.], [Con 50–90 kg de piloto el CG recorre del 22 % al 35 %: más que el rango del SG-38],
    [A Eléctrico: motor y hélice en pilón + batería bajo el asiento], [12.9], [23.2 / 28.5 / 35.6], [4.4 tras. / 6.7 del.], [Batería ≈ 3–4 L bajo el asiento; hélice Ø 1.0–1.2 m. Cabe con pilón],
    [B Eléctrico: motor, hélice y batería en pilón], [12.9], [26.7 / 32.5 / 40.2], [0 / 12.2 del.], [Pilón voluminoso y muy retrasado],
    [C 2T en pilón + depósito tras el asiento], [12.7], [27.1 / 33.0 / 40.9], [0 / 12.9 del.], [Motor ≈ 40 × 35 × 30 cm en pilón. Muy retrasado],
    [D 2T tractor en el morro], [12.7], [10.9 / 14.6 / 19.5], [33.8 tras. / 10.1 tras.], [Hélice delante de los pies del piloto; CG muy adelantado. Descartada],
    [E 2T propulsor tras el asiento (bajo el ala)], [12.7], [22.9 / 28.3 / 35.3], [4.9 tras. / 6.4 del.], [El disco de hélice cruza la quilla: obliga a rediseñar la cola],
    [F Turbina X380 en pilón + depósito tras el asiento], [7.8], [22.7 / 28.2 / 35.5], [5.4 tras. / 6.3 del.], [Turbina Ø 13 cm; depósito ≈ 5 L tras el asiento. Chorro sobre la cola],
  ),
  caption: [Centrado, lastre necesario y volumen de cada instalación.],
) <tab:centrado>
#fuente[manual de vuelo del SG-38 (BWLV); centrado.py; datos/centrado.csv. Rango admisible del SG-38, 25–30 %; «del.» lastre delantero, «tras.» trasero; el lastre cuenta dentro de los 70 kg en A-70.]

El resultado más importante no depende del motor: *con una célula de 62 kg el piloto pesa más que el avión*, y el CG recorre del 22 % al 35 % de la cuerda entre pilotos de 50 y 90 kg. Con el rango del SG-38 haría falta hasta 7 kg de lastre, igual que el SG-38 necesita hasta cuatro pesos de 2.6 kg. Las salidas son ensanchar el rango de centrado a ≈ 22–35 % (cola y estabilidad dimensionadas para ello) o prever alojamientos de lastre delantero y trasero. Mover el asiento no basta: harían falta unos 27 cm de recorrido.

En cuanto al motor, las instalaciones A, E y F (masas pesadas junto al piloto y ligeras en el pilón) apenas cambian el centrado del planeador base. B y C, con toda la masa en el pilón, exigen 12–13 kg de lastre delantero con un piloto de 50 kg, lo que en A-70 es inasumible. El motor en el morro queda descartado.

= Seguridad por familia

La @tab:seguridad resume los riesgos principales por familia de motor.

#figure(
  table(
    columns: (24mm, 1fr, 1fr),
    align: (left, left, left),
    table.header([Familia], [Riesgo principal], [Qué implica para el diseño]),
    [Todas], [Fallo de motor en subida a baja altura], [Altura mínima de decisión y campo al alcance (A04). El avión debe planear con el motor parado sin cambios de trimado bruscos],
    [Hélice (eléctrica o 2T)], [Hélice cerca de la cabeza del piloto, de cables y de la cola], [Disco libre con ≥ 15 cm a estructura y cables; protección si queda al alcance del piloto],
    [2T], [Combustible e incendio junto al piloto en célula abierta; vibración y fatiga], [Depósito protegido tras el asiento, cortafuegos, silentblocks, nada de tela ni Dyneema junto al escape],
    [Eléctrico], [Incendio de batería; descarga a alta potencia], [Caja ignífuga y ventilada, BMS, desconectador al alcance del piloto],
    [Turbina], [Gases a varios cientos de grados; rotor a más de #num(100000) rpm sin contención; respuesta lenta], [Chorro fuera de tela, cables y cola; escudo en el plano del rotor; no usar como motor de despegue],
    [Todas, en choque], [Motor detrás del piloto en un impacto frontal], [Bancada y puntal para 15 g hacia delante (CS-22 vigente); masa del motor lo más baja y próxima al CG posible],
  ),
  caption: [Riesgos principales por familia de motor.],
) <tab:seguridad>
#fuente[elaboración propia; X240: #num(113000) rpm según ficha del fabricante; CS-22, CS 22.561.]

= Paracaídas, térmica y remolque <sec:paracaidas>

*Paracaídas.* Hay tres opciones. El paracaídas personal del piloto (≈ 6–7 kg) obliga a abandonar el avión y no sirve a las alturas del lanzamiento con gomas. El balístico con cohete se descarta por masa y coste. La recomendada es un sistema de rescate de ala delta para toda la aeronave, anclado al nudo central: por ejemplo, el Charly DIAMONDcross delta light 220 admite 220 kg con 2.46 kg de masa, con margen frente a los 160–170 kg de ALIMOCHE. Solo es útil por encima de ≈ 100 m, es decir, con remolque. La provisión es un herraje de anclaje en el nudo central dimensionado para la carga de apertura que indique el fabricante y para los casos de CS 22.561, y una salida del piloto libre de cables. Según la lectura del @sec:legal, no computa en los 70 kg.

*Térmica.* Con la polar de A02 la tasa de caída mínima es de 1.50 m/s, en la pérdida, y de 1.71 m/s a $1.2 V_s$, que es la velocidad realista para virar. Una térmica normal exige ≲ 1.0 m/s. Bajar $C_(D 0)$ a 0.040 con un carenado deja 1.46 m/s; alargar la envergadura a 12 m, 1.43 m/s; ambas cosas, 1.21 m/s. ALIMOCHE no será un avión de térmica; con mejoras podría aprovechar ladera y térmicas fuertes. Las puertas que no hay que cerrar son puntos de fijación para un carenado y un ala que admita extensiones de punta. Un pilón y una hélice plegada añaden ≈ +0.05 m/s.

*Remolque (REQ-14).* Con $V_s$ ≈ 51–52 km/h, el remolque se volaría a 1.3–1.5 $V_s$, es decir, 66–78 km/h: la velocidad máxima de remolque que fije P01 debe cubrir al menos 80 km/h. Como referencia, el SG-38 ($V_s$ = 40 km/h) admite 60 km/h en torno o coche y 90 km/h en aerorremolque, con remolque normal a 60–90 km/h. El remolque por coche o torno es compatible; necesita gancho de CG con suelta de seguridad y fusible. El SG-38 lleva, como propone este estudio, gancho de morro para gomas y una suelta de seguridad para torno y aerorremolque. Sus fusibles son de 300 daN en aerorremolque y 400 daN en torno y coche para 210 kg; escalados a 160–170 kg dan ≈ 2.4 kN y ≈ 3.2 kN, por encima de la regla práctica de 1.3 veces el peso (≈ 2 kN).

El aerorremolque necesita un remolcador lento. Un remolcador de alas delta como el Bailey-Moyes Dragonfly, diseñado para remolcar alas delta y planeadores ultraligeros, entra en pérdida a 31 km/h, sube a 51 km/h y cruza a 74 km/h, una franja que cubre las velocidades de remolque de ALIMOCHE. Los remolcadores convencionales de los aeroclubes vuelan el remolque más rápido; A04 debe confirmar cuáles hay disponibles y a qué velocidades.

*Despegue y rodadura.* Un coeficiente μ ≈ 0.05 solo vale para rueda en pista dura. La @tab:a3 barre μ: con rueda en hierba despegan en 100–150 m todos los sistemas de hélice y la X380 a partir de 150 m; con patín sobre hierba (μ ≈ 0.3) solo el HPD12 y el Atom80, y con 150 m de carrera. Para autodespegue, por tanto, hace falta rueda, y la turbina además pista dura o carrera larga.

= Lista para P01 (CRIT-07) <sec:lista>

Provisiones que P01 no debe impedir (@tab:provisiones). Todas caben en el planeador base sin comprometer los 70 kg.

#figure(
  table(
    columns: (7mm, 1fr, 28mm, 20mm, 16mm),
    align: (right, left, left, left, left),
    table.header([N.º], [Provisión], [Para qué], [Arquitectura], [Masa (g)]),
    [1], [Punto fuerte con camino de carga en el nudo central para un pilón o bancada, con taladros o placa previstos y un punto de unión para un puntal hasta la quilla (15 g hacia delante)], [Motor en pilón], [A-70 y A-120], [100–150],
    [2], [Volumen libre de ≈ 5 L bajo o tras el asiento, junto al CG, con cuatro puntos de fijación], [Batería, depósito o lastre], [Ambas], [≈ 50],
    [3], [Rango de centrado de ≈ 22–35 % de la cuerda verificado con pilotos de 50 y 90 kg, o alojamientos de lastre delantero y trasero de hasta ≈ 7 kg], [Pilotos de 50–90 kg y motor en pilón], [Ambas], [50–100],
    [4], [Disco de Ø 1.2 m tras el borde de salida, por encima de la quilla, libre de cables y tubos, con ≥ 15 cm a cola, suelo y cabeza del piloto], [Hélice propulsora], [Ambas], [0 (geometría)],
    [5], [Pasos de cable para gases, corte de motor y potencia], [Mandos y cableado], [Ambas], [≈ 20],
    [6], [Herrajes para gancho de morro y de CG, con camino de carga para fusibles de ≈ 2.4 kN (aerorremolque) y ≈ 3.2 kN (coche y torno)], [Remolque (REQ-14)], [Ambas], [150–250],
    [7], [Patín con anclaje previsto para una rueda compatible con autodespegue], [Autodespegue], [Ambas], [≈ 50],
    [8], [Herraje de anclaje del paracaídas en el nudo central y salida del piloto libre de cables], [Paracaídas], [Ambas], [50–100],
    [9], [Puntos de fijación para carenado o barquilla y ala que admita extensiones de punta], [Térmica], [Planeador], [≈ 50],
  ),
  caption: [Provisiones que P01 no debe impedir.],
) <tab:provisiones>
#fuente[masas estimadas; total ≈ 0.5–0.8 kg sin contar el lastre. No incluye el refuerzo de la estructura primaria para A-120, que corresponde a otro avión.]

= Puntos abiertos

#figure(
  table(
    columns: (1fr, 28mm, 32mm, 18mm),
    align: (left, left, left, left),
    table.header([Dato], [Para qué], [Responsable], [Fecha]),
    [Confirmar la lectura del RD 765/2022 (@tab:legal) y las respuestas preliminares del @sec:legal; registro, licencia y seguro], [Apartados 3 y 8], [A01 · [nombre]], [30/10/2026],
    [Casos de carga de remolque y resistencia del herraje de enganche (CS 22.581, 22.583 y 22.585)], [Provisión 6], [A01 · [nombre]], [30/10/2026],
    [Polar extrapolada a 210 kg (A-120) y velocidad de aterrizaje], [@anx:calculos], [A02 y A04 · [nombre]], [30/10/2026],
    [Remolcadores disponibles y sus velocidades; μ medido en Lillo con patín y con rueda], [Apartado 8; @tab:a3], [A04 · [nombre]], [30/10/2026],
    [Presupuesto de Geiger (sin tarifa pública), precios sin IVA fechados y fichas archivadas], [@tab:sistemas y @tab:a2], [A03 · [nombre]], [30/10/2026],
    [Geometría de la célula, rango de centrado, sistema de lastre y refuerzos de instalación], [Apartados 5 y 6], [P01], [P01],
  ),
  caption: [Datos pendientes, responsables y fechas.],
) <tab:abiertos>

#pendiente[Nombres de los responsables de A01, A02, A03 y A04 en la @tab:abiertos (figuran como «[nombre]» en el original).]

#referencias((
  [ALM-00 Rev. 0.3, _Enunciado y bases de diseño_, 12/10/2026.],
  [ALIMOCHE, _Objetivo de los estudios del P00_, 23/10/2026.],
  [ALM-P00-A02-01 Rev. 0.1, geometría y polar inicial.],
  [Real Decreto 765/2022, texto consolidado a 12/03/2026. boe.es/eli/es/rd/2022/09/20/765/con/20260312],
  [Real Decreto 182/2026, de 11 de marzo. boe.es/eli/es/rd/2026/03/11/182],
  [BWLV, _Flughandbuch für das Segelflugzeug Schulgleiter SG 38_, ed. 2013/2015. bwlv.de],
  [EASA, _CS-22 Sailplanes and Powered Sailplanes_, CS 22.561 y AMC 22.561. easa.europa.eu],
  [Xicoy, fichas X240 y X380 y tarifa sin IVA. xicoyturbines.com; xicoy.com/catalog (25/10/2026).],
  [Geiger Engineering, E-Drive: productos y preguntas frecuentes. geigerengineering.de (26/10/2026).],
  [Vittorazi, Atom80 MY25; precio de distribuidor en aviatorppg.com (26/10/2026).],
  [Molicel INR21700-P45B: datos de celda (akkuteile.de) y precio (nkon.nl, 26/10/2026).],
  [Finsterwalder-Charly, rescue systems for hang gliders. finsterwalder-charly.de],
  [Bailey-Moyes Dragonfly. Wikipedia (consultado el 26/10/2026).],
  [Gliding New Zealand, _AC 3-4 Weak links for winch and auto launch_.],
))

#show: anexos

= Cálculos de respaldo <anx:calculos>

Modelo de cribado, reproducible con modelo.py, refuerzos.py, centrado.py y rodadura.py. La resistencia es

$ D = 1/2 rho V^2 S (C_(D 0) + Delta C_(D 0)) + (2 k (m g)^2) / (rho V^2 S), quad k = 1 / (pi "AR" e) $ <eq:resistencia>

a la velocidad de referencia $1.30 V_s$. Para hélice, $P_"eje" = (D V + m g V_z) \/ eta_p$ con $V_z = 1.0$ m/s. Para turbina, $V_z = (T - D) V \/ (m g)$ en la mejor velocidad entre $1.30 V_s$ y 100 km/h, con el 90 % del empuje de catálogo; si no alcanza 1.0 m/s, el sistema se descarta. Cada sistema se calcula a su masa real (célula + sistema + energía + piloto), cerrando la masa por iteración.

La batería cumple a la vez energía y potencia:

$ m_b >= max(E / e_"pack", P_"elec" / (C e_"pack")) $ <eq:bateria>

con 165 Wh/kg y 10C, 80 % de energía útil y 15 % de reserva. El 2T usa 0.60 kg/kWh; las turbinas, su consumo de catálogo a plena potencia (X240 0.600 kg/min; X380 0.985 kg/min), con la misma reserva. Los resultados se recogen en la @tab:a1.

#figure(
  table(
    columns: (32mm, 14mm, 1fr, 22mm, 1fr, 22mm),
    align: (left, right, right, right, right, right),
    table.header([Sistema], [Altura (m)], [Masa añadida, célula 60 kg (kg)], [Célula máx. A-70 (kg)], [Masa añadida, célula 100 kg (kg)], [$V_z$ con célula 60 kg (m/s)]),
    [HPD8 (eléctrico 8 kW)], [200], [8.9], [61.1], [No: potencia], [1.00],
    [HPD8 (eléctrico 8 kW)], [400], [11.7], [58.4], [No: potencia], [1.00],
    [HPD8 (eléctrico 8 kW)], [600], [15.7], [54.8], [No: potencia], [1.00],
    [HPD12 (eléctrico 12 kW)], [200], [10.0], [60.0], [11.7], [1.00],
    [HPD12 (eléctrico 12 kW)], [400], [12.9], [57.3], [15.6], [1.00],
    [HPD12 (eléctrico 12 kW)], [600], [17.0], [53.7], [21.2], [1.00],
    [Atom80 (2T 11.9 kW)], [200], [12.5], [57.5], [12.6], [1.00],
    [Atom80 (2T 11.9 kW)], [400], [12.7], [57.3], [12.9], [1.00],
    [Atom80 (2T 11.9 kW)], [600], [13.0], [57.0], [13.3], [1.00],
    [Xicoy X240 (240 N)], [200], [No: $V_z$ 0.65 m/s], [36.0], [No: $V_z$ 0.13 m/s], [0.65],
    [Xicoy X240 (240 N)], [400], [No: $V_z$ 0.65 m/s], [33.7], [No: $V_z$ 0.13 m/s], [0.65],
    [Xicoy X240 (240 N)], [600], [No: $V_z$ 0.65 m/s], [31.4], [No: $V_z$ 0.13 m/s], [0.65],
    [Xicoy X380 (380 N)], [200], [6.0], [63.9], [6.9], [2.17],
    [Xicoy X380 (380 N)], [400], [7.8], [62.1], [9.7], [2.13],
    [Xicoy X380 (380 N)], [600], [9.7], [60.3], [12.8], [2.09],
  ),
  caption: [Resultados del cribado con criterio común de subida.],
) <tab:a1>
#fuente[modelo.py; datos/masas_cribado.csv. La célula máxima de la X240 (31–37 kg) no es realista. Con célula de 100 kg (A-120) la polar de A02 se extrapola a ≈ 210 kg (21 kg/m², $V_s$ ≈ 58 km/h), pendiente de confirmar por A02.]

*Sensibilidad al criterio de subida.* Con $V_z >= 0.7$ m/s, la célula máxima a 400 m pasa a 56.3 kg (HPD8), 55.2 kg (HPD12), 57.1 kg (Atom80), 62.1 kg (X380) y 50.1 kg (X240). La subida más lenta exige más energía a los eléctricos y no cambia el orden ni la conclusión. El desglose de costes se recoge en la @tab:a2 y la rodadura, en la @tab:a3.

#figure(
  table(
    columns: (28mm, 1fr, 1fr, 1fr),
    align: (left, left, left, left),
    table.header([Partida (sin IVA)], [HPD12 eléctrico], [Atom80 2T], [Xicoy X380]),
    [Motor y controlador o ECU], [3000–4000 € (sin tarifa pública; +30 % sobre un 2T equivalente según Geiger)], [2300–2900 € (2700–3040 USD en distribuidor de EE. UU.)], [4899 € (tarifa Xicoy)],
    [Energía], [Batería de 1.2 kWh: 76 celdas P45B a 3.76 € ≈ 290 €, más BMS, caja y conectores: 550–750 €], [Depósito: 50–100 €], [Depósito y depósito intermedio: 50–100 €],
    [Hélice], [Carbono, Ø 1.2 m: 300–500 €], [Carbono, Ø 1.25 m: 300–500 €], [—],
    [Montaje y refuerzos], [150–300 €], [150–300 €], [150–300 €],
    [*Total*], [*4000–5600 €*], [*2800–3800 €*], [*5100–5300 €*],
  ),
  caption: [Desglose del coste instalado.],
) <tab:a2>
#fuente[Xicoy (25/10/2026); aviatorppg.com, nkon.nl y geigerengineering.de (26/10/2026). Hélice, montaje y controlador eléctrico son estimaciones; el HPD8 se estima en 3800–5300 € y la X240 en 3450–3650 € (3249 € de tarifa).]

#figure(
  table(
    columns: (30mm, 12mm, 18mm, 24mm, 1fr),
    align: (left, right, right, right, left),
    table.header([Superficie], [μ], [Carrera (m)], [Empuje medio necesario (N)], [Sistemas que lo alcanzan]),
    [Pista dura, rueda], [0.04], [100], [307], [HPD8, HPD12, Atom80, X380 (90 %)],
    [Pista dura, rueda], [0.04], [150], [234], [HPD8, HPD12, Atom80, X380 (90 %)],
    [Hierba corta, rueda], [0.08], [100], [354], [HPD8, HPD12, Atom80],
    [Hierba corta, rueda], [0.08], [150], [280], [HPD8, HPD12, Atom80, X380 (90 %)],
    [Hierba, patín], [0.30], [100], [610], [Ninguno],
    [Hierba, patín], [0.30], [150], [537], [HPD12, Atom80],
  ),
  caption: [Empuje medio necesario para despegar por sus medios frente a la rodadura.],
) <tab:a3>
#fuente[rodadura.py; datos/rodadura.csv; cota energética de la carrera de despegue. 170 kg, despegue a $1.1 V_s$ (58 km/h), sustentación media en carrera del 30 % del peso. Empuje disponible: X240 216 N y X380 342 N (90 % del catálogo); hélices estimadas por cantidad de movimiento, HPD8 ≈ 420 N, HPD12 y Atom80 ≈ 550 N, a reducir con la velocidad. μ de patín sobre hierba estimado.]
