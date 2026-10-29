#import "../../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-P00-A04",
  titulo: "Estudio de operaciones",
  tipo: "Estudio auxiliar",
  revision: "0.2",
  estado: "Borrador",
  creado: "28/10/2026",
  autor: "Augusto Aizpún",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
  indice: true,
)

// Tablas largas: se permite partirlas entre hojas para no dejar huecos
#show figure.where(kind: table): set block(breakable: true)

= Objeto y alcance

Este estudio describe cómo se transporta, se lanza, se monta y se guarda ALIMOCHE en un escenario optimista de operación, y convierte esa descripción en valores para el ALM-P00: ASM-01, REQ-04, REQ-08, REQ-14 y CRIT-03. No elige configuración: fija el marco dentro del cual P01 compara propuestas. Entradas: ALM-00 rev. 0.3, «Objetivo de los estudios del P00» (23/10/2026) y ALM-P00-A06 rev. 0.2 [12].

Las cifras se calculan sobre el avión de referencia de la estimación aerodinámica ALM-P00-A06 [12], no sobre un diseño (@tab:referencia). Como comparación se usa el SG-38 (16 m², 100 kg en vacío, 210 kg máximo, planeo 10, VNE 115 km/h) [6].

#figure(
  table(
    columns: (44mm, 36mm, 1fr),
    align: (left, left, left),
    table.header([Parámetro], [Valor de cálculo], [Observación]),
    [Masa en vacío], [70 kg], [ALM-00],
    [Piloto], [90 kg], [ALM-00],
    [Masa máxima (MTOW)], [160 kg], [70 + 90 kg],
    [Envergadura / cuerda], [10.0 m / 1.0 m], [A06; ala rectangular],
    [Superficie alar], [10.0 m²], [A06; carga alar 16 kg/m²],
    [$C_(L,max)$], [1.5], [A06, caso central (intervalo 1.2–1.5)],
    [Planeo máximo], [≈ 10], [A06 ($C_(D 0) = 0.055$; $e = 0.70$)],
  ),
  caption: [Avión de referencia para el cálculo.],
) <tab:referencia>

= Base de operaciones (ASM-01) <sec:base>

Se toma como base el aeródromo de Lillo (LELT), a 1 km del pueblo y unos 100 km al sur de Madrid (A-4, salida 81 La Guardia–Lillo). Cota 681 m, pista 12/30 de asfalto de 750 × 18 m, frecuencia 123.375 MHz, actividad de vuelo a vela del Real Aeroclub de Toledo [1].

#pendiente[Son datos de fuente secundaria: hay que confirmarlos con la publicación aeronáutica vigente y con el aeroclub, junto con la zona de hierba disponible para operar sin ocupar la pista en servicio.]

*Condición crítica: 40 °C.* A 681 m y 40 °C la densidad es #q(1.039, "kg/m³", dec: 3) (σ = 0.85), lo que equivale a una altitud de densidad de unos 1700 m. Con la misma masa, todas las velocidades verdaderas suben un 9 % respecto a la atmósfera estándar a nivel del mar y la energía que hay que dar al avión en el lanzamiento, un 18 %. Para el avión de referencia, la pérdida pasa de 47 a 51 km/h y la velocidad de despegue ($1.2 V_s$) de 56 a 61 km/h [12]. A esa temperatura hay además térmicas fuertes y remolinos de polvo a partir del mediodía, y el equipo de tierra sufre el calor: la operación de verano se concentra en las primeras horas de la mañana (@sec:jornada).

*Convivencia con el aeródromo.* ALIMOCHE vuela a pocos metros del suelo y no entra en el circuito, pero ocupa una franja de unos 150 m durante cada lanzamiento. Se propone operar en una franja paralela a la pista acordada con el aeroclub, con un responsable en tierra a la escucha de la frecuencia y en días o franjas horarias de poco tráfico.

= Transporte por carretera (REQ-08) <sec:transporte>

