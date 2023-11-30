

$currentTime = Get-Date
$hour = $currentTime.Hour

if ($hour -ge 5 -and $hour -lt 12) {
    $timeOfDay = "morning"
}
elseif ($hour -ge 12 -and $hour -lt 18) {
    $timeOfDay = "afternoon"
}
else {
    $timeOfDay = "evening"
}

$greetings = @("sir", "Bob", "Mr. Smith")
$random_greeting = Get-Random -InputObject $greetings

Write-Host " "
Write-Host "Good $timeOfDay, $random_greeting." -ForegroundColor Red
Write-Host "Everything should be setup to your liking." -ForegroundColor Gray
Write-Host ""
Write-Host "Checking to see if PIP needs to be updated ..."

# Load scripts from the following locations
$env:Path += ";C:\src\powershell\scripts"
$env:Path += ";C:\Python"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Automation Specific Commands
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# -- -- -- HR Import - Daily
Invoke-Sqlcmd -ServerInstance "server.example.com" -Database "PowerHCM" -Query "SELECT max([extract_date]) AS [Latest Run Date] FROM [dbo].[RPT_OIT_ALLPositionReport_RAW]" -TrustServerCertificate

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Python Alias Commands
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# GoTo Python Src Folder
function gotopython-src {
    Set-Location C:\Users\vhaisadenkea\src\python
}

Set-Alias -Value gotopython-src -Name :py-src
#Set-Alias -Name :py-src  gotopython-src

# GoTo Python Projects Folder
function gotopython-projects {
    Set-Location C:\Users\vhaisadenkea\src\python\projects
}

Set-Alias -Name :py-projects -Value gotopython-projects



# Connect to B in a Remote PowerShell Session
function connectToA {
    Enter-PSSession OITORLSQL1A.r03.med.va.gov
}

Set-Alias -Name :conn-a -Value connectToA


# Connect to B in a Remote PowerShell Session
function connectToB {
    Enter-PSSession OITORLSQL1B.r03.med.va.gov
}

Set-Alias -Name conn-b -Value connectToB


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Reboot Remote Machines
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# reboot A
function reboot-a {
    Restart-Computer -ComputerName OITORLSQL1A.r03.med.va.gov -Force
}

Set-Alias -Name :reboot-a -Value reboot-a

# reboot B
function reboot-b {
    Restart-Computer -ComputerName OITORLSQL1B.r03.med.va.gov -Force
}


Set-Alias -Name :reboot-b -Value reboot-b


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# fz Commands for PMD
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# function: find-user
function find-user {
    script = "C:\Users\vhaisadenkea\src\powershell\fzPMD.ps1"
}

Set-Alias -Name :fz -Value find-user


function get-admin {
    Start-Process PowerShell -Verb runas 
}

Set-Alias -Name :get-admin -Value get-admin


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Python VENV
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function activate-venv {
    venv/Scripts/activate.ps1
}

Set-Alias -Name :start-venv -Value activate-venv


#cd ~/bin
#$pyenvDir = "$env:USERPROFILE\.pyenv"
#git clone https://github.com/pyenv-win/pyenv-win.git $pyenvDir
#$env:Path = "$pyenvDir\bin;$pyenvDir\shims;$env:Path"
#$env:PYENV = $pyenvDir
#$null = [Environment]::SetEnvironmentVariable('Path', $env:Path, [EnvironmentVariableTarget]::Process)

function MyFunction {
    Write-Host "My Function seems to work just fine"
}

#Import-Module PSReadLine

python -m pip install --upgrade pip

cd C:\dragonfruit
