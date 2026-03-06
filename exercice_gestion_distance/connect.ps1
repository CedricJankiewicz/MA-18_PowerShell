$computerName = 'PCMA18CLIENT'
$username = 'Admin'
$password = 'password'
$cred = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force))

$sess = New-PSSession -ComputerName $computerName -Credential $cred

$basePath = "C:\Users\$username\Documents"
$zipPath = "$basePath\DesktopGoose v0.3.zip"
$runPath = "$basePath\DesktopGoose v0.3\GooseDesktop.exe"

# Copy ZIP
Copy-Item -Path "DesktopGoose v0.3.zip" -Destination $basePath -ToSession $sess

# Extract ZIP
Invoke-Command -Session $sess -ArgumentList $zipPath,$basePath -ScriptBlock {
    param($zip, $dest)
    try {
        Expand-Archive -Path $zip -DestinationPath $dest -Force
    }
    catch {
        Write-Host "Error Type: $($_.Exception.GetType().Name)"
        Write-Host "Message: $($_.Exception.Message)"
    }
}

# Path to PsExec on your local machine
$PsExec = "PsExec.exe"

# Launch Desktop Goose GUI on remote PC
Start-Process -FilePath $PsExec -ArgumentList "\\$computerName -u $username -p $password -i 1 `"$runPath`""
