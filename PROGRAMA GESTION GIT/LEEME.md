# ALIMOCHE · Git (versión sencilla) — v1.3.0

Programa para Windows que hace de "mando a distancia" del repositorio de ALIMOCHE en GitHub. No hace falta saber Git.

## Requisitos
- Windows 10/11 con **Git for Windows** instalado (si falta, el programa te lleva a la descarga). Si ya usaste el gestor completo `ALIMOCHE.exe`, reutiliza su Git.
- Una cuenta de GitHub **propia**, miembro de la organización, con acceso al repositorio.

## Primer uso (3 pasos, una sola vez)
1. **Repositorio**: pega la dirección (p. ej. `https://github.com/organizacion/ALIMOCHE`).
2. **Tu token**: el programa abre GitHub con la página de creación del token ya rellenada (nombre, organización, caducidad 1 año, permisos *Contents* y *Pull requests* en lectura y escritura). Tú solo marcas el repositorio en *Repository access*, pulsas *Generate token*, lo copias y lo pegas. El programa lo comprueba y lo guarda cifrado en el **Administrador de credenciales de Windows** (`AlimocheGit:github.com`).
   - Administradores: marcad «Soy administrador» para añadir *Administration: read* y que se detecte el bypass.
3. **Carpeta**: eliges dónde se descarga. Si ya lo tenías, «Elegir esa carpeta».

Las versiones se firman automáticamente con el nombre de la cuenta y su correo privado de GitHub (`id+usuario@users.noreply.github.com`), así salen enlazadas al perfil.

## Varios repositorios y varios tokens
- El programa recuerda una **lista de repositorios**, cada uno con su carpeta. Se cambia de uno a otro con el **selector de la cabecera**.
- **Repositorios** (botón de la cabecera): ver la carpeta y la dirección de cada uno, **cambiar la ubicación** de la carpeta (se mueve con todo, incluidos los cambios sin guardar), **quitarlo de la lista** (no borra nada), **añadir** otro (descargándolo o eligiendo una carpeta que ya tengas).
- **Tokens**: uno por organización, porque así funcionan los tokens de GitHub. Si un token nuevo no sirve para los demás repositorios de esa organización, el programa lo guarda solo para ese repositorio y el anterior sigue valiendo para el resto; si sirve para todos, sustituye al anterior.
- Si añades un repositorio al que tu token no da acceso, el programa no falla: explica las posibles causas (no marcaste ese repositorio en el token —se arregla editando el token en GitHub—, tu cuenta no tiene acceso —pide que te añadan—, o la organización no ha aprobado el token) y te deja comprobar de nuevo o usar otro token.
- Los tokens guardados se ven, reemplazan y borran en «Repositorios».

## Qué ve cada uno
El programa lee de GitHub lo que puede hacer la cuenta del token en `main`:

| Cuenta | Qué aparece |
|---|---|
| **Miembro** (escritura, sin bypass) | Al guardar una versión estando en `main`, se crea una rama para su propuesta. «Enviar propuesta» sube la rama y crea el *pull request* con título y comentario obligatorios. |
| **Con bypass** (administrador, o en la lista de bypass) | Elige en cada versión: **directo a main** («Subir directo a main») o **como propuesta** («Enviar como propuesta», rama + revisión). Además, botón **Integrar** en cada propuesta abierta (sin esperar revisión). |
| **Solo lectura** | Puede descargar y traer cambios, no subir. |

Quien manda es GitHub: si algo no está permitido, GitHub lo rechaza y el programa lo explica (y si era una subida a `main`, la convierte en propuesta).

## Botones
| Botón | Qué hace (en Git) |
|---|---|
| Traer cambios | `git pull` |
| Nueva rama / lista | `git switch -c` / `git switch` |
| Actualizar con main | `git merge origin/main` |
| Guardar versión | `git add -A` + `git commit` con comentario obligatorio |
| Subir | `git push` — sube **todas** las versiones guardadas pendientes, no solo la última (si son varias, lo avisa antes) |
| Enviar propuesta | `git push` + crea el *pull request* (API de GitHub) |
| Integrar (bypass) | fusiona el *pull request* y borra su rama |

Los botones **↻ Refrescar** vuelven a leer la carpeta, GitHub o las propuestas cuando quieras (el programa también lo hace solo al volver a su ventana).

## Para el administrador de la organización
- Organización → Settings → *Personal access tokens*: permitir *fine-grained tokens*; opcionalmente exigir aprobación y caducidad máxima. Ahí también se ven y revocan los tokens de cada uno.
- Protección de `main` (ruleset): exigir *pull request*; en *Bypass list* poned a quien deba poder subir directo.
- Cada persona usa su propio token. **Nunca repartas el tuyo**: quien lo tenga actúa como tú, con tu bypass.

## Datos
- Configuración: `%APPDATA%\AlimocheGit\config.json` (lista de carpetas, repositorio activo y qué tokens hay; los secretos no).
- Tokens: Administrador de credenciales de Windows, como `AlimocheGit:github.com/<organización>` (o `/<organización>/<repositorio>`). Se borran desde «Repositorios».
- Git recibe el token por variables de entorno solo para `github.com`; no queda escrito en la configuración de Git ni en la línea de comandos.

## Compilar desde el código
Go 1.24:
```
GOOS=windows GOARCH=amd64 go build -trimpath -ldflags "-s -w -H windowsgui" -o ALIMOCHE-Git.exe .
```
`core_test.go` y `multi_test.go` prueban todo el flujo (miembro, administrador, varios repositorios y tokens) contra un GitHub simulado: `go test .`
