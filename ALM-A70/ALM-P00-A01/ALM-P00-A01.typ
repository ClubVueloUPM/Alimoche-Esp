#import "../../plantilla/alimoche.typ": *

#show: documento.with(
  codigo: "ALM-P00-A01",
  titulo: "Estudio legal",
  tipo: "Estudio auxiliar",
  revision: "0.5",
  estado: "Borrador",
  creado: "28/10/2026",
  autor: "Augusto Aizpún",
  revisor: "Pendiente",
  aprobacion: "Pendiente",
)

// Tablas largas: se permite partirlas entre hojas para no dejar huecos
#show figure.where(kind: table): set block(breakable: true)

= Objeto y alcance

Determinar la categoría legal de ALIMOCHE, qué exige la normativa para volarlo y qué debe consultarse a AESA.

*Aeronave analizada.* Planeador monoplaza sin motor, de tubo de aluminio y tela, con ala, cola y mandos aerodinámicos. Masa en vacío inferior a 70 kg (REQ-01), piloto de 50 a 90 kg y MTOM del orden de 160 kg. Lanzamiento con gomas, con patín o rueda; planeo recto a baja altura; base prevista en el aeródromo de Lillo (LELT).

*Limitación.* Estudio técnico de normativa, no dictamen jurídico. Fuentes consultadas entre el 25/10/2026 y el 28/10/2026.

= Conclusiones

La clasificación legal de ALIMOCHE no es una sola pregunta, sino tres que la normativa trata por separado: si la aeronave entra o no en el sistema europeo de EASA, si debe inscribirse en el Registro de Matrícula de Aeronaves Civiles y bajo qué reglas puede volar. Una respuesta favorable en una de ellas no resuelve las demás. Salir de EASA no autoriza a volar, y estar exento de matrícula no significa volar sin condiciones. Ordenadas así, las dos primeras preguntas tienen una respuesta clara; la tercera no la tiene.

En el plano europeo, ALIMOCHE queda fuera del Reglamento (UE) 2018/1139 por el apartado 1.e de su anexo I, que excluye los planeadores monoplaza con una masa máxima de despegue no superior a 250 kg. Con una MTOM del orden de 160 kg, suma de una aeronave de menos de 70 kg y un piloto de hasta 90 kg, el margen es amplio, y la exclusión no depende de la masa en vacío. Dos vías independientes refuerzan esta conclusión: la del apartado 1.i, para cualquier aeronave tripulada cuya masa máxima en vacío, incluido el combustible, no supere los 70 kg, y la del apartado 1.c, para las aeronaves construidas al menos en un 51 % por aficionados o por asociaciones sin ánimo de lucro, que el club cumplirá si construye el aparato él mismo. La consecuencia es que no le son aplicables Part-21, Part-ML ni Part-SFCL, y que el diseño, la construcción y la operación quedan sometidos a la normativa española, sin perjuicio de las reglas del aire SERA, que obligan a toda aeronave.

En el plano nacional, ALIMOCHE no es un ultraligero: el RD 765/2022 excluye expresamente de esa categoría los aerodinos no motorizados, sean planeadores, alas delta, parapentes o similares, cualquiera que sea su peso. Tampoco le alcanza el llamado régimen «sub-120», que pese a su nombre no es una categoría general de aeronaves ligeras, sino de aeronaves motorizadas de las categorías A, B y C cuya masa al despegue, descontados piloto y paracaídas, no supera los 120 kg. En cuanto a la matrícula, el Reglamento aprobado por el RD 1029/2025 excluye del Registro los microplaneadores sin motor monoplaza con un peso en vacío inferior a 80 kg, de modo que ALIMOCHE, si cumple REQ-01, no se matricula. Si además se le reconoce como ala de vuelo libre, contaría con una segunda exención, la del artículo 2.2.b.2.º, que no fija límite de masa. Estas tres conclusiones tienen certeza alta y pueden citarse en el resto de la documentación del proyecto.

