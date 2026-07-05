#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# 🐜 HormigasAIS — crear_sdk_html.sh
# Crea sdk.html en ~/hormigasais-docs con el mismo diseño
# visual de legal.html (Space Mono + Syne, ámbar, dark).
# NO toca ningún archivo existente.
# ============================================================

set -uo pipefail

DESTINO="$HOME/hormigasais-docs/sdk.html"

echo "🐜 Creando sdk.html — HormigasAIS SDK Ecosystem"
echo "------------------------------------------------------------"

# Verificar que no existe ya (evitar sobreescritura accidental)
if [ -f "$DESTINO" ]; then
  echo "⚠️  $DESTINO ya existe. Abortando para evitar sobreescritura."
  echo "   Si quieres regenerarlo, bórralo primero: rm $DESTINO"
  exit 1
fi

python3 << 'PYEOF'
import os

destino = os.path.expanduser("~/hormigasais-docs/sdk.html")

html = """<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HormigasAIS — SDK LBH v2.0</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@700;800&display=swap" rel="stylesheet">
  <style>
    * { box-sizing: border-box; }
    body { background: #0a0a0a; margin: 0; padding: 0; font-family: 'Space Mono', monospace; color: #e8e8e8; }
    .wrapper { max-width: 800px; margin: 0 auto; padding: 3rem 1.5rem; }

    /* Header */
    .sdk-header { margin-bottom: 2rem; }
    .sdk-title { font-family: 'Syne', sans-serif; font-weight: 800; color: #f5c518; font-size: 1.4rem; margin-bottom: 0.5rem; }
    .sdk-subtitle { font-size: 0.78rem; color: #555; letter-spacing: 0.03em; }

    /* Tarjetas */
    .cards-grid { display: grid; grid-template-columns: 1fr; gap: 1.2rem; margin-bottom: 2rem; }
    .card { background: #111; border: 1px solid #222; border-radius: 12px; padding: 1.8rem; }
    .card:hover { border-color: #333; }
    .card-icon { font-size: 1.4rem; margin-bottom: 0.6rem; }
    .card-title { font-family: 'Syne', sans-serif; font-weight: 700; font-size: 1rem; color: #fff; margin-bottom: 0.4rem; }
    .card-badge { display: inline-block; font-size: 0.65rem; color: #00ff9f; border: 1px solid #00ff9f33; border-radius: 4px; padding: 0.15rem 0.5rem; margin-bottom: 0.8rem; }
    .card-desc { font-size: 0.8rem; color: #888; line-height: 1.7; margin-bottom: 1.2rem; }

    /* Bloque de código */
    .code-block { background: #0a0a0a; border: 1px solid #222; border-radius: 6px; padding: 0.7rem 1rem; font-family: 'Space Mono', monospace; font-size: 0.8rem; color: #f5c518; margin-bottom: 1rem; letter-spacing: 0.02em; user-select: all; }

    /* Botones */
    .btn-primary { display: inline-block; background: rgba(245,197,24,0.08); border: 1px solid #f5c518; color: #f5c518; padding: 0.5rem 1rem; border-radius: 6px; font-family: inherit; font-size: 0.78rem; text-decoration: none; margin-right: 0.6rem; margin-bottom: 0.4rem; }
    .btn-primary:hover { background: #f5c518; color: #0a0a0a; }
    .btn-secondary { display: inline-block; background: transparent; border: 1px solid #333; color: #888; padding: 0.5rem 1rem; border-radius: 6px; font-family: inherit; font-size: 0.78rem; text-decoration: none; margin-bottom: 0.4rem; }
    .btn-secondary:hover { border-color: #555; color: #aaa; }

    /* Tabla de compatibilidad */
    .compat-section { margin-bottom: 2rem; }
    .compat-title { font-family: 'Syne', sans-serif; font-weight: 700; font-size: 0.9rem; color: #fff; margin-bottom: 1rem; }
    .compat-table { width: 100%; border-collapse: collapse; font-size: 0.78rem; }
    .compat-table th { text-align: left; color: #555; font-weight: 400; border-bottom: 1px solid #222; padding: 0.5rem 0.8rem; }
    .compat-table td { color: #aaa; border-bottom: 1px solid #1a1a1a; padding: 0.6rem 0.8rem; }
    .compat-table td:first-child { color: #e8e8e8; font-family: 'Space Mono', monospace; }
    .ok { color: #00ff9f; }

    /* Footer */
    .badge-signature { font-size: 0.7rem; color: #555; margin-top: 2rem; border-top: 1px solid #222; padding-top: 1rem; text-align: right; line-height: 1.8; }
    .badge-signature a { color: #555; text-decoration: none; }
    .badge-signature a:hover { color: #888; }
  </style>
</head>
<body>

<div class="wrapper">

  <!-- Header -->
  <div class="sdk-header">
    <div class="sdk-title">🐜 HormigasAIS SDK Ecosystem</div>
    <div class="sdk-subtitle">Protocolo LBH v2.0 — Implementaciones oficiales</div>
  </div>

  <!-- Tarjetas -->
  <div class="cards-grid">

    <!-- Tarjeta 1: Especificación -->
    <div class="card">
      <div class="card-icon">📜</div>
      <div class="card-title">LBH_SPEC_v2.0</div>
      <span class="card-badge">ESPECIFICACIÓN FORMAL</span>
      <div class="card-desc">
        Define la estructura binaria del protocolo LBH, TYPE_CODEs oficiales,
        reglas de validación de paquetes y el modelo de seguridad HMAC-SHA256.
        Documento de referencia para todas las implementaciones del SDK.
      </div>
      <a href="https://github.com/Thrumanshow/Lenguaje-Binario-HormigasAIS-" target="_blank" rel="noopener noreferrer" class="btn-primary">
        📖 Ver especificación
      </a>
    </div>

    <!-- Tarjeta 2: SDK Python -->
    <div class="card">
      <div class="card-icon">🐍</div>
      <div class="card-title">lbh-sdk — Python</div>
      <span class="card-badge">v0.3.0</span>
      <div class="card-desc">
        Librería oficial Python para codificar, decodificar, validar y firmar
        paquetes LBH. Sin dependencias externas. Compatible con Python 3.6+.
        Validada con 16 tests de conformidad contra LBH_SPEC_v2.0.
      </div>
      <div class="code-block">pip install lbh-sdk</div>
      <a href="https://pypi.org/project/lbh-sdk/" target="_blank" rel="noopener noreferrer" class="btn-primary">
        📦 PyPI
      </a>
      <a href="https://github.com/Thrumanshow/lbh-sdk" target="_blank" rel="noopener noreferrer" class="btn-secondary">
        🐙 GitHub
      </a>
    </div>

    <!-- Tarjeta 3: SDK JavaScript -->
    <div class="card">
      <div class="card-icon">⬡</div>
      <div class="card-title">lbh-sdk-hormigasais — JavaScript</div>
      <span class="card-badge">v0.3.0</span>
      <div class="card-desc">
        Implementación oficial Node.js/JavaScript del protocolo LBH.
        Sin dependencias externas — solo stdlib de Node.js.
        Validada con 25 tests de conformidad contra LBH_SPEC_v2.0.
      </div>
      <div class="code-block">npm install lbh-sdk-hormigasais</div>
      <a href="https://www.npmjs.com/package/lbh-sdk-hormigasais" target="_blank" rel="noopener noreferrer" class="btn-primary">
        📦 npm
      </a>
      <a href="https://github.com/Thrumanshow/lbh-sdk-js" target="_blank" rel="noopener noreferrer" class="btn-secondary">
        🐙 GitHub
      </a>
    </div>

  </div>

  <!-- Tabla de compatibilidad -->
  <div class="compat-section">
    <div class="compat-title">Compatibilidad</div>
    <table class="compat-table">
      <thead>
        <tr>
          <th>SDK</th>
          <th>Especificación</th>
          <th>Lenguaje</th>
          <th>Tests</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>lbh-sdk</td>
          <td>LBH_SPEC_v2.0</td>
          <td>Python 3.6+</td>
          <td><span class="ok">16/16 ✅</span></td>
        </tr>
        <tr>
          <td>lbh-sdk-hormigasais</td>
          <td>LBH_SPEC_v2.0</td>
          <td>Node.js 14+</td>
          <td><span class="ok">25/25 ✅</span></td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Footer -->
  <div class="badge-signature">
    CERT::LBH-SDK-V2-CLHQ | DOI: 10.5281/zenodo.19177759 | Nodo A16-SanMiguel-SV<br>
    <a href="https://hormigasais.com">hormigasais.com</a> |
    <a href="/legal.html">⚖️ Legal</a>
  </div>

</div>
</body>
</html>"""

