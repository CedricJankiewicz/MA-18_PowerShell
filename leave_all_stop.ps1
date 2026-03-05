$apps = Get-Process | Where-Object { $_.MainWindowHandle -ne 0 }

foreach ($app in $apps) {
    try {
        $app.CloseMainWindow() | Out-Null  # essaie de fermer proprement
        Start-Sleep -Milliseconds 500     # petit délai
        if (!$app.HasExited) {
            $app.Kill()                   # force la fermeture si nécessaire
        }
    } catch {
        Write-Host "Impossible de fermer $($app.Name)"
    }
}

Objectif 4: eteindre
# Éteindre le PC
Stop-Computer -Force