*Marco legal.* El Reglamento General de Circulación (art. 15) permite que una carga indivisible (vigas, postes, tubos) en un vehículo de mercancías sobresalga hasta un tercio de la longitud del vehículo por cada extremo si este mide 5 m o menos, y hasta 2 m por delante y 3 m por detrás si mide más. Lateralmente puede sobresalir 0.40 m por lado sin superar 2.55 m de anchura total. La parte que sobresale por detrás lleva la señal V-20 y, de noche, luz roja [2]. Un remolque ligero (MMA ≤ 750 kg) no necesita permiso de circulación, matrícula propia ni seguro independiente, y se conduce con permiso B [3]. Por encima de 750 kg el remolque tiene documentación propia, y el permiso B solo vale si el conjunto no pasa de 3500 kg (B96 hasta 4250 kg; si no, BE). Con remolque, la velocidad máxima es de 90 km/h en autovía y 80 km/h en carretera convencional [4].

*Consecuencia: 6 m.* Con una plataforma de 4.5 m, una pieza de 6 m sobresale 1.5 m por detrás. Eso cumple en ambos casos: un tercio de 4.5 m son 1.5 m, y un remolque con lanza de más de 5 m admite hasta 3 m. Además, 6 m es la longitud comercial habitual de las barras de tubo de aluminio (a confirmar en A03), así que un larguero de 6 m no necesita empalmes. Se propone que *la pieza más larga no supere 6.0 m*. El vuelo se deja siempre por detrás, porque por delante la carga interfiere con el coche al girar. Queda por confirmar con A01 que un ala o un fuselaje cuentan como carga indivisible. La @tab:remolques compara las dos opciones de remolque.

#figure(
  table(
    columns: (24mm, 1fr, 1fr),
    align: (left, left, left),
    table.header([], [Plataforma portavehículos (alquiler)], [Remolque de barco ligero (compra)]),
    [Medidas útiles], [4.0–5.0 × 2.0–2.1 m [11]], [Viga central; 4.0–6.5 m de longitud total [5]],
    [MMA], [1300–3500 kg, con freno], [500–750 kg],
    [Documentación], [Matrícula, seguro e ITV propios (del arrendador)], [Usa la matrícula y el seguro del coche],
    [Permiso], [B si el conjunto ≤ 3500 kg; B96 o BE], [B],
    [Aviones por viaje], [1 o 2 (@fig:transporte b)], [1],
    [Coste], [Alquiler por jornada; sin inversión], [Compra única; p. ej. 500 kg y 4.0 m: 1105 € + IVA [5]],
    [Adaptación], [La cuna se apoya y se amarra a sus argollas; nada fijo], [Bastidor de anclaje atornillado a los travesaños, sin rodillos; queda montado],
  ),
  caption: [Opciones de remolque.],
) <tab:remolques>

*Uso propuesto.* El remolque de barco ligero es el que conviene comprar: es barato, no tiene papeles propios y admite un bastidor fijo de anclaje para la cuna, así que queda dedicado a ALIMOCHE. Debe medir al menos 4.5 m útiles para no pasar de 1.5 m de vuelo y, con unos 200–250 kg de carga (avión, cuna y carcasa), va sobrado de capacidad. La plataforma portavehículos es para alquilar en jornadas puntuales, cuando haga falta llevar dos aviones o no esté disponible el remolque propio. Por eso la cuna no puede depender de un remolque concreto: debe poder amarrarse a cualquier plataforma plana con cinchas.

*Paquete.* Cada avión viaja plegado sobre su cuna (@sec:almacenaje), con apoyos en los puntos duros y las alas de canto. Las cinchas se amarran a la cuna, nunca al avión. La vibración de carretera es un caso de fatiga: ningún apoyo debe cargar sobre tela o costillas. Envolvente propuesta por avión: *6.0 × 1.0 × 1.8 m* (largo × ancho × alto sobre la plataforma). Con ese ancho caben dos aviones en una plataforma de 2.0–2.1 m, y la altura total queda en unos 2.4 m sobre la calzada, lejos de los 4 m de límite (@fig:transporte). Con el ala de A06 (10 × 1 m), cada semiala mide unos 5 m, dentro de la envolvente. Ninguna pieza que se mueva a mano debe pasar de 50 kg (dos personas).

#figure(
  image("figuras/transporte.svg", width: 100%),
  caption: [Paquete de transporte sobre plataforma de 4.5 m (a) y sección con dos aviones (b). Cotas en metros.],
) <fig:transporte>

