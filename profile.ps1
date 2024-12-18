
<#
#Run all of our code, clear screen and begin!
#Set-Alias ConnectTo-SharePointAdmin ConnectTo-SharePointAdmin.ps1
#Set-Alias ConnectTo-EXO ConnectTo-EXO.ps1
#Set-Alias Get-MFAStatus MFAStatus.ps1
#Set-Alias Get-MailboxSizeReport MailboxSizeReport.ps1
#Set-Alias Get-OneDriveSizeReport OneDriveSizeReport.ps1
#Set-Alias im Import-Module
#Set-Alias tn Test-NetConnection
#>

# Set Environment variable
#$Env:Temp = "C:\Temp"
# Append
#$Env:PATH += ";C:\Scripts"

$ErrorActionPreference = "SilentlyContinue"
    #Source Write-Color to use inside our Profile
. C:\Users\danie\OneDrive\Desktop\Scripts\Write-Color.ps1
$USERNAME=$(Get-LocalUser -Name $env:USERNAME).Description
Function Prompt {
    $shell = $Host.UI.RawUI
    $shell.WindowTitle= "Daniels Powershell"
    $shell.BackgroundColor = "Black"
    $shell.ForegroundColor = "White"

    $principal = [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    $prefix = $(if ($principal.IsInRole($adminRole)) { "[ADMIN]:\" } else { "[$USERNAME]:\" })
    $body = "/:[$(Get-Date -Format 'HH:mm:ss')]" + "[$(Get-Location)]:\"
    $suffix = $(if ($NestedPromptLevel -ge 1) { '>>' }) + '/:> '
    Write-Color -Text $prefix,$body,$suffix -Color DarkRed,Green,Yellow -NoNewLine
}

$PSDefaultParameterValues = @{
    'Get-ChildItem:Force' = $true
}

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-Location C:\Users\danie\OneDrive\
#Clear screen and begin
Clear-Host

Write-Host "Welcome to $USERNAME's Powershell!"
Write-Host ""