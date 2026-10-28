import sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import numpy as np
import alimoche_graficas as ag
import modelo_a06 as m

fig, ax = ag.figura(160, 72)
for i, (rho, nombre) in enumerate([(m.RHO_ISA, "ISA nivel del mar"), (m.RHO_LILLO, "Lillo 40 °C")]):
    v = np.linspace(m.v_perdida(rho), 100 / 3.6, 200)
    vz = m.resistencia(v, rho) * v / m.W
    ax.plot(v * 3.6, vz, **ag.serie(i), label=nombre)
    vo = np.sqrt(2 * m.W / (rho * m.S * m.cl_optimo()))
    ax.plot(vo * 3.6, m.resistencia(vo, rho) * vo / m.W, "o", ms=5, mfc="white", mec="black", mew=0.8)
ax.set_xlim(40, 100); ax.set_ylim(1, 5)
ax.set_xlabel("Velocidad verdadera (km/h)"); ax.set_ylabel("Descenso (m/s)")
ag.leyenda(ax, loc="upper left")
ag.guardar(fig, __file__)
