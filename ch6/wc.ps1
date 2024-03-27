<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>


param (
    $inputText
)

$inputText = $inputText -join ' '

$lineCount = 0
$wordCount = 0
$charCount = 0

$lines = $inputText -split "`r`n"


$lineCount = $lines.Count

foreach ($line in $lines) {
    $words = $line -split '\s+'
    $wordCount += $words.Count

    $charCount += $line.Length
}

Write-Output "Lines: $lineCount"
Write-Output "Words: $wordCount"
Write-Output "Characters: $charCount"