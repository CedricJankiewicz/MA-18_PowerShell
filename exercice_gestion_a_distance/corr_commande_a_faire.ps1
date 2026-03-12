#Machine a:
Set-ExecutionPolicy Bypass -Force

#Machine a + b(client):
winrm quickconfig
Set-Item WSMan:\localhost\Client\TrustedHosts -Value * # ou le nom du pc
Enable-PSRemoting -Force

#Configuration réseau: privé
#Pare-feu: désactivé