import sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[3] / "plantilla" / "graficas"))
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import numpy as np
import alimoche_graficas as ag
import modelo_a06 as m

cl = np.linspace(0, m.CLMAX, 200)
fig, ax = ag.figura(160, 72)
ax.plot(cl, m.cd(cl), **ag.serie(0), label="CD total")
ax.plot(cl, m.K * cl ** 2, **ag.serie(1), label="CD inducida")
ax.plot(cl, np.full_like(cl, m.CD0), **ag.serie(2), label="CD0")
c = m.cl_optimo()
ax.plot(c, m.cd(c), "o", ms=5, mfc="white", mec="black", mew=0.8, label="Mejor planeo")
ax.set_xlim(0, 1.5); ax.set_ylim(0, 0.16)
ax.set_xlabel("CL (–)"); ax.set_ylabel("CD (–)")
ag.leyenda(ax, loc="upper left")
ag.guardar(fig, __file__)
