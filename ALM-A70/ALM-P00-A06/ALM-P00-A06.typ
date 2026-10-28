#import "../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-P00-A06",
  titulo: "Estimación aerodinámica preliminar",
  tipo: "Nota técnica",
  revision: "0.2",
  estado: "Borrador",
  creado: "25/10/2026",
  autor: "Equipo ALIMOCHE",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
)

= Objeto y alcance

Esta nota transforma las cotas y masas propuestas para ALIMOCHE en una primera polar de resistencia y en estimaciones de pérdida, planeo, descenso, empuje y potencia. Sirve para comparar configuraciones en P01. Los números son hipótesis de prediseño, no velocidades autorizadas ni demostración de seguridad o de cumplimiento.

El caso principal es el de ASM-01 del pliego: Lillo a 40 °C, con densidad #q(1.04, "kg/m³", dec: 2). Se incluye ISA al nivel del mar para comparar. Las tres vistas del SG 38 son una referencia visual histórica; los cálculos corresponden al ala rectangular propuesta para ALIMOCHE.

= Datos de entrada y resultados de primer orden

La @tab:entradas recoge los datos de entrada y los resultados inmediatos.

#figure(
  table(
    columns: (1fr, 24mm, 1fr),
    align: (left, right, left),
    table.header([Magnitud], [Valor], [Procedencia o interpretación]),
    [Envergadura $b$], [10.0 m], [Dato de trabajo del promotor],
    [Cuerda media $c$], [1.0 m], [Se supone constante en toda el ala],
    [Superficie alar $S$], [10.0 m²], [$S = b c$; no incluye estabilizadores],
    [Alargamiento AR], [10.0], [$"AR" = b^2 \/ S$],
    [Masa en vacío objetivo], [70 kg], [ALM-00 exige menos de 70 kg],
    [Piloto equipado máximo], [90 kg], [M3 del pliego],
    [Masa máxima de cálculo], [160 kg], [70 + 90 kg; propuesta, no MTOW aprobado],
    [Peso de cálculo], [1569 N], [$m g$, con $g = 9.80665$ m/s²],
    [Carga alar máxima], [16.0 kg/m²], [Equivale a 157 N/m²],
  ),
  caption: [Datos de entrada y resultados de primer orden.],
) <tab:entradas>

Con 70 kg de masa en vacío y 90 kg de piloto, los 160 kg quedan agotados. No hay margen de masa para instrumentos, lastre, protección ni cambios de fabricación. Además, el pliego fija menos de 70 kg, de modo que el valor de 70 kg usado aquí es un caso límite conservador para prestaciones.

#pendiente[Se requiere un presupuesto de masas antes de fijar MTOW.]

El pliego contempla también piloto de 50 kg y caso nominal de 75 kg. Si la masa en vacío fuese 70 kg, resultarían masas de 120 y 145 kg, respectivamente, antes de cualquier lastre. El caso ligero necesitará un análisis de centrado independiente.

= Modelo aerodinámico provisional

Se toma $C_(L,max) = 1.50$ como caso central. Es plausible para una exploración inicial, pero puede resultar optimista para el perfil, el número de Reynolds, la fabricación y la pérdida tridimensional reales. Se calcula además el intervalo 1.20–1.50. No se asigna este valor como requisito ni como propiedad demostrada.

Para una estructura abierta inspirada en el SG 38 se usa $C_(D,0) = 0.055$, referido a los 10 m² de ala. Incluye de forma agregada ala, piloto expuesto, estructura y arriostramiento; no procede de una medición de ALIMOCHE. Se adopta $e = 0.70$ para el ala rectangular, de donde $k = 1 \/ (pi "AR" e) = 0.0455$. Esta pareja de valores produce una fineza máxima cercana a 10, en el orden del SG 38 conservado en el Deutsches Museum. No se han trasladado directamente los coeficientes del SG 38: su superficie y configuración son distintas. El modelo es el de las @eq:polar y @eq:actuaciones.

$ q = 1/2 rho V^2, quad C_L = W / (q S), quad C_(D,i) = k C_L^2, quad C_D = C_(D,0) + C_(D,i) $ <eq:polar>
$ D = q S C_D, quad P_"aero" = D V, quad v_"desc" approx P_"aero" / W $ <eq:actuaciones>

