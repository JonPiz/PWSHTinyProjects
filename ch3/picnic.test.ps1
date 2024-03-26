Describe "Tests for the picnic practice (ch3)"{
    BeforeAll{
        $script:program = "$PSScriptRoot\picnic.ps1"
    }

    It "Does Program exist?"{
        Test-Path $program | Should -Be $true
    }

    It "Does one item work?"{
        $actual = &$program "apples"
        $expected = "You are bringing apples."
        $actual | Should -BeExactly $expected
    }
}