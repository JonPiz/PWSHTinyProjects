$userInput = Read-Host "Who would you like to greet? `n"

if ([string]::IsNullOrWhiteSpace($userInput))
{
    Write-Host "Hello, World!"
}
else
{
    Write-Host "Hello, $userInput"
}