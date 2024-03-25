Describe "Test for Hello World (Ch1)"{
    BeforeAll{
        $script:program = "$PSScriptRoot\Hello.ps1"
    }
    
    It "Does Program exist?"{
        Test-Path $program | Should -Be $true
    }

    It "Does Base Case work?"{
        &$program | Should -BeExactly "Hello, World!"
    }

    It "Does Input for the Name parameter work?"{
        foreach ($val in 'Jonathan', 'Pizzano'){
            foreach ($option in '-name', '-n'){
                $cmd = "$program $option $val"
                Invoke-Expression $cmd | Should -BeExactly "Hello, $val!"
            }
        }
    }
}