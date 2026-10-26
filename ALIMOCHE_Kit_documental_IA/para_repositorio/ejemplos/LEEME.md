# Muestra de formato

`documento_ejemplo.typ` es una demostración **no controlada**. No reserva el código ALM-EJEMPLO ni aporta datos técnicos al proyecto. Usa `datos/tabla_ejemplo.csv`, `figuras/grafica_ejemplo.svg` y el logo común para enseñar tablas, CSV exportado de Excel, gráficas e imágenes. `generar_grafica.py` regenera el SVG desde el CSV con Python, sin bibliotecas externas.

Desde la raíz de `para_repositorio/`, con Typst 0.15.1:

```text
python ejemplos/generar_grafica.py
typst compile --root . ejemplos/documento_ejemplo.typ compilados/documento_ejemplo.pdf
```

La carpeta `compilados/` debe existir antes de compilar. El PDF resultante es una prueba visual, no una emisión.
