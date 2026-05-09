(function() {
  const API = 'https://api.hormigasais.com';
  const widgets = document.querySelectorAll('#lbh-widget, [data-lbh-widget]');

  widgets.forEach(async function(el) {
    const sig   = el.getAttribute('data-sig') || '';
    const theme = el.getAttribute('data-theme') || 'dark';
    const lang  = el.getAttribute('data-lang') || 'es';
    const compact = el.getAttribute('data-compact') === 'true';

    const bg     = theme === 'dark' ? '#1a1a1a' : '#ffffff';
    const border = theme === 'dark' ? '#2a2a2a' : '#e0e0e0';
    const color  = theme === 'dark' ? '#e8e8e8' : '#1a1a1a';
    const sub    = theme === 'dark' ? '#888' : '#666';

    el.innerHTML = '<div style="background:' + bg + ';border:1px solid ' + border + ';border-radius:8px;padding:' + (compact?'0.7rem':'1rem') + ';font-family:monospace;font-size:0.75rem;color:' + color + ';display:inline-block;min-width:' + (compact?'200px':'280px') + ';">' +
      '<div style="color:#f5c518;font-weight:700;margin-bottom:0.4rem;">🐜 Certificado LBH</div>' +
      '<div style="color:#555;" id="lbh-loading-' + sig + '">' + (lang==='es'?'Verificando...':'Verifying...') + '</div>' +
      '</div>';

    try {
      const endpoint = sig ? API + '/seal/' + sig : API + '/verify';
      const r = await fetch(endpoint);
      const d = await r.json();
      const sello = d.sello || d;
      const ok = d.status === 'VERIFICADO' || d.status === 'VALIDADO';

      el.innerHTML = '<div style="background:' + bg + ';border:1px solid ' + (ok?'rgba(0,255,159,0.3)':border) + ';border-radius:8px;padding:' + (compact?'0.7rem':'1rem') + ';font-family:monospace;font-size:0.75rem;color:' + color + ';display:inline-block;min-width:' + (compact?'200px':'280px') + ';">' +
        '<div style="color:#f5c518;font-weight:700;margin-bottom:0.4rem;">🐜 ' + (lang==='es'?'Certificado LBH':'LBH Certificate') + '</div>' +
        '<div style="color:' + (ok?'#00ff9f':'#ff4444') + ';margin-bottom:0.3rem;">' + (ok ? (lang==='es'?'✅ AUTÉNTICO':'✅ AUTHENTIC') : (lang==='es'?'❌ NO ENCONTRADO':'❌ NOT FOUND')) + '</div>' +
        (sello.signature ? '<div style="color:#00ff9f;margin-bottom:0.2rem;">' + sello.signature + '</div>' : '') +
        (sello.owner ? '<div style="color:' + sub + ';font-size:0.7rem;">' + (lang==='es'?'Propietario: ':'Owner: ') + sello.owner + '</div>' : '') +
        '<div style="margin-top:0.5rem;font-size:0.65rem;color:#444;border-top:1px solid ' + border + ';padding-top:0.4rem;">' +
        '<a href="https://hormigasais.com" target="_blank" style="color:#f5c518;text-decoration:none;">hormigasais.com</a></div>' +
        '</div>';
    } catch(e) {
      el.innerHTML = '<div style="background:' + bg + ';border:1px solid #ff444433;border-radius:8px;padding:0.7rem;font-family:monospace;font-size:0.75rem;color:#ff4444;">⚠️ Error de conexión LBH</div>';
    }
  });
})();