La polar parabólica sólo se usa antes de la pérdida y en planeo casi estacionario (@fig:polar). Cerca de $C_(L,max)$, el modelo deja de describir con fidelidad el aumento de resistencia y los cambios de control. La potencia y el empuje de ascenso se presentan como cargas aerodinámicas hipotéticas para estudiar una motorización futura; el planeador base carece de motor.

#figure(
  image("figuras/polar.svg", width: 100%),
  caption: [Polar de resistencia provisional para el avión completo. El círculo marca el punto de mejor planeo del modelo; el modelo solo es válido antes de la pérdida.],
) <fig:polar>

= Prestaciones estimadas de planeo

La @tab:planeo recoge las prestaciones a 160 kg en las dos atmósferas.

#figure(
  table(
    columns: (1fr, 32mm, 32mm),
    align: (left, right, right),
    table.header([Magnitud a 160 kg], [ISA nivel del mar], [Lillo 40 °C]),
    [Densidad], [1.225 kg/m³], [1.040 kg/m³],
    [Pérdida calculada con $C_(L,max)$ 1.50], [47.0 km/h], [51.1 km/h],
    [Pérdida si $C_(L,max)$ fuese 1.20], [52.6 km/h], [57.1 km/h],
    [Velocidad de mejor planeo], [54.9 km/h], [59.6 km/h],
    [Fineza máxima], [10.0], [10.0],
    [Resistencia en mejor planeo], [157 N], [157 N],
    [Descenso en mejor planeo], [1.53 m/s], [1.66 m/s],
  ),
  caption: [Prestaciones estimadas de planeo a 160 kg.],
) <tab:planeo>

La velocidad de mejor planeo cae sólo 17 % por encima de la pérdida calculada con $C_(L,max) = 1.50$. Por ello no debe traducirse esta cifra directamente en una velocidad operativa. La velocidad de menor descenso del modelo matemático queda prácticamente en el borde de pérdida (@fig:descenso); no se publica como prestación utilizable hasta obtener una polar real y márgenes de pilotaje.

Con piloto nominal de 75 kg y masa total de 145 kg, la velocidad de pérdida calculada sería 44.8 km/h en ISA y 48.6 km/h en Lillo; con piloto de 50 kg, 40.7 y 44.2 km/h. Estos valores sólo reflejan el efecto de la masa con geometría y $C_(L,max)$ invariantes.

#figure(
  image("figuras/descenso.svg", width: 100%),
  caption: [Polar de descenso en aire en calma, en velocidad verdadera, a 160 kg. Cada curva comienza en la pérdida calculada de su atmósfera; los círculos señalan el mejor planeo.],
) <fig:descenso>

La fineza 10 implica, en el punto óptimo y sin viento, una pérdida de unos 100 m por cada 1 km de recorrido horizontal. No se ha calculado distancia de lanzamiento con gomas, altura alcanzada ni recorrido de aterrizaje: faltan el sistema de lanzamiento, la energía disponible, el terreno y los coeficientes cerca de pérdida.

= Resistencia, empuje y potencia

En planeo sin motor, la componente del peso compensa la resistencia. Para un eventual sistema propulsivo, el empuje de equilibrio en vuelo horizontal sería aproximadamente $T = D$, y para ascenso estacionario de razón $R$ se estima $T approx D + W R \/ V$. La potencia aerodinámica sería $D V + W R$. Con eficiencia propulsiva supuesta de 0.70, la potencia de eje es esa suma dividida por 0.70. No se incluyen pérdidas eléctricas, resistencia de instalación, variaciones de masa ni despegue. Los resultados se recogen en la @tab:empuje y en las @fig:empuje y @fig:potencia.

#figure(
  table(
    columns: (1fr, 28mm, 28mm, 28mm),
    align: (left, right, right, right),
    table.header([Lillo a 59.6 km/h], [Horizontal], [Ascenso 1 m/s], [Ascenso 2 m/s]),
    [Empuje requerido], [157 N], [252 N], [346 N],
    [Potencia aerodinámica], [2.60 kW], [4.17 kW], [5.74 kW],
    [Potencia de eje, $eta = 0.70$], [3.71 kW], [5.96 kW], [8.20 kW],
  ),
  caption: [Empuje y potencia requeridos en Lillo a la velocidad de mejor planeo.],
) <tab:empuje>

#figure(
  image("figuras/empuje.svg", width: 100%),
  caption: [Empuje requerido con el modelo provisional a 160 kg y densidad de Lillo (40 °C).],
) <fig:empuje>

