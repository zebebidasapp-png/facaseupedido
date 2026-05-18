# 🚀 HOSPEDAR CATÁLOGO ZÉ BEBIDAS - GUIA DEFINITIVO

## ⚡ OPÇÃO MAIS RÁPIDA (2 minutos): Netlify Drop

1. Acesse: **https://app.netlify.com/drop**
2. Arraste a pasta `criar-catalago-onlina-com` inteira para o site
3. Pronto! Seu catálogo estará online em segundos!
4. O link será algo como: `https://zebebidas-123456.netlify.app`

---

## 📋 OPÇÃO 2: GitHub Pages (Guia Visual)

### Passo 1: Criar Token de Acesso
1. Acesse: https://github.com/settings/tokens
2. Clique em **"Generate new token (classic)"**
3. Nome: `CatalogoDeploy`
4. Expiração: **No expiration**
5. Marque a caixa: **✅ repo** (acesso total ao repositório)
6. Clique em **"Generate token"**
7. **Copie o token** (só aparece uma vez!)

### Passo 2: Configurar no computador
Abra o PowerShell e execute:
```powershell
cd "C:\Users\paulo\.verdent\verdent-projects\criar-catalago-onlina-com"
git remote set-url origin https://ccepaulinho-ai:SEU_TOKEN_AQUI@github.com/ccepaulinho-ai/catalogoze.git
git push origin main
```

### Passo 3: Ativar GitHub Pages
1. Acesse: https://github.com/ccepaulinho-ai/catalogoze/settings/pages
2. Em "Source", selecione: **"GitHub Actions"**
3. Pronto! O deploy será automático!

### Link Final:
```
https://ccepaulinho-ai.github.io/catalogoze/catalogo.html
```

---

## 📁 ARQUIVOS PARA UPLOAD

Os arquivos estão em:
```
C:\Users\paulo\.verdent\verdent-projects\criar-catalago-onlina-com\
```

Arquivos necessários:
- `catalogo.html` (principal)
- `manifest.json`
- `sw.js`
- `ze-bebidas-bg.jpg`
- `index.html` (página inicial)

---

## 🔧 ALTERNATIVA: Vercel (Gratuito)

1. Acesse: https://vercel.com
2. Clique em "Add New Project"
3. Importe do GitHub ou faça upload
4. Pronto!

---

## 📞 SUPORTE

Se tiver dificuldades, o catálogo funciona perfeitamente **localmente**:
- Abra o arquivo `catalogo.html` no navegador
- Ou use a página `index.html` como portal

---

**Zé Bebidas - Catálogo Online v1.0**
