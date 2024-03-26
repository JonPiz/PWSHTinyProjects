Describe "Test for Jump The Five (ch4)"{
    BeforeAll {
        $script:program = "$PSScriptRoot\jump.ps1"
    }

    It "Does the program exist"{
        Test-Path $script:program | Should -Be $True
    }

    It "Only number test"{
        &$script:program -input 123-456-7890 | Should -BeExactly "987-604-3215"
    }

    It "Numbers and words test"{
        &$script:program -input 'That number to call is 098-765-4321.' | Should -BeExactly 'That number to call is 512-340-6789.'
    }
}