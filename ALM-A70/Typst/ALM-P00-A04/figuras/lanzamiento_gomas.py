"""Figura 2 de ALM-P00-A04: lanzamiento con gomas en llano, tensado con aparejo (planta, sin escala).
Redibujo del esquema original con el estilo común."""
import sys, pathlib, math
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
import alimoche_graficas as ag
import matplotlib.pyplot as plt

ag.estilo()
fig = plt.figure(figsize=(150 * ag.MM, 78 * ag.MM))
ax = fig.add_axes([0, 0, 1, 1])
ax.set_axis_off(); ax.set_aspect("equal")

g = (0.0, 0.0)                        # gancho de morro
L = 10.0
ang = math.radians(20)
e1 = (L * math.cos(ang), L * math.sin(ang))
e2 = (L * math.cos(ang), -L * math.sin(ang))
for e in (e1, e2):
    ax.plot([g[0], e[0]], [g[1], e[1]], color="black", lw=2.4, solid_capstyle="butt")  # goma
    ax.plot(e[0], e[1], marker="o", ms=4, mfc="white", mec="black", mew=0.7)           # aparejo
    ax.plot(e[0] + 0.35, e[1], marker="x", ms=7, color="black", mew=1.0)                # estaca
    s = 1 if e[1] > 0 else -1
    pts = [(e[0] - 2.6 + 0.55 * i, e[1] + s * (0.55 - 0.08 * i)) for i in range(3)]
    ax.plot([e[0], pts[-1][0]], [e[1], pts[-1][1]], color="black", lw=0.6)              # cabo
    for p in pts:
        ax.plot(*p, marker="o", ms=4, color="black")                                     # personas

# avión: ala (barra vertical) y cola con anclaje
ax.plot([0, 0], [-1.0, 1.0], color="black", lw=2.0)
ax.plot([-1.3, 0], [0, 0], color="black", lw=1.0)
ax.plot([-1.3, -1.3], [-0.25, 0.25], color="black", lw=1.0)
ax.plot([-1.75, -1.3], [0, 0], color="black", lw=0.6, ls=":")
ax.plot(-2.0, 0, marker="x", ms=7, color="black", mew=1.0)

fs = 8
ax.text(e1[0] - 2.6, e1[1] + 1.05, "2–3 personas tirando del cabo", fontsize=fs, ha="center")
ax.text(e1[0] + 0.6, e1[1] - 0.9, "Estaca +\naparejo 3:1 o 4:1", fontsize=fs, va="top")
mx, my = e1[0] * 0.5, e1[1] * 0.5
ax.text(mx - 0.4, my + 0.45, "Goma 40 m → ≈ 75–80 m estirada", fontsize=fs, rotation=20,
        rotation_mode="anchor", ha="center")
ax.text(-2.6, 1.3, "Punta de ala (1 persona)", fontsize=fs)
ax.text(-2.4, -0.55, "Anclaje de cola\ncon disparador", fontsize=fs, ha="center", va="top")
ax.annotate("Gancho de morro abierto", xy=(0.05, -0.05), xytext=(1.6, -2.6), fontsize=fs, ha="center",
            arrowprops=dict(arrowstyle="-", lw=0.5, color="black"))
ax.text(2.6, 0.05, "2 × 20°", fontsize=fs, va="center")
ax.annotate("", (12.2, -0.6), (10.4, -0.6), arrowprops=dict(arrowstyle="->", lw=0.8))
ax.text(11.3, -0.35, "Lanzamiento", fontsize=fs, ha="center")

ax.set_xlim(-3.4, 13.0); ax.set_ylim(-4.3, 5.0)
ag.guardar(fig, __file__)