El problema está en la tercera pregunta. La normativa trata a ALIMOCHE como una aeronave de bajo riesgo, pero no dice de forma inequívoca qué reglas rigen su vuelo, porque la respuesta depende de una frontera que la norma no traza: la que separa un ala de vuelo libre de un planeador. Si ALIMOCHE es un ala delta u otra ala de vuelo libre, le es aplicable el régimen que AESA publica para estas aeronaves. Ese régimen no exige licencia aeronáutica específica, certificado de aeronavegabilidad ni notificación de los vuelos ordinarios. A cambio, impone las limitaciones de la disposición adicional cuarta del RD 765/2022: vuelo visual diurno; fuera de espacio aéreo controlado, restringido o prohibido, de zonas urbanas y de aglomeraciones; y por debajo de #num(10000) ft. Si, en cambio, ALIMOCHE es un planeador, esa misma disposición lo excluye expresamente y remite su operación a «la normativa de la Unión Europea y nacional de aplicación». Sin embargo, la normativa europea de planeadores (Partes SAO y SFCL) solo cubre aeronaves dentro de EASA, y la española no desarrolla licencia, aeronavegabilidad ni pruebas en vuelo para un microplaneador sin matrícula. La Ley de Navegación Aérea exige certificado de aeronavegabilidad y título a toda aeronave, salvo a las exceptuadas reglamentariamente, y ese desarrollo reglamentario no existe para el microplaneador. En ese supuesto, la única vía reglada sería la de construcción por aficionados, con autorización previa, inspecciones, pruebas en vuelo y certificado restringido, que encaja mal con un aparato que el propio Registro excluye.

La definición española de ala de vuelo libre no cierra la cuestión. Se refiere a estructuras sustentadoras rígidas o semirrígidas que precisan acción humana para despegar, aterrizar y desplazarse por la atmósfera, sin límite de masa y sin excluir ruedas, cola ni mandos aerodinámicos. Pero «acción humana» admite dos lecturas. Si se entiende como control del piloto, cabría casi cualquier aparato pilotado; si se entiende como esfuerzo físico en el despegue y el aterrizaje, un aparato con fuselaje de tubo, cola, mandos convencionales y rueda se parece más a un microplaneador clásico. Hay precedentes técnicos y deportivos que apoyan la lectura amplia, como los reglamentos federativos de ala delta que admiten ruedas, torno y superficies móviles, o las alas rígidas comerciales con mandos de planeador y tren, pero ninguno constituye una clasificación administrativa española. Ningún rasgo aislado decide; cuenta el conjunto, y quien lo valora es AESA. El lanzamiento previsto con gomas, con impulso humano del equipo de tierra y el piloto gobernando el aparato, es un caso intermedio que deberá documentarse con cuidado.

Con todo ello, el proyecto sigue adelante *como ala rígida de vuelo libre*. Es la única categoría con un régimen operativo publicado que encaja con un aparato sin motor de este tamaño, la definición no la descarta y es la que mejor responde al uso previsto por el club. Pero es una hipótesis de trabajo, no una conclusión acreditada, y de ella se derivan tres compromisos. El primero es no volar, ni siquiera en pruebas tripuladas, hasta disponer del criterio escrito de AESA. El segundo es presentar una única consulta, acompañada de una ficha técnica y un croquis, que pregunte sobre todo si ALIMOCHE puede encuadrarse como ala de vuelo libre, qué se entiende por acción humana y, en caso contrario, qué reglas rigen su operación. El tercero es diseñar y construir sin cerrar puertas: masa en vacío inferior a 70 kg verificada por pesada, cargas de la CS-22 en categoría U como base de cálculo, el club como propietario y operador con seguro de responsabilidad civil, y un diario de construcción que permita pasar al régimen de construcción por aficionados si AESA no confirma el encaje. Así, cualquiera que sea la respuesta, el trabajo hecho servirá.

= Categoría legal

La @tab:categoria resume la respuesta en cada plano normativo y la @tab:masas, las cuatro magnitudes de masa que intervienen, que no son intercambiables.

#figure(
  table(
    columns: (20mm, 1fr, 44mm, 18mm),
    align: (left, left, left, left),
    table.header([Plano], [Respuesta para ALIMOCHE], [Base], [Certeza]),
    [Europeo], [Fuera de EASA. MTOM ≈ 160 kg frente al límite de 250 kg (+15 kg con paracaídas de recuperación). Rige la normativa nacional; SERA sigue aplicando.], [UE 2018/1139, anexo I 1.e (y 1.c, 1.i)], [Alta],
    [ULM], [No es ULM ni «sub-120».], [RD 765/2022, arts. 2.2.a y 2.1.d], [Alta],
    [Matrícula], [Exento como microplaneador sin motor monoplaza < 80 kg en vacío; también como ala de vuelo libre si AESA lo reconoce.], [RD 1029/2025, art. 2.2.b.6.º y 2.º], [Alta],
    [Operación], [Depende de que sea ala de vuelo libre o planeador.], [RD 765/2022, art. 2.3 y DA 4.ª], [Pendiente AESA],
  ),
  caption: [Categoría legal de ALIMOCHE en cada plano normativo.],
) <tab:categoria>

