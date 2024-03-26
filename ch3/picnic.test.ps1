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

    It "Do two items work?"{
        $actual = &$program "apples" "bananas"
        $expected = "You are bringing apples and bananas."
        $actual | Should -BeExactly $expected
    }
    
    It "Do three items work?"{
        $actual = &$program "apples" "bananas" "coconuts"
        $expected = "You are bringing apples, bananas, and coconuts."
        $actual | Should -BeExactly $expected
    }
    
    It "Does sorting two items work?"{
        $actual = &$program "bananas" "apples" -sorted
        $expected = "You are bringing apples and bananas."
        $actual | Should -BeExactly $expected
    }

    It "Does sorting three items work?"{
        $actual = &$program "coconuts" "apples" "bananas" -sorted
        $expected = "You are bringing apples, bananas, and coconuts."
        $actual | Should -BeExactly $expected
    }
}