<#

Author:            Jonathan Pizzano
Email:             jpizzanotech@outlook.com

Blog:              Soon!
GitHub:            https://github.com/MochaTheBear

LinkedIn:          https://www.linkedin.com/in/jonathan-pwsh/

#>
param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [string[]] $items,
    [switch] $sorted
)
$numberOfItems = $items.Length
$templateString = New-Object -TypeName 'System.Text.StringBuilder' -ArgumentList "You are bringing "

# $numberOfItems cannot be less than 1 because of the Mandatory parameter
Switch ($numberOfItems){
    1 { $templateString.Append("{0}.") }
    2 { $templateString.Append("{0} and {1}.") }
    Default { 
    $finalPlace = $numberOfItems - 1
    for ($i = 0; $i -lt $finalPlace; $i++ ) { $templateString.Append("{$i}, ") }
    $templateString.Append("and {$finalPlace}.") 
    }
}

if ($sorted) {
    $items = $items | Sort-Object
}

$templateString.ToString() -f $items