#figure(
  table(
    columns: (38mm, 1fr, 28mm, 30mm),
    align: (left, left, left, left),
    table.header([Magnitud], [Dónde se usa], [Umbral], [ALIMOCHE]),
    [Peso en vacío], [RD 1029/2025, 2.2.b.6.º (microplaneador)], [< 80 kg monoplaza], [Cumple con REQ-01],
    [Masa máxima en vacío, incluido combustible], [UE anexo I 1.i; RD 1029/2025, 2.2.b.7.º], [≤ 70 kg], [Cumple con REQ-01],
    [MTOM], [UE anexo I 1.e (planeador)], [≤ 250 kg monoplaza], [≈ 160 kg: cumple],
    [MTOM menos piloto y paracaídas], [RD 765/2022, 2.1.d («sub-120»)], [≤ 120 kg], [No aplica: sin motor],
  ),
  caption: [Cuatro magnitudes de masa que no son intercambiables.],
) <tab:masas>

= Ala rígida de vuelo libre

RD 1029/2025, art. 2.2.b.2.º: estructuras sustentadoras rígidas o semirrígidas que precisan *acción humana* para despegar, aterrizar y desplazarse por la atmósfera. No fija masa ni excluye ruedas, cola o mandos. No debe confundirse con la exención 2.2.b.5.º (aeronaves que requieren esfuerzo físico de un ocupante), que es otra vía. La @tab:lanzamiento recoge el efecto probable de cada método de lanzamiento.

#figure(
  table(
    columns: (36mm, 1fr),
    align: (left, left),
    table.header([Método de lanzamiento], [Efecto probable en la clasificación (hipótesis)]),
    [Gomas (previsto)], [Impulso humano del equipo de tierra y piloto que gobierna. Caso intermedio: documentar quién aporta la energía y cómo se controla el despegue.],
    [A pie], [Refuerza el argumento; exige demostrar que el piloto sostiene y acelera el aparato.],
    [Torno o cable], [Energía externa; aclarar si basta la acción del piloto.],
    [Remolque o vehículo], [Acerca la lectura a planeador convencional.],
    [Rodadura], [Las ruedas no están prohibidas; lo decisivo es cómo se logra el despegue.],
  ),
  caption: [Método de lanzamiento y efecto probable en la clasificación.],
) <tab:lanzamiento>

*Consecuencia para el diseño.* Se mantiene el lanzamiento con gomas y patín o rueda, sin construir variantes buscando un nombre jurídico. La ficha técnica describirá la acción humana en despegue, vuelo y aterrizaje.

= Operación según la categoría

La @tab:operacion compara lo que supone cada categoría para la operación.

#figure(
  table(
    columns: (26mm, 1fr, 1fr),
    align: (left, left, left),
    table.header([Materia], [Ala de vuelo libre (vía de trabajo)], [Microplaneador / planeador no EASA]),
    [Licencia], [No se exige licencia aeronáutica específica.], [Sin norma: la SPL solo cubre aeronaves EASA. Si habilita una PPL(A), a consultar.],
    [Aeronavegabilidad], [Sin certificado.], [Ley 48/1960, art. 36; excepción del art. 151.2 sin desarrollar. Vía reglada: RCAA.],
    [Notificación], [No se notifican los vuelos ordinarios.], [Sin régimen definido.],
    [Zona de despegue], [Sin requisitos aeronáuticos específicos; sí derechos sobre el terreno y normas autonómicas y federativas.], [Aeródromo (LELT con acuerdo del gestor) o autorización de AESA (Ley 48/1960, art. 150.1.c).],
    [Limitaciones], [DA 4.ª RD 765/2022: VFR diurno y VMC; fuera de espacio controlado, restringido, prohibido, zonas peligrosas activas, urbanas y aglomeraciones; ≤ #num(10000) ft (hasta #num(13000) ft menos de 30 min); arnés; casco si no hay protección.], [La DA 4.ª excluye los planeadores y remite a una «normativa UE y nacional de aplicación» sin desarrollo para este caso.],
    [Reglas del aire], [SERA y RD 1180/2018.], [SERA y RD 1180/2018.],
  ),
  caption: [Operación según la categoría.],
) <tab:operacion>

#pendiente[*Punto jurídico.* El RD 765/2022 (art. 2.3 y DA 4.ª, redacción del RD 182/2026, vigente desde el 01/04/2026) aplica la DA 4.ª a los aerodinos no motorizados del art. 2.2 «con excepción de los planeadores». Ala delta y planeador son ejemplos de la misma letra 2.2.a. Dónde cae ALIMOCHE en esa frontera es la pregunta central de la consulta.]

