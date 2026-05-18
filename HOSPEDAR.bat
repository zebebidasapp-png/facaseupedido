@echo off
chcp 65001 > nul
echo ==========================================
echo   HOSPEDAR ZE BEBIDAS - GitHub Pages
echo ==========================================
echo.
echo Este script vai hospedar seu catalogo online.
echo.
echo PASSO 1: Baixe e instale o GitHub CLI
echo          https://cli.github.com/
echo.
echo PASSO 2: Execute no terminal:
echo          gh auth login
echo.
echo PASSO 3: Depois de logado, execute:
echo          gh repo create catalogoze --public --source=. --push
echo.
echo PASSO 4: Ative o GitHub Pages:
echo          gh api repos/ccepaulinho-ai/catalogoze/pages \
echo            --method POST \
echo            --input - <<EOF
echo          {"source":{"branch":"main","path":"/"}}
echo          EOF
echo.
echo ==========================================
echo   LINK FINAL:
echo   https://ccepaulinho-ai.github.io/catalogoze/catalogo.html
echo ==========================================
echo.
pause