= Lanzamiento con gomas (REQ-04) <sec:gomas>

Es la única forma de lanzamiento obligatoria. Las gomas forman una V con el avión en el vértice [10]; la anilla central va en un *gancho de morro abierto*, que la suelta sola cuando la goma se destensa, y la cola queda retenida por un anclaje con disparador. La goma es un acumulador: lo que limita la altura no son las personas, sino la energía que se guarda en ella. Por eso se propone tensar *con calma* y no corriendo: cada brazo se estira con un aparejo de poleas (3:1 o 4:1) anclado a una estaca, y el equipo tira del cabo a paso tranquilo. Pocas personas pueden almacenar toda la energía necesaria; solo tardan más y recorren más distancia. Con la goma tensa y los brazos fijos a sus estacas, el jefe de lanzamiento dispara la cola: el avión acelera unos 35–40 m, despega, gana altura con el sobrante de velocidad y planea recto hasta el suelo (@fig:gomas). El caso principal es el lanzamiento en llano y sin viento; desde una colina de altura $H$ se suma esa altura y el planeo crece en unas $10 H$.

#figure(
  image("figuras/lanzamiento_gomas.svg", width: 92%),
  caption: [Lanzamiento con gomas en llano, tensado con aparejo (planta, sin escala).],
) <fig:gomas>

*Cálculo.* Es un balance de energía, en llano, sin viento, a 40 °C en Lillo, con 160 kg y el ala de A06 ($S = 10$ m², $C_(L,max) = 1.5$). Se busca la velocidad de suelta $V_r$ que, tras convertir el sobrante en altura, deja al avión a una altura $h$ volando a $1.2 V_s$:

$ V_s = sqrt((2 m g) / (rho S C_(L,max))) = 51 "km/h", quad V_1 = 1.2 V_s = 61 "km/h" $ <eq:vs>
$ V_r^2 = V_1^2 + (2 g h) / eta_z $ <eq:vr>
$ E_c = 1/2 m V_r^2 $ <eq:ec>
$ E_"roz" = 1/2 mu m g d, quad d approx epsilon L_0 $ <eq:eroz>
$ E_g = 2 dot 1/2 (T epsilon)(epsilon L_0) = T L_0 epsilon^2 $ <eq:eg>
$ eta_g E_g = E_c + E_"roz" $ <eq:balance>
$ n = (T epsilon) / (k F_p), quad s = k epsilon L_0, quad t = (E_g \/ 2) / (n P) $ <eq:equipo>

donde $eta_z = 0.75$ es el rendimiento de la conversión de velocidad en altura; $mu = 0.35$ es el rozamiento del patín sobre hierba, aplicado a la mitad del recorrido porque la sustentación descarga el patín; $L_0$ es la longitud de goma de cada brazo sin estirar; $epsilon$, el alargamiento (1 = 100 %); $T$, la tensión de un brazo al 100 %, con goma lineal; $eta_g = 0.8$ cubre la histéresis de la goma; $k$ es la ventaja del aparejo (3 o 4); $F_p = 250$ N es el tiro sostenido de una persona; $s$, lo que recorre el equipo tirando del cabo; y $P = 75$ W, la potencia sostenida por persona. La fuerza en el gancho se obtiene como $F = 2 T epsilon cos 20 degree$. Los resultados se recogen en la @tab:gomas.

#figure(
  table(
    columns: (1fr, 46mm, 46mm),
    align: (left, left, left),
    table.header([Magnitud], [Caso A: 5–10 m], [Caso B: 10–15 m]),
    [Goma por brazo], [$L_0$ = 40 m; $T$ = 1.75 kN al 100 %], [$L_0$ = 40 m; $T$ = 2.25 kN al 100 % (más cordones)],
    [Alargamiento $epsilon$], [90–100 %], [90–95 %],
    [Energía en la goma $E_g$ (2 brazos)], [57–70 kJ], [73–81 kJ],
    [Pérdidas por rozamiento $E_"roz"$], [10–11 kJ], [10–11 kJ],
    [Velocidad de suelta $V_r$], [76–85 km/h], [89–94 km/h],
    [Recorrido de aceleración $d$], [36–40 m], [36–38 m],
    [Altura alcanzada $h$], [≈ 6–10 m], [≈ 12–15 m],
    [Personas por brazo (aparejo)], [2 (aparejo 4:1)], [3 (aparejo 3:1)],
    [Recorrido del equipo $s$], [145–160 m], [110–115 m],
    [Tiempo de tensado $t$], [≈ 3.5 min], [≈ 3 min],
    [Fuerza en el gancho / aceleración], [3.0–3.3 kN / 1.7–1.9 g], [3.8–4.0 kN / 2.3–2.4 g],
  ),
  caption: [Lanzamiento con gomas en llano, sin viento, a 40 °C y 160 kg.],
) <tab:gomas>