= Escenarios

La @tab:escenarios recoge los tres escenarios posibles según la respuesta de AESA.

#figure(
  table(
    columns: (30mm, 26mm, 1fr, 1fr),
    align: (left, left, left, left),
    table.header([Escenario], [Condición], [Qué supone], [Qué hace el proyecto]),
    [A · Ala de vuelo libre (vía de trabajo)], [AESA confirma el encaje.], [Régimen AESA de vuelo libre con límites de la DA 4.ª.], [Ficha técnica, programa de pruebas propio, seguro, acuerdos de terreno, formación interna.],
    [B · Microplaneador < 80 kg], [AESA lo considera planeador.], [Sin matrícula; operación, licencia y aeronavegabilidad según indique AESA.], [Aplicar lo que fije AESA; si no hay régimen utilizable, pasar a C.],
    [C · Construcción por aficionados (RCAA)], [No encaja en A ni en B, o se motoriza.], [Autorización previa, inspecciones (antes de entelar y montada), pruebas en vuelo adaptadas (art. 13.4) y CAR.], [Expediente RCAA. El diario de construcción (51 %, autores, fotos) se lleva desde el inicio.],
  ),
  caption: [Escenarios de clasificación.],
) <tab:escenarios>

En el escenario C hay un conflicto a resolver: el RCAA pide matrícula tras el CAR, pero el microplaneador está excluido del Registro. Además, el programa estándar para planeadores (5 h, 20 aterrizajes y remolque a 1000 m) no es aplicable a ALIMOCHE.

= Requisitos que no dependen de la categoría

#item("REQ-01", "Masa en vacío inferior a 70 kg")[
  Masa en vacío: la de la aeronave totalmente terminada y montada en configuración de vuelo, con todo su equipo instalado o necesario para el vuelo (estructura, entelado y acabado, mandos, arnés, ganchos de lanzamiento, patín o rueda, instrumentos, baterías y lastre fijo), sin piloto, sin el equipo personal del piloto (ropa, casco y paracaídas personal) y sin lastre amovible. Si se instala motor, incluye además motor, hélice, sistemas, fluidos y la totalidad del combustible. Se verifica por pesada de la aeronave completa con báscula calibrada; cada estimación de diseño declarará su margen respecto a 70 kg (CRIT-01).
]

== Base de diseño: CS-22 Amendment 3, categoría U (guía voluntaria)

La @tab:cs22 resume los valores de la CS-22 que se toman como base de cálculo.

#figure(
  table(
    columns: (26mm, 1fr, 30mm),
    align: (left, left, left),
    table.header([Concepto], [Valor], [Origen]),
    [Maniobra], [$n_1 = +5.3$ en $V_A$; $n_2 = +4.0$ en $V_D$; $n_3 = -1.5$ en $V_D$; $n_4 = -2.65$ en $V_A$], [CS 22.333–22.337],
    [Ráfagas], [±15 m/s en $V_B$; ±7.5 m/s en $V_D$, con factor de alivio], [CS 22.333(c), 22.341],
    [Seguridad], [1.5 sobre carga límite; herrajes 1.15; aplastamiento 2.0; anclajes de asiento y arnés 1.33], [CS 22.303, 22.619–22.625],
    [Aterrizaje y emergencia], [$n >= 3$ y descenso ≥ 1.77 m/s; retención del piloto 7.5 / 15 / 6 / 9 g (arriba, adelante, lateral, abajo)], [CS 22.473, 22.561],
    [Lanzamiento], [Gomas: gancho a $1.5 Q_"nom"$, con $Q_"nom"$ la tensión máxima medida], [CS 22.581–22.585],
  ),
  caption: [Base de diseño: CS-22 Amendment 3, categoría U.],
) <tab:cs22>

Con la carga alar prevista (≈ 10 daN/m²) la ráfaga de 15 m/s puede dar factores del orden de +4: condicionará el ala tanto como la maniobra.

== Seguro, responsabilidad y motorización

El club es propietario y operador, con RC de al menos 0.75 M DEG por accidente (referencia: Reglamento (CE) 785/2004, art. 7) y seguro de accidentes para piloto y equipo de tierra. El operador responde de forma objetiva frente a terceros en superficie (Ley 48/1960, arts. 119–121); el club con su patrimonio y sus directivos por negligencia (LO 1/2002, art. 15); la UPM solo si la actividad se integra en su servicio público (Ley 40/2015, art. 32), por lo que se formalizará por escrito con la ETSIAE. Una versión motorizada conservaría la exención de matrícula solo con ≤ 70 kg incluido el combustible; si no, RCAA con matrícula.

