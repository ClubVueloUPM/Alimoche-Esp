"""Regenera la gráfica SVG de demostración desde el CSV exportado.

Datos ficticios. Requiere solo la biblioteca estándar de Python.
"""

from __future__ import annotations

import csv
from pathlib import Path
from xml.sax.saxutils import escape

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "datos" / "tabla_ejemplo.csv"
TARGET = ROOT / "figuras" / "grafica_ejemplo.svg"

with SOURCE.open(encoding="utf-8-sig", newline="") as stream:
    rows = list(csv.DictReader(stream, delimiter=";"))

if not rows:
    raise ValueError("El CSV debe tener al menos una fila de datos")

data = [(row["Mes"], int(row["Muestras (ud)"])) for row in rows]
if any(value < 0 for _, value in data):
    raise ValueError("Las muestras no pueden ser negativas")

max_value = max(4, max(value for _, value in data))
step = 0 if len(data) == 1 else 360 / (len(data) - 1)
points = [(180 + i * step, 300 - value / max_value * 220) for i, (_, value) in enumerate(data)]
polyline = " ".join(f"{x:.1f},{y:.1f}" for x, y in points)

elements = [
    '<svg xmlns="http://www.w3.org/2000/svg" width="700" height="380" viewBox="0 0 700 380" role="img" aria-label="Gráfica ilustrativa de muestras por mes">',
    '<rect width="700" height="380" fill="#ffffff"/>',
    '<text x="350" y="36" text-anchor="middle" font-family="Arial,sans-serif" font-size="20" fill="#182435">Muestras por mes (datos ficticios)</text>',
    '<line x1="100" y1="70" x2="100" y2="300" stroke="#22354c" stroke-width="2"/>',
    '<line x1="100" y1="300" x2="630" y2="300" stroke="#22354c" stroke-width="2"/>',
    '<g font-family="Arial,sans-serif" font-size="15" fill="#22354c">',
    '<text x="365" y="358" text-anchor="middle">Mes</text>',
    '<text x="28" y="188" text-anchor="middle" transform="rotate(-90 28 188)">Muestras (ud)</text>',
    '</g>',
]

for tick in range(max_value + 1):
    y = 300 - tick / max_value * 220
    elements.append(f'<line x1="100" y1="{y:.1f}" x2="630" y2="{y:.1f}" stroke="#dae1e8" stroke-width="1"/>')
    elements.append(f'<text x="77" y="{y + 5:.1f}" font-family="Arial,sans-serif" font-size="15" fill="#22354c">{tick}</text>')

elements.append(f'<polyline points="{polyline}" fill="none" stroke="#1f5b84" stroke-width="4"/>')
for (month, value), (x, y) in zip(data, points):
    elements.extend([
        f'<circle cx="{x:.1f}" cy="{y:.1f}" r="8" fill="#ffffff" stroke="#1f5b84" stroke-width="4"/>',
        f'<text x="{x:.1f}" y="{y - 16:.1f}" text-anchor="middle" font-family="Arial,sans-serif" font-size="16" font-weight="bold" fill="#1f5b84">{value}</text>',
        f'<text x="{x:.1f}" y="326" text-anchor="middle" font-family="Arial,sans-serif" font-size="15" fill="#22354c">{escape(month)}</text>',
    ])

elements.append("</svg>")
TARGET.write_text("\n".join(elements) + "\n", encoding="utf-8")
print(TARGET)
