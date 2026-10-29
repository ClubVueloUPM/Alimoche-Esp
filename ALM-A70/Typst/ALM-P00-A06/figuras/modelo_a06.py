"""Modelo aerodinámico provisional de ALM-P00-A06 (polar parabólica). Lo importan los scripts de figuras."""
import math
G = 9.80665
M = 160.0                  # masa de cálculo (kg)
W = M * G                  # peso (N)
S = 10.0                   # superficie alar (m²)
AR = 10.0
E = 0.70
CD0 = 0.055
K = 1 / (math.pi * AR * E)
CLMAX = 1.50
RHO_ISA = 1.225
RHO_LILLO = 1.04
ETA = 0.70


def cd(cl):
    return CD0 + K * cl ** 2


def cl_de(v, rho, w=W):
    return w / (0.5 * rho * v ** 2 * S)


def v_perdida(rho, clmax=CLMAX, w=W):
    return math.sqrt(2 * w / (rho * S * clmax))


def cl_optimo():
    return math.sqrt(CD0 / K)


def resistencia(v, rho, w=W):
    return 0.5 * rho * v ** 2 * S * cd(cl_de(v, rho, w))
