# Instalar GitHub CLI
$progressPreference = 'silentlyContinue'
Write-Host "Baixando GitHub CLI..."
Invoke-WebRequest -Uri https://github.com/cli/cli/releases/download/v2.42.1/gh_2.42.1_windows_amd64.msi -OutFile "$env:TEMP\gh-cli.msi"
Write-Host "Instalando..."
Start-Process msiexec.exe -ArgumentList "/i", "$env:TEMP\gh-cli.msi", "/quiet", "/norestart" -Wait
Write-Host "GitHub CLI instalado!"
Write-Host ""
Write-Host "AGORA EXECUTE ESTES COMANDOS NO TERMINAL:"
Write-Host "1. gh auth login"
Write-Host "2. Escolha: HTTPS -> Y (sim) -> Login com browser"
Write-Host "3. cd C:\Users\paulo\.verdent\verdent-projects\criar-catalago-onlina-com"
Write-Host "4. git push origin main"
Write-Host "5. gh api repos/ccepaulinho-ai/catalogoze/pages --method POST --input - <<EOF"
Write-Host '{"source":{"branch":"main","path":"/"}}'
Write-Host "EOF"
Write-Host ""
Write-Host "Pronto! Seu catalogo estara online em:"
Write-Host "https://ccepaulinho-ai.github.io/catalogoze/catalogo.html"
pause
