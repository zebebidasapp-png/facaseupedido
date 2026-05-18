@echo off
chcp 65001 > nul
echo ============================================
echo    DEPLOY ZE BEBIDAS - GitHub Pages
echo ============================================
echo.
echo PASSO 1: Verificando GitHub CLI...
gh --version > nul 2>&1
if %errorlevel% neq 0 (
    echo GitHub CLI nao encontrado.
    echo Baixando e instalando automaticamente...
    powershell -ExecutionPolicy Bypass -File "%~dp0Instalar_GH_CLI.ps1"
    goto :fim
)

echo PASSO 2: Verificando autenticacao...
gh auth status > nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Voce precisa fazer login no GitHub.
    echo Execute: gh auth login
    echo Depois escolha: HTTPS -> Y -> Login com browser
    echo.
    gh auth login
)

echo.
echo PASSO 3: Fazendo push dos arquivos...
cd /d "%~dp0"
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo ERRO no push. Tentando configurar remote...
    git remote set-url origin https://github.com/ccepaulinho-ai/catalogoze.git
    git push origin main
)

echo.
echo PASSO 4: Ativando GitHub Pages...
gh api repos/ccepaulinho-ai/catalogoze/pages --method POST --input - <<EOF
{"source":{"branch":"main","path":"/"}}
EOF

echo.
echo ============================================
echo    DEPLOY CONCLUIDO!
echo ============================================
echo.
echo Seu catalogo estara disponivel em:
echo https://ccepaulinho-ai.github.io/catalogoze/catalogo.html
echo.
echo Aguarde 2-3 minutos para o GitHub processar.
echo.
:fim
pause