#figure(
  image("figuras/potencia.svg", width: 100%),
  caption: [Potencia de eje hipotética a eficiencia propulsiva constante de 0.70, a 160 kg en Lillo. Escalas equivalentes en kW y hp mecánicos (1 hp = 0.7457 kW).],
) <fig:potencia>

Un planeador sin motor no puede mantener ascenso en aire en calma. Los gráficos de ascenso sirven únicamente como insumo para A05 si se estudia propulsión. El motor y su instalación consumirían masa y aumentarían resistencia, por lo que las cifras no son una especificación de motor.

= Sensibilidad

La pérdida responde sobre todo al $C_(L,max)$ y a la carga alar. La fineza y la potencia son especialmente sensibles a la resistencia parásita del piloto y del arriostramiento, reunida aquí en $C_(D,0)$. El factor $e$ también cambia la resistencia inducida. Las variaciones de la @tab:sensibilidad modifican un solo parámetro cada vez respecto al caso central; muestran sensibilidad del modelo y no márgenes de incertidumbre.

#figure(
  table(
    columns: (26mm, 38mm, 1fr),
    align: (left, left, left),
    table.header([Parámetro], [Cambio ilustrativo], [Efecto en el caso de 160 kg]),
    [$C_(L,max)$], [1.50 a 1.20], [Pérdida en Lillo: 51.1 a 57.1 km/h (+11.8 %).],
    [$C_(D,0)$], [0.055 ± 20 %], [Fineza máxima: 11.2 con menor $C_(D,0)$; 9.1 con mayor $C_(D,0)$.],
    [Factor $e$], [0.70 a 0.60 / 0.80], [Fineza máxima: 9.3 / 10.7.],
    [Masa total], [160 ± 10 kg], [Pérdida en Lillo: 49.4 a 52.6 km/h.],
    [Densidad], [1.225 a 1.04 kg/m³], [Velocidades verdaderas y descenso óptimo: +8.5 %; fineza igual.],
  ),
  caption: [Sensibilidad del modelo a un parámetro cada vez.],
) <tab:sensibilidad>

Las cifras destacan el efecto del perfil y de la resistencia de los elementos expuestos. Los cambios reales de geometría pueden alterar varios parámetros a la vez, por lo que estos resultados no se suman directamente.

= SG 38 como referencia de configuración

El SG 38 histórico tiene aproximadamente 10.4 m de envergadura, 6.3 m de longitud y 100–105 kg de masa en vacío, según ejemplar [3, 5]. El Deutsches Museum publica una fineza de 10 a 52 km/h y descenso mínimo de 1.3 m/s a 48 km/h [4]. Su ala publicada es de alrededor de 16 m² [6], frente a los 10 m² adoptados aquí para ALIMOCHE. La semejanza de envergadura no permite trasladar la polar ni las velocidades sin corregir superficie, masa y resistencia. La @fig:sg38 muestra sus vistas.

#figure(
  image("figuras/sg38_vistas.jpg", width: 100%),
  caption: [Lámina de vistas del SG 38 aportada para este estudio. La imagen muestra el SG 38 histórico y no define las dimensiones de ALIMOCHE.],
) <fig:sg38>

#referencias((
  [ALM-00, _Enunciado y bases de diseño_: masa en vacío menor de 70 kg y piloto máximo de 90 kg. ALM-P00, _Pliego de especificaciones_: atmósfera de Lillo, casos de piloto y misión.],
  [NASA Glenn. Ecuación de sustentación y modelo de resistencia inducida. www1.grc.nasa.gov/beginners-guide-to-aeronautics/induced-drag-coefficient/],
  [FAA. _Glider Flying Handbook_, FAA-H-8083-13A, cap. 3: definiciones de polar de descenso y mejor planeo. faa.gov/sites/faa.gov/files/regulations_policies/handbooks_manuals/aviation/glider_handbook/faa-h-8083-13a.pdf],
  [Deutsches Museum. Datos del SG 38: envergadura, masa, fineza y descenso. deutsches-museum.de/flugwerft-schleissheim/ausstellung/luftsport-und-zivile-luftfahrt/sg-38],
  [Smithsonian NASM. Longitud, envergadura y configuración general del SG 38. airandspace.si.edu/collection-objects/schneider-hofmann-rehberg-sg-38/nasm_A19600311000],
  [Vintage Glider Club. _Newsletter_ n.º 90, primavera 1997, ficha SG 38 (superficie histórica aproximada de 16 m²).],
  [Lámina de vistas del SG 38 facilitada para este estudio.],
))
