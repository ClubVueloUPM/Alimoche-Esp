"""Figura 1 de ALM-P00-A04: paquete de transporte sobre plataforma de 4.5 m (a) y sección con dos aviones (b).
Esquema acotado en metros (redibujo del original con el estilo común)."""
import sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
import alimoche_graficas as ag
from matplotlib.patches import Rectangle, Circle, Polygon

import matplotlib.pyplot as plt
ag.estilo()
fig = plt.figure(figsize=(160 * ag.MM, 66 * ag.MM))
a = fig.add_axes([0.0, 0.02, 0.66, 0.96])
b = fig.add_axes([0.70, 0.02, 0.30, 0.96])
for ax in (a, b):
    ax.set_axis_off()
    ax.set_aspect("equal")

K = dict(color="black", lw=0.9)
G = dict(color="#808080", lw=0.9)


def cota(ax, x0, y0, x1, y1, txt, dy=0.0, dx=0.0, ha="center", va="bottom"):
    ax.annotate("", (x0, y0), (x1, y1), arrowprops=dict(arrowstyle="<->", lw=0.6, color="black",
                                                        shrinkA=0, shrinkB=0))
    ax.text((x0 + x1) / 2 + dx, (y0 + y1) / 2 + dy, txt, ha=ha, va=va, fontsize=7.5)


# ---- (a) Alzado (unidades: m) ----
suelo = 0.0
a.plot([-6.4, 7.6], [suelo, suelo], **G)
# coche
a.add_patch(Polygon([(-6.2, 0.4), (-6.2, 1.15), (-5.4, 1.65), (-3.9, 1.65), (-3.2, 1.15), (-2.8, 1.1), (-2.8, 0.4)],
                    closed=True, fill=False, **G))
for xr in (-5.6, -3.6):
    a.add_patch(Circle((xr, 0.35), 0.35, fill=False, **G))
# lanza y plataforma
a.plot([-2.85, 0.0], [0.6, 0.6], **K)
a.add_patch(Rectangle((0.0, 0.5), 4.5, 0.15, fill=False, **K))
a.add_patch(Circle((2.6, 0.35), 0.35, fill=False, **K))
# paquete
a.add_patch(Rectangle((0.0, 0.65), 6.0, 2.05, fill=False, ls=(0, (4, 2)), lw=1.0, color="black"))
a.text(3.0, 1.8, "Paquete (cuna + fuselaje + alas)\n+ carcasa PMF", ha="center", va="center", fontsize=7.5)
a.add_patch(Rectangle((6.0, 0.9), 0.06, 0.55, color="#404040"))
a.text(6.15, 1.18, "V-20", fontsize=7, va="center")
# cotas
cota(a, 0.0, 3.0, 6.0, 3.0, "Pieza más larga ≤ 6.0 m (longitud comercial del tubo)", dy=0.1)
cota(a, 0.0, -0.3, 4.5, -0.3, "Plataforma 4.5 m", dy=-0.15, va="top")
cota(a, 4.5, -0.3, 6.0, -0.3, "Vuelo 1.5 m", dy=-0.15, va="top")
a.annotate("", (6.9, 0.0), (6.9, 2.7), arrowprops=dict(arrowstyle="<->", lw=0.6, shrinkA=0, shrinkB=0))
a.text(7.0, 1.35, "≈ 2.4 m\nsobre\ncalzada", fontsize=7.5, va="center")
a.text(-6.3, 3.4, "(a) Alzado", fontsize=8, weight="bold")
a.set_xlim(-6.5, 8.2); a.set_ylim(-1.0, 3.7)

# ---- (b) Sección con dos aviones ----
b.plot([-0.2, 2.3], [0, 0], **G)
for xr in (0.25, 1.85):
    b.add_patch(Circle((xr, 0.3), 0.3, fill=False, **K))
b.add_patch(Rectangle((0.0, 0.6), 2.1, 0.12, fill=False, **K))
for x0 in (0.04, 1.06):
    b.add_patch(Rectangle((x0, 0.72), 1.0, 1.8, fill=False, ls=(0, (4, 2)), lw=1.0, color="black"))
    for xs in (0.12, 0.30):  # semialas de canto
        b.add_patch(Rectangle((x0 + xs, 0.85), 0.07, 1.5, fill=True, fc="#d9d9d9", ec="black", lw=0.6))
    b.add_patch(Rectangle((x0 + 0.52, 0.85), 0.36, 1.25, fill=False, **K))  # fuselaje
cota(b, 0.0, 2.75, 2.1, 2.75, "Plataforma ≈ 2.0–2.1 m", dy=0.06)
cota(b, 0.04, -0.3, 1.04, -0.3, "≤ 1.0 m", dy=-0.12, va="top")
cota(b, 1.06, -0.3, 2.06, -0.3, "≤ 1.0 m", dy=-0.12, va="top")
b.text(-0.15, 3.2, "(b) Sección: dos aviones", fontsize=8, weight="bold")
b.set_xlim(-0.25, 2.4); b.set_ylim(-0.75, 3.45)

ag.guardar(fig, __file__)
