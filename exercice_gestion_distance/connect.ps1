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

