# ALIMOCHE · Kit documental para integrar con una IA

**Versión del kit:** 25/10/2026 · **Carácter:** propuesta de organización, pendiente de aceptación por el equipo.

## Para qué sirve

Este paquete permite pedir a otra IA que incorpore al repositorio de ALIMOCHE una estructura documental, reglas de nomenclatura y plantillas Typst. El documento principal es `para_repositorio/docs/ESTANDAR_DOCUMENTAL.md`. El PDF que acompaña al ZIP facilita su lectura; el Markdown y los archivos del ZIP son los que deben usarse para trabajar.

## Qué se ha comprobado

- El repositorio Git activo en `Repositorio/` contiene, a 25/10/2026, solo `ALM-00_Rev-0.4.pdf` y `ALM-P00_Rev-0.2.pdf`. Ambos muestran estado **Borrador**.
- `ALM-P00_Rev-0.2.pdf` muestra **revisión 0.1 en su cabecera**, en ambas páginas. La discrepancia se debe resolver con el responsable antes de etiquetar o publicar una revisión.
- La copia de seguridad de 23/10/2026 contiene la propuesta `ALM-01` (norma documental), `ALM-02` (procedimiento de repositorio), plantilla Typst y recursos gráficos. No están en el Git activo. El kit recupera solo la plantilla común, el esqueleto y dos recursos necesarios, como **base propuesta**, sin afirmar que estén aprobados.
- Otros estudios y PDF se encuentran fuera del repositorio activo. El inventario y el criterio de incorporación figuran en `para_repositorio/docs/INVENTARIO_Y_TRANSICION.md`.

## Contenido

```text
LEEME_PRIMERO.md
PROMPT_PARA_IA.md
GUIA_DOCUMENTAL_ALIMOCHE.pdf
MUESTRA_DE_FORMATO.pdf
para_repositorio/
  AGENTS.md
  README.md
  docs/
    ESTANDAR_DOCUMENTAL.md
    EJEMPLOS_DE_FORMATO.md
    INVENTARIO_Y_TRANSICION.md
  plantillas/
    alimoche.typ
    nuevo-documento.typ
    ficha-salida.md
    estudio.md
    manifiesto-publicacion.toml.ejemplo
  recursos/
    logo-cuadrado.jpeg
    logo-marca-agua-gris.png
  herramientas/
    typst-version.txt
  ejemplos/
    documento_ejemplo.typ
    generar_grafica.py
    datos/tabla_ejemplo.csv
    figuras/grafica_ejemplo.svg
    LEEME.md
  publicados/
    README.md
  .gitignore
```

`para_repositorio/` es una propuesta para copiar o adaptar **dentro de la raíz del Git**. No se debe copiar a ciegas sobre archivos existentes. Los documentos fuente de ALM-00 y ALM-P00 no forman parte del kit: ningún `.typ` encontrado en copias de seguridad debe declararse equivalente a un PDF activo sin cotejo.

`MUESTRA_DE_FORMATO.pdf` enseña el resultado de la plantilla con tabla redactada, CSV procedente de Excel, gráfica SVG e imagen. Usa datos ficticios y no es un documento controlado.

## Uso rápido

1. Entrega a la IA `ALIMOCHE_Kit_documental_IA.zip` y, si puede leer el proyecto, dale acceso al Git activo y a los documentos existentes.
2. Pega el texto de `PROMPT_PARA_IA.md`.
3. Pídele una propuesta de cambios con lista de archivos, diferencias y comprobaciones. El responsable del proyecto decide cuándo la norma pasa de propuesta a norma oficial.

## Orden de autoridad

1. Instrucciones actuales del responsable y decisiones aprobadas del proyecto.
2. Emisiones documentales aprobadas y su evidencia verificable.
3. Documentos activos en el Git, con su estado real en el cajetín.
4. Este kit y los borradores históricos, como material propuesto.

Un nombre de archivo, un commit o una copia de seguridad no constituyen aprobación documental.