with open(destino, "w", encoding="utf-8") as f:
    f.write(html)

# Verificación de integridad básica
with open(destino, "r", encoding="utf-8") as f:
    lineas = f.readlines()

print(f"✅ sdk.html creado en {destino}")
print(f"   Líneas: {len(lineas)}")

if len(lineas) < 100:
    raise SystemExit(f"ERROR: archivo demasiado corto ({len(lineas)} líneas). Revisar.")

print("✅ Verificación de integridad OK")
PYEOF

EXIT_PY=$?
if [ $EXIT_PY -ne 0 ]; then
  echo "❌ Falló la creación del archivo. Abortando."
  exit 1
fi

# Commit y push
echo ""
echo "🚀 Haciendo commit y push..."
cd "$HOME/hormigasais-docs"

source "$HOME/.hormigas_secrets" 2>/dev/null || true

git add sdk.html
git commit -m "📖 FEAT: sdk.html — página unificada del ecosistema LBH SDK (Spec + Python + JavaScript)"

# Push utilizando el token cargado de .hormigas_secrets
git push "https://${HORMIGAS_TOKEN}@github.com/Thrumanshow/hormigasais-docs.git" main

EXIT_PUSH=$?
if [ $EXIT_PUSH -ne 0 ]; then
  echo "❌ Push falló. Verifica que HORMIGAS_TOKEN sea válido y tenga permisos."
  exit 1
fi

# Verificación en producción
echo ""
echo "🔍 Verificando en producción..."
sleep 15

STATUS=$(curl -sI https://docs.hormigasais.com/sdk.html -w '%{http_code}' -o /dev/null --max-time 10 2>/dev/null)
echo "   HTTP status: $STATUS"

if [ "$STATUS" = "200" ]; then
  echo "✅ docs.hormigasais.com/sdk.html está en vivo"
else
  echo "⚠️  HTTP $STATUS — el deploy puede estar en progreso (espera 1-2 min y verifica en el navegador)"
fi

echo ""
echo "------------------------------------------------------------"
echo "✅ sdk.html desplegado"
echo "   URL: https://docs.hormigasais.com/sdk.html"
echo "------------------------------------------------------------"

