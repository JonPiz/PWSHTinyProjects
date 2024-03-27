<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>

param(
    $inputText,
    [Parameter(ValueFromRemainingArguments = $false)]
    $outFile
)

if (Test-Path [string]$inputText)
{
    $inputText = (Get-Content -Raw [string]$inputText).ToUpper()
}
else
{
    $inputText = [string]$inputText.ToUpper()
}

if ($outFile)
{
    $inputText | Out-File -FilePath $outFile 
}
else
{
    Write-Output $inputText
}