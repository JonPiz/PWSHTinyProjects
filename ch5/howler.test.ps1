Describe "Tests for howler.ps1"{
    BeforeAll {
        $script:program = "$PSScriptRoot\howler.ps1"
    }

    It "Does the file exist?"{
        Test-Path $program | Should -Be $true
    }

    It "does the script work with text input?"{
        $text = "The quick brown fox jumps over the lazy dog."
        $output = Invoke-Expression "$program $text"
        $output | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }

    It "does the script work with file input?"{
        $text = "$PSScriptRoot\fox.txt"
        $output = Invoke-Expression "$program $text"
        $output | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }
}