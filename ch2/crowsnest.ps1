<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>
param(
    [string]$spottedObject = "thing"
)
$vowels = New-Object -TypeName 'System.Collections.Generic.HashSet[char]'
'aeiou'.ToCharArray() | ForEach-Object { $vowels.Add($_) | Out-Null }

$firstLetter = $spottedObject[0].ToString().ToLower()

if ($vowels.Contains($firstLetter)){
    $spottedObject = "an $spottedObject"
}
else {
    $spottedObject = "a $spottedObject"
}

Write-Output "Ahoy, I see $spottedObject off the larboard bow!"