<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>

$userInput = Read-Host "Who would you like to greet? `n"

if ([string]::IsNullOrWhiteSpace($userInput))
{
    Write-Host "Hello, World!"
}
else
{
    Write-Host "Hello, $userInput"
}