*Lectura.* La altura se regula con la cantidad de goma y con cuánto se estira. Con el mismo largo de 40 m, añadir cordones (de 1.75 a 2.25 kN por brazo) pasa de 6–10 m a 12–15 m. Con menos alargamiento se obtienen saltos más bajos para las primeras sesiones: en el caso A, al 80 % se queda en unos 2 m. Las personas no limitan la energía. Si hay pocas se usa más ventaja de aparejo o un cabrestante manual de carraca por brazo, a cambio de más recorrido o más tiempo. Las pérdidas por rozamiento del patín se comen cerca de un 15 % de la energía de la goma; una rueda o un patín deslizante las reduciría mucho. Cualquier viento de cara mejora todos los valores. Las velocidades de suelta quedan por debajo de la VNE de referencia (115 km/h), aunque el caso B se acerca a 95 km/h. El resultado es sensible al $C_(L,max)$: si fuese 1.2, como contempla A06, $V_1$ sube a 69 km/h y haría falta del orden de un 10–15 % más de goma.

*Cargas, a grosso modo.* Las fuerzas en el gancho y las aceleraciones de la @tab:gomas son un primer orden de magnitud, de un cálculo simplificado: goma lineal, sin dinámica del avión ni de la goma. Sirven para no olvidar que el lanzamiento es un caso de carga del morro y de la estructura delantera del fuselaje, del orden de 2–2.5 veces el peso (1569 N). Sus valores de diseño los fija la fase de cálculo con A01. La goma se elige por ensayo de tracción, con margen de al menos 2 sobre la rotura, y se revisa en cada jornada porque envejece con el sol.

*Equipo y límites propuestos.* Por cada lanzamiento hacen falta un jefe de lanzamiento, que dispara la cola; una persona en la punta del ala; y 2–3 personas por brazo en los aparejos. En total, 6 personas en el caso A y 8 en el caso B, sin contar al piloto. Con un cabrestante por brazo bastan 4. Límites de viento propuestos: viento de cara de 0 a 6 m/s, componente cruzada de 2 m/s como máximo, rachas de no más de 3 m/s sobre la media y ningún remolino de polvo a la vista.

= Lanzamientos futuros (REQ-14) <sec:futuros>

No son obligatorios, pero el diseño no debe impedirlos. Cada uno pide algo distinto al avión (@tab:metodos).

*Remolque por coche.* El coche arrastra al avión con una cuerda de 150–200 m por la pista o una franja de hierba, a 60–75 km/h de velocidad aire. Antes de soltar, el planeador sube por encima y algo por detrás del coche [7]. La altura depende de cuánto pueda correr el coche: en 750 m, con la cuerda tendida por delante y margen para frenar, recorre unos 450 m. Con una pendiente de subida de 1:4 a 1:5 se llega a 50–90 m. Exige un gancho en el centro de gravedad con suelta automática hacia atrás, un fusible calibrado, comunicación con el conductor y una pista libre.

*Torno.* El tambor queda fijo en un extremo y el cable ocupa toda la franja; esa es la diferencia con el coche, que necesita espacio para correr. Como referencia, una franja de 1500 m da unos 1500 ft (≈ 0.3 veces la longitud) con veleros actuales [8]. Un planeador primario, lento y con poca fuerza admisible en el cable, rendirá menos (0.15–0.25). Con 600–700 m de cable en Lillo se esperan 100–180 m. Usa el mismo gancho que el remolque por coche, con fuerzas de cable mayores, y requiere un torno y un operador formado.

