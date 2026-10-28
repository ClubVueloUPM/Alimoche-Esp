import sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import numpy as np
import alimoche_graficas as ag
import modelo_a06 as m

HP = 0.7457  # kW por hp mecánico
rho = m.RHO_LILLO
v = np.linspace(m.v_perdida(rho), 100 / 3.6, 200)
d = m.resistencia(v, rho)
fig, ax = ag.figura(160, 72)
for i, (r, nombre) in enumerate([(0, "Vuelo horizontal"), (1, "Ascenso 1 m/s"), (2, "Ascenso 2 m/s")]):
    ax.plot(v * 3.6, (d * v + m.W * r) / m.ETA / 1000, **ag.serie(i), label=nombre)
ax.set_xlim(50, 100); ax.set_ylim(0, 16)
ax.set_xlabel("Velocidad verdadera (km/h)"); ax.set_ylabel("Potencia de eje (kW)")
ax2 = ax.secondary_yaxis("right", functions=(lambda x: x / HP, lambda x: x * HP))
ax2.set_ylabel("Potencia de eje (hp)")
ax2.yaxis.set_major_formatter(ag._formateador(ax2.yaxis))
ag.leyenda(ax, loc="upper left")
ag.guardar(fig, __file__)
