$computerName = 'PCMA18CLIENT'
$username = 'Admin'
$password = 'password'
$cred = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force))

# stop the computer
Stop-Computer -ComputerName $computerName -Credential $cred -force
