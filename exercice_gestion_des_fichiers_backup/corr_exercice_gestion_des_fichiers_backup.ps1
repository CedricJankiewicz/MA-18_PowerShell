$source = "src"
$destination = "bkp"

#get data and make folder
$date = Get-Date -Format "yyyy-MM-dd"
$backupFolder = Join-Path $destination $date

# create today folder if not exist
if (!(Test-Path $backupFolder)) {
    New-Item -ItemType Directory -Path $backupFolder
}

# incremential save
robocopy $source $backupFolder /MIR /XO /FFT /Z /R:3 /W:5