<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>

$text = [string]$args

if (Test-Path $text)
{
    $text = (Get-Content $text).ToUpper()
}
else
{
    $text = $text.ToUpper()
}

Write-Output $text