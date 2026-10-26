# ALIMOCHE · Repositorio documental propuesto

Este contenido es una **propuesta de implantación**. La norma está en `docs/ESTANDAR_DOCUMENTAL.md`; la situación de partida y las incidencias están en `docs/INVENTARIO_Y_TRANSICION.md`.

## Estructura

```text
documentos/<CÓDIGO>/<CÓDIGO>.typ   fuente de cada documento
documentos/<CÓDIGO>/figuras/       figuras propias
documentos/<CÓDIGO>/datos/         datos propios y reproducibles
plantillas/                         formato común y esqueletos
recursos/                           logos y recursos compartidos
herramientas/                       versión de Typst y validadores
compilados/                         PDF de trabajo, fuera de Git
publicados/<CÓDIGO>/               emisiones aprobadas, inmutables
docs/                               reglas y transición
```

Las carpetas que todavía no tienen un documento o una herramienta real se crean cuando hagan falta.

## Documento nuevo

1. Verifica que el código no existe en el Git ni en el inventario histórico.
2. Copia `plantillas/nuevo-documento.typ` a `documentos/<CÓDIGO>/<CÓDIGO>.typ` y completa `meta`.
3. Redacta el cuerpo; el estado inicial es `Borrador`.
4. Desde la raíz del repositorio, compila con Typst 0.15.1:

```text
typst compile --root . documentos/ALM-P00-A01/ALM-P00-A01.typ compilados/ALM-P00-A01.pdf
```

El código anterior es un ejemplo de sintaxis; si `ALM-P00-A01` ya existe, no lo uses para un documento nuevo. Para incorporar el commit al pie, pasa `--input git_commit=<sha-corto>`.

El PDF compilado es de trabajo. La publicación exige la autorización documentada descrita en la norma.