*Aerorremolque.* Es el único lanzamiento que permite buscar térmica de verdad (300–600 m). El problema es la velocidad: los remolcadores habituales vuelan a más velocidad de la que admite un primario. Haría falta un remolcador lento, de tipo ultraligero, y un avión diseñado para una velocidad de remolque de al menos 100 km/h, con VNE de referencia la del SG-38 (115 km/h) [6]. Se engancha en un gancho de morro (de cierre, no abierto) con cuerda de 60 m como mínimo [7].

#figure(
  table(
    columns: (22mm, 28mm, 22mm, 20mm, 18mm, 1fr),
    align: (left, left, left, left, left, left),
    table.header([Método], [Cuerda / cable], [Velocidad], [Altura esperable], [Personas], [Exige al avión]),
    [Gomas en llano], [2 × 40 m de goma + aparejo], [Suelta a 75–95 km/h], [5–15 m], [6–8], [Gancho de morro abierto; 3.0–4.0 kN],
    [Coche], [150–200 m], [60–75 km/h], [50–90 m], [3–4], [Gancho CG con suelta automática; fusible],
    [Torno], [600–700 m], [60–80 km/h], [100–180 m], [4–5], [Ídem, con más carga en el gancho],
    [Aerorremolque], [≥ 60 m], [≈ 80–100 km/h], [300–600 m], [3 + remolcador], [Gancho de morro; $V_T >= 100$ km/h],
  ),
  caption: [Comparación de métodos de lanzamiento (Lillo, pista de 750 m).],
) <tab:metodos>

El valor del fusible y los casos de carga del gancho se fijan con A01, tomando CS-22 como referencia. Para no cerrar puertas basta con *reservar los dos puntos de gancho* (morro y centro de gravedad) con un camino de carga hacia la estructura principal, y con no fijar una VNE inferior a la indicada sin decidirlo antes de forma explícita.

= Montaje y desmontaje (CRIT-03) <sec:montaje>

Objetivo propuesto: *2 personas, 30 minutos y solo herramientas manuales básicas* (llaves fijas, destornillador, alicates). Para lograrlo, las uniones de campo usan pasadores cautivos o tornillería estándar con seguro visible, los mandos se conectan de forma que se ve a simple vista si están bien, y los tensores de los cables se ajustan en taller y se precintan, sin tocarlos en campo. Apoyar el avión en la cuna mientras se montan las alas permite hacerlo entre dos. Tras cada montaje, la otra persona revisa el avión con una lista de comprobación. P01 puntúa cada propuesta con la escala de la @tab:montaje.

#figure(
  table(
    columns: (1fr, 30mm, 30mm, 30mm),
    align: (left, left, left, left),
    table.header([Aspecto], [3 (bueno)], [2 (aceptable)], [1 (malo)]),
    [Tiempo de montaje], [≤ 30 min], [30–45 min], [> 45 min],
    [Personas], [2], [3], [≥ 4],
    [Herramientas], [Ninguna o manuales básicas], [Alguna específica], [De taller o de ajuste],
    [Uniones críticas montadas en campo], [≤ 6], [7–12], [> 12],
    [Comprobación de uniones], [Visible sin desmontar], [Hay que tocarlas], [Hay que ajustar o medir],
    [Pieza más pesada], [≤ 25 kg], [25–50 kg], [> 50 kg],
  ),
  caption: [Escala de montaje para CRIT-03.],
) <tab:montaje>

= Almacenaje <sec:almacenaje>

*La cuna.* Es el núcleo de todo el sistema de almacenaje y transporte. Se trata de un utillaje que sujeta el planeador una vez plegado y le da una base estable sobre la que viaja y se guarda. Lleva ruedas para mover el conjunto a mano: subirlo al remolque por rampas, sacarlo y meterlo en el hangar, y llevarlo al punto de montaje. Lleva además patas o calzos para quedar fija en el suelo, puntos de amarre para cinchas, los apoyos de la cubierta y la interfaz con el bastidor del remolque propio. Sus apoyos coinciden con los puntos duros del avión y deben permitir montar y desmontar las alas sin retirarlo de ella. Como depende de la geometría plegada final, es casi un pequeño proyecto en sí. Aquí solo se fijan sus funciones; se diseña cuando exista el planeador.

