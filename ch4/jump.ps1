param(
    [Parameter(Mandatory=$true)]
    [string]$inputText
)
$finalNumber = New-Object -TypeName 'System.Text.StringBuilder'

foreach ($num in $inputText.ToCharArray())
{
    switch ($num)
    {
        0 { [void]$finalNumber.Append('5') }
        5 { [void]$finalNumber.Append('0') }
        {$num -match '[^0-9]'} { [void]$finalNumber.Append($num) }
        Default { [void]$finalNumber.Append($(58 - [int]$num)) } # 58 is the 1 + ASCII 9
    }
}

$finalNumber.ToString()