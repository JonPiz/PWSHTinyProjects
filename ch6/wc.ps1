<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>

param (
    [Parameter(ValueFromPipeline = $true)]
    $inputText
)

$totalChars = 0
$totalWords = 0
$totalLines = 0

$isFile = Test-Path $inputText
$textData = @()

if ($isFile)
{
    $textData += Get-ChildItem $inputText
}
else
{
    $textData += $inputText
}

foreach ($data in $textData)
{
    $characterCount = 0
    $wordCount = 0
    $lineCount = 0
    $location = 0
    $content = 0

    if ($isFile)
    {
        $content = Get-Content $data
        $location = Resolve-Path -Path $data -Relative
    }
    else
    {
        $content = $data
        $location = '<stdin>'
    }
    $lineCount = $content.Split("`n").Count
    $wordCount = ([regex]::Split($content, "\W+") | Where-Object {$_}).Count
    $characterCount = ($content -join ' ').Length
    
    $totalChars += $characterCount
    $totalWords += $wordCount
    $totalLines += $lineCount

    Write-Output ("$lineCount".PadLeft(8) + "$wordCount".PadLeft(8) + "$characterCount".PadLeft(8) + " $location".PadLeft(1))
}
if ($textData.Count -gt 1)
{
    Write-Output ("$totalLines".PadLeft(8) + "$totalWords".PadLeft(8) + "$totalChars".PadLeft(8) + " total".PadLeft(1))
}