= Consulta a AESA

Una sola consulta escrita por la sede electrónica de AESA, acompañada de ficha técnica y croquis de tres vistas, con las preguntas de la @tab:consulta.

#figure(
  table(
    columns: (18mm, 1fr),
    align: (left, left),
    table.header([ID], [Pregunta]),
    [CONS-01], [*Clasificación.* ¿Puede ALIMOCHE encuadrarse como ala delta u otra ala de vuelo libre (RD 1029/2025, 2.2.b.2.º) y operar conforme al criterio de AESA para esas aeronaves? ¿Qué rasgos serían decisivos?],
    [CONS-02], [*Acción humana.* ¿Control del piloto o esfuerzo físico? ¿Cómo influyen gomas, pie, torno, remolque y rodadura?],
    [CONS-03], [*Si no es vuelo libre.* ¿Le alcanza la excepción de planeadores de la DA 4.ª? ¿Qué normas rigen operación, licencia (¿habilita una PPL(A)?), aeronavegabilidad y pruebas en vuelo?],
    [CONS-04], [*RCAA.* ¿Aplicable a un microplaneador exento de matrícula? ¿Matrícula voluntaria para el CAR? ¿Programa de pruebas adaptado sin remolque a 1000 m?],
    [CONS-05], [*Lanzamiento y terreno.* Requisitos para lanzar con gomas en LELT y en terrenos que no son aeródromo.],
    [CONS-06], [*Seguro, masa y diseño.* Cobertura mínima; aceptación de REQ-01 con pesada y de CS-22 categoría U.],
    [CONS-07], [*Constructor y motor.* Club de Vuelo UPM como constructor y propietario (anexo I 1.c); clasificación de una futura versión motorizada.],
  ),
  caption: [Preguntas de la consulta a AESA.],
) <tab:consulta>

== Próximos pasos

#figure(
  table(
    columns: (8mm, 1fr, 34mm),
    align: (right, left, left),
    table.header([N.º], [Acción], [Cuándo]),
    [1], [Ficha técnica de 1–2 páginas y croquis de tres vistas.], [Antes de la consulta],
    [2], [Presentar la consulta a AESA.], [Noviembre 2026],
    [3], [Prediseño como ala de vuelo libre con REQ-01 y cargas CS-22 categoría U.], [En paralelo],
    [4], [Diario de construcción (51 %, autores, fotos, inspección antes de entelar).], [Desde la primera pieza],
    [5], [Autorización escrita de la ETSIAE/UPM; póliza de RC y accidentes; acuerdo con el gestor de LELT.], [Antes de las pruebas],
    [6], [Archivar la respuesta de AESA y revisar este documento con el escenario confirmado.], [Al recibir respuesta],
  ),
  caption: [Próximos pasos.],
) <tab:pasos>

#nota[Este informe se basa en fuentes oficiales pero expone interpretaciones de trabajo. No es un dictamen vinculante ni sustituye permisos, requisitos de aeronavegabilidad o el criterio de la autoridad competente.]

#referencias((
  [Reglamento (UE) 2018/1139, art. 2.3.d y anexo I (consolidado 02/08/2026). CELEX 02018R1139.],
  [Real Decreto 765/2022, art. 2 y DA 4.ª, redacción del RD 182/2026. BOE-A-2022-16402.],
  [Real Decreto 1029/2025, Reglamento de matriculación, art. 2.2.b. BOE-A-2025-22950.],
  [AESA. _Ala delta, parapente y paramotor_ (actualización 12/03/2026). seguridadaerea.gob.es.],
  [Ley 48/1960, de Navegación Aérea, arts. 36, 119–127, 150 y 151. BOE-A-1960-10905.],
  [Orden de 31/05/1982, RCAA; AESA guía AI-AFIS-P01-GU01 Ed. 04. BOE-A-1982-13477.],
  [Reglamento (UE) 923/2012 (SERA) y RD 1180/2018. CELEX 02012R0923.],
  [Reglamento (CE) 785/2004, arts. 2.2 y 7. CELEX 02004R0785.],
  [LO 1/2002 (art. 15); Ley 40/2015 (art. 32). BOE-A-2002-5852.],
  [EASA. _CS-22 Amendment 3_ (ED Decision 2021/013/R). easa.europa.eu.],
  [FDACV, _Reglamento general de ala delta_ (2020); Archaeopteryx; ULF-1. Referencias técnicas.],
))
