"""
PROYECTO ALIMOCHE · Estilo común de gráficas (fijado por ALM-FMT-01)

Uso en el script de cada documento (documentos/<CODIGO>/figuras/<nombre>.py):

    import sys, pathlib
    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
    import alimoche_graficas as ag

    fig, ax = ag.figura()                       # 160 x 80 mm por defecto
    ax.plot(x, y1, **ag.serie(0), label="Lillo 40 °C")
    ax.plot(x, y2, **ag.serie(1), label="ISA nivel del mar")
    ax.set_xlabel("Velocidad (km/h)"); ax.set_ylabel("Descenso (m/s)")
    ag.leyenda(ax)
    ag.guardar(fig, __file__)                   # escribe <nombre>.svg junto al script

Reglas:
- Una sola curva: negro, trazo continuo (serie(0)).
- Varias curvas: se admite color, pero SIEMPRE combinado con un tipo de trazo
  (y marcador a partir de la 5.ª serie) distinto, para que la gráfica se lea
  igual impresa en blanco y negro. serie(i) ya da esa combinación.
  serie(i, color=False) da la variante solo en negro/gris.
- Sin título dentro de la gráfica (el título es el pie de figura de Typst),
  ejes «Magnitud (unidad)», punto decimal, rejilla suave, SVG con texto como texto.
"""
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

MM = 1 / 25.4  # pulgadas por mm

# Colores sobrios y distinguibles (también para daltonismo); el primero es siempre negro
COLORES = ["#000000", "#1f4e9c", "#b2182b", "#1b7837", "#d07a00", "#6a3d9a"]
GRISES = ["#000000", "#000000", "#555555", "#555555", "#000000", "#555555"]
TRAZOS = ["-", "--", "-.", ":", "-", "-"]
MARCADORES = [None, None, None, None, "o", "s"]

# Relleno de barras (en orden); combinar con tramas (hatch) si se usan colores
BARRAS = ["#404040", "#9a9a9a", "#d0d0d0", "white"]
TRAMAS = ["", "//", "..", "xx"]
# Líneas de referencia / límites (p. ej. masa máxima, VNE)
LIMITE = dict(color="#000000", linestyle=(0, (6, 3)), linewidth=0.8)


def _formateador(eje):
    """Punto decimal con el mismo número de decimales en todas las marcas del eje."""
    def f(x, _pos):
        dec = 0
        for v in eje.get_majorticklocs():
            t = f"{v:.6f}".rstrip("0").rstrip(".")
            dec = max(dec, len(t.split(".")[1]) if "." in t else 0)
        s = f"{x:.{dec}f}"
        if float(s) == 0:
            s = s.lstrip("-")
        return s.replace("-", "−")
    return FuncFormatter(f)


def estilo():
    matplotlib.rcParams.update({
        "font.family": "sans-serif",
        "font.sans-serif": ["Arial", "Liberation Sans", "DejaVu Sans"],
        "font.size": 8.5,
        "axes.labelsize": 8.5,
        "xtick.labelsize": 8,
        "ytick.labelsize": 8,
        "legend.fontsize": 8,
        "axes.linewidth": 0.6,
        "axes.edgecolor": "black",
        "axes.spines.top": False,
        "axes.spines.right": False,
        "axes.grid": True,
        "grid.color": "#c8c8c8",
        "grid.linewidth": 0.4,
        "grid.linestyle": "-",
        "lines.linewidth": 1.1,
        "xtick.direction": "out",
        "ytick.direction": "out",
        "xtick.major.width": 0.6,
        "ytick.major.width": 0.6,
        "legend.frameon": False,
        "savefig.transparent": True,   # deja ver la marca de agua, como el texto
        "svg.fonttype": "none",        # Typst compone el texto con la fuente del documento
        "axes.formatter.use_mathtext": False,
    })


def figura(ancho_mm=160, alto_mm=80, filas=1, columnas=1, **kw):
    """Crea figura con el estilo ALIMOCHE. Anchos admitidos: 160 (completo) u 78 (media)."""
    estilo()
    fig, ax = plt.subplots(filas, columnas, figsize=(ancho_mm * MM, alto_mm * MM),
                           layout="constrained", **kw)
    for a in (ax.flat if hasattr(ax, "flat") else [ax]):
        a.xaxis.set_major_formatter(_formateador(a.xaxis))
        a.yaxis.set_major_formatter(_formateador(a.yaxis))
    return fig, ax


def serie(i, color=True):
    """Estilo de la serie i (0, 1, 2...): color + trazo (+ marcador) siempre combinados."""
    k = i % len(TRAZOS)
    d = dict(color=(COLORES if color else GRISES)[k], linestyle=TRAZOS[k])
    if MARCADORES[k]:
        d.update(marker=MARCADORES[k], markersize=3.5, markerfacecolor="white", markevery=0.1)
    return d


def barras(i, color=False):
    """Relleno de la serie de barras i: gris por defecto; con color=True añade trama."""
    k = i % len(BARRAS)
    if color:
        return dict(color=COLORES[k], edgecolor="black", linewidth=0.5, hatch=TRAMAS[k])
    return dict(color=BARRAS[k], edgecolor="black", linewidth=0.5)


def leyenda(ax, **kw):
    ax.legend(loc=kw.pop("loc", "best"), handlelength=2.6, **kw)


def anotar(ax, texto, xy, xytext):
    """Anotación sobria con línea fina (para señalar un punto de diseño)."""
    ax.annotate(texto, xy=xy, xytext=xytext, fontsize=7.5,
                arrowprops=dict(arrowstyle="-", linewidth=0.5, color="black"))


def guardar(fig, script_o_ruta, nombre=None):
    """Guarda <nombre>.svg junto al script (o en la ruta dada)."""
    p = Path(script_o_ruta)
    destino = p.with_suffix(".svg") if nombre is None else p.parent / f"{nombre}.svg"
    fig.savefig(destino, format="svg")
    plt.close(fig)
    return destino
