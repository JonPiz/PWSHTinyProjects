<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>

param(
    [Parameter(Position=0, ValueFromRemainingArguments=$true)]
    [string[]]$inputText,
    [Parameter()]
    $outFile
)

$inputText = $inputText -join ' '

if (Test-Path $inputText)
{
    $inputText = (Get-Content -Raw $inputText).ToUpper()
}
else
{
    $inputText = $inputText.ToUpper()
}

if ($outFile)
{
    $inputText | Out-File -FilePath $outFile -NoNewline
}
else
{
    Write-Output $inputText
}