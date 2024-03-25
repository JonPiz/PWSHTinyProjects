Describe "Test for pirate program (Ch2)"{
    BeforeAll{
        $script:program = "$PSScriptRoot\crowsnest.ps1"
    }
    
    It "Does Program exist?"{
        Test-Path $program | Should -Be $true
    }

    It "Does Base Case work?"{
        &$program | Should -BeExactly "Ahoy, I see a thing off the larboard bow!"
    }

    It "Does Input with a consonant work for the spottedObject parameter work?"{
        foreach ($option in '-s', '-spottedObject'){
            $cmd = "$program $option kraken"
            Invoke-Expression $cmd | Should -BeExactly "Ahoy, I see a kraken off the larboard bow!"
        }
    }
    It "Does Input with a vowel work for the spottedObject parameter work?"{
        foreach ($option in '-s', '-spottedObject'){
            $cmd = "$program $option octopus"
            Invoke-Expression $cmd | Should -BeExactly "Ahoy, I see an octopus off the larboard bow!"
        }
    }
}