*En hangar: plegado.* Montado, un avión de 10 m de envergadura y unos 6 m de longitud ocupa unos 60 m². El objetivo es que las alas se plieguen hacia atrás, junto al fuselaje, y que el avión quede sobre su cuna en unos 6.3 × 2 m (≈ 13 m²). Así se mueve dentro del hangar sin desmontar nada.

*En exterior: funda de tela.* Una lona sencilla de poliéster o PVC, transpirable y con forro suave donde toca el avión, atada a la cuna y al suelo. Protege la tela del avión del sol, que la degrada. Hay que vigilar la condensación y evitar que la funda roce o cargue sobre las superficies de mando.

*Carcasa rígida de PMF.* El «Poor Man's Fiberglass» es una piel compuesta barata: tablero de espuma (poliestireno extruido de 20–30 mm) forrado con loneta de algodón pegada con cola vinílica (tipo Titebond II) o con pintura acrílica diluida. Al curar forma una cáscara dura que da a la espuma la resistencia que no tiene. Se acaba con imprimación y pintura exterior, y se repara con los mismos materiales [9]. Para ALIMOCHE se propone una carcasa de unos 6.2 × 1.1 × 1.9 m (≈ 35 m²) sobre un bastidor ligero, dividida en cuatro tramos de unos 1.55 m. Con unos 2 kg/m² pesaría unos 70 kg, más 15–20 kg de bastidor (unos 20 kg por tramo, que mueven dos personas), y costaría menos de 1000 € en material. Masa y coste son estimaciones propias que hay que validar con una muestra.

La carcasa se ancla a los apoyos de la cuna y tiene dos usos. En carretera hace de carenado: a 90 km/h la presión dinámica es de unos 375 Pa, del orden de 0.5 kN de resistencia. En el campo, la cuna se baja del remolque sobre sus ruedas, se calza y la carcasa convierte el conjunto en el hangar propio del avión, que además da sombra al equipo a 40 °C. Hay que anclarla al terreno: una racha lateral de 20 m/s sobre sus 10 m² laterales da unos 2.8 kN, más del doble del momento estabilizador del conjunto, así que sin piquetas o lastre vuelca. Otros riesgos: la espuma arde (nada de llama ni fuentes de calor cerca), el interior se calienta al sol (pintura blanca y ventilación) y el granizo la abolla.

= Jornada tipo de verano <sec:jornada>

La @tab:jornada describe una jornada tipo con lanzamiento por gomas.

#figure(
  table(
    columns: (24mm, 1fr),
    align: (left, left),
    table.header([Hora], [Actividad]),
    [07:00], [Salida del club con el remolque (≈ 100 km; ≈ 1 h 30 min a 80–90 km/h).],
    [08:30], [Llegada a Lillo. Contacto con el aeroclub, briefing, reconocimiento de la franja y del viento.],
    [08:45], [Bajar la cuna, quitar la carcasa y montar el avión (2 personas, ≤ 30 min) mientras el resto clava estacas y tiende las gomas. Inspección cruzada.],
    [09:30–12:00], [Lanzamientos. Ciclo de 12–15 min (tensar ≈ 3 min, lanzar, devolver el avión 50–150 m sobre la cuna o a mano): 10–12 vuelos. Equipo de 6–8 personas por turnos, agua y sombra bajo la carcasa.],
    [12:00], [Fin por calor (más de 32–35 °C, térmicas y remolinos).],
    [12:15], [Desmontaje y carga, o avión en su carcasa si hay sesión de tarde (19:00–21:00).],
    [14:00], [Regreso.],
  ),
  caption: [Jornada tipo con lanzamiento por gomas.],
) <tab:jornada>

= Uso anual y vida útil (dato para la fase 2) <sec:vida>

Escenario optimista: 20–25 jornadas al año con 10–12 lanzamientos cada una, es decir, *200–300 lanzamientos al año*. En una vida de 10 años suman unos 2500–3000 ciclos de lanzamiento y aterrizaje en patín y unos 250 ciclos de transporte, montaje y desmontaje. Las horas de vuelo, en cambio, son pocas: con vuelos de 10–30 s no llegan a 25 h en diez años con gomas. La fatiga y el desgaste dependen de los ciclos de lanzamiento, de los aterrizajes y del transporte, no de las horas. Las inspecciones se programan por ciclos, y los pasadores, herrajes de montaje, patín y gomas se tratan como piezas de sustitución.

= Salidas para el P00

La @tab:salidas recoge los valores que este estudio entrega al ALM-P00.

#figure(
  table(
    columns: (16mm, 1fr, 22mm),
    align: (left, left, left),
    table.header([ID], [Propuesta de contenido], [Origen]),
    [ASM-01], [Base en Lillo (LELT): cota 681 m, pista 12/30 de 750 × 18 m. Condición crítica de 40 °C: ρ = #q(1.039, "kg/m³", dec: 3), altitud de densidad ≈ 1700 m. Operación de verano por la mañana.], [@sec:base],
    [REQ-04], [Lanzamiento con gomas en llano, sin viento, a 40 °C y con la masa máxima: alcanzar al menos 5 m de altura volando a $1.2 V_s$, con un equipo de 6–8 personas y gomas tensadas con aparejo. Objetivo: 10–15 m. Gancho de morro abierto; fuerza del orden de 2–2.5 veces el peso (a confirmar).], [@sec:gomas],
    [REQ-08], [Transporte en remolque de barco ligero propio (≤ 750 kg) o en plataforma de alquiler. Pieza más larga ≤ 6.0 m. Envolvente por avión de 6.0 × 1.0 × 1.8 m. Pieza manipulada ≤ 50 kg. Cuna propia, válida para ambos remolques.], [@sec:transporte],
    [REQ-14], [Reservar gancho de morro y gancho de centro de gravedad con suelta automática. No impedir una velocidad de remolque de 100 km/h ni una VNE de 115 km/h (a cerrar con A05).], [@sec:futuros],
    [CRIT-03], [Escala de montaje de la @tab:montaje. Objetivo: 2 personas, 30 min, herramientas manuales básicas.], [@sec:montaje],
    [Fase 2], [Proyecto de la cuna (@sec:almacenaje). 200–300 lanzamientos al año y 10 años de vida: ≈ 3000 ciclos de lanzamiento y aterrizaje, ≈ 250 de transporte y montaje.], [@sec:almacenaje, @sec:vida],
  ),
  caption: [Valores que este estudio entrega al ALM-P00.],
) <tab:salidas>

#pendiente[Confirmar los datos de Lillo y el acuerdo de uso con el aeroclub; que un ala cuente como carga indivisible (A01); ensayo de tracción de la goma y prueba del aparejo; presupuesto de alquiler de plataformas y de compra del remolque de barco; viabilidad del plegado (P01); muestra de panel de PMF para validar masa y coste.]

#referencias((
  [Aeródromo de Lillo. Hispanopedia. es.hispanopedia.com/wiki/Aeródromo_de_Lillo],
  [Reglamento General de Circulación (RD 1428/2003), art. 15: dimensiones de la carga. Resumen en tuteorica.com],
  [Remolque ligero: qué es y normativa de la DGT. motor.es/que-es/remolque-ligero],
  [Velocidad máxima para los vehículos con remolque. practicatest.com],
  [Remolque náutico galvanizado R00261 (MMA 500 kg, 4.0 m). lafuente.eu],
  [DFS SG 38 Schulgleiter. Wikipedia (en).],
  [FAA. _Glider Flying Handbook_, cap. 7: Launch and Recovery Procedures.],
  [British Gliding Association. _Gliding strip criteria_, octubre 2025.],
  [«Poor man's fiberglass», foro Teardrops n Tiny Travel Trailers (tnttt.com).],
  [Primary glider. Wikipedia (en).],
  [Ejemplos comerciales de plataformas portavehículos: 4.10 × 2.16 m y 4.50 × 2.10 m (2700 kg), 5.00 × 2.10 m (3500 kg).],
  [ALM-P00-A06, _Estimación aerodinámica preliminar_, rev. 0.2 (25/10/2026).],
))
