Describe "Tests for howler.ps1"{
    BeforeAll {
        $script:program = "$PSScriptRoot\howler.ps1"
        $script:text = "The quick brown fox jumps over the lazy dog."
        $script:inputFile = "$PSScriptRoot\fox.txt"
        $script:outputFile = "$PSScriptRoot\fox_out.txt"
    }

    It "Does the file exist?"{
        Test-Path $program | Should -Be $true
    }

    It "does the script work with text input?"{
        $output = Invoke-Expression "$program $text"
        $output | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }

    It "does the script work with file input?"{
        $output = Invoke-Expression "$program $inputFile"
        $output | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }

    It "Does the script work with file output?"{
        Invoke-Expression "$program $text -outFile $outputFile"
        (Get-Content -Raw $outputFile) | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }

    It "Does the script work with file input and output?"{
        Invoke-Expression "$program $inputFile -outFile $outputFile"
        (Get-Content -Raw $outputFile) | Should -BeExactly "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
    }
}