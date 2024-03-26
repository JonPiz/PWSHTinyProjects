param(
    [Parameter(Mandatory=$true)]
    $number
)
$finalNumber = New-Object -TypeName 'System.Text.StringBuilder'

foreach ($num in $number.ToCharArray())
{
    switch ($num)
    {
        0 { [void]$finalNumber.Append('5') }
        5 { [void]$finalNumber.Append('0') }
        {$num -match '^[0-9]$'} { [void]$finalNumber.Append($num) }
        Default { [void]$finalNumber.Append("$(10-[int]$num)") }
    }
}

$finalNumber.ToString()