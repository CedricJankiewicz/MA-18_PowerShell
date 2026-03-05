$username = "Admin"
$password = "password"
$cred = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force))

$sess = New-PSSession -ComputerName PCMA18CLIENT -Credential $cred

# Copy ZIP
Copy-Item -Path "DesktopGoose v0.3.zip" -Destination "C:\Users\Admin\Documents" -ToSession $sess

# Extract ZIP
Invoke-Command -Session $sess -ScriptBlock {
    Expand-Archive -Path "C:\Users\Admin\Documents\DesktopGoose v0.3.zip" `
                   -DestinationPath "C:\Users\Admin\Documents" -Force
}

# Path to PsExec on your local machine
$PsExec = "PsExec.exe"

# Launch Desktop Goose GUI on remote PC
Start-Process -FilePath $PsExec -ArgumentList '\\PCMA18CLIENT -u Admin -p password -i 1 "C:\Users\Admin\Documents\DesktopGoose v0.3\GooseDesktop.exe"'
