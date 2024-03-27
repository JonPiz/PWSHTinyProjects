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
}

Write-Output "File Count: $($textData.Count)"
Write-Output (Get-Content $textData[0])
Write-Output (Resolve-Path -Path $textData[0] -Relative)

<#
if (Test-Path $inputText)
{
    foreach ($text in Get-Content $inputText)
    {
        Write-Output $text
        Write-Output $text.Length
        Write-Output $text.Count
    }
    Write-Output $inputText
    Write-Output $inputText.Length
    Write-Output $inputText.Count
}
function Get-WordCount
{
    param (
        [string]$inputText
    )
    $wordCount = $inputText.Split(" ").Count
    Write-Output $wordCount
} #>