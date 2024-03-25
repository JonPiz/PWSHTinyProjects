Describe "Test for pirate program (Ch2)"{
    BeforeAll{
        
        $script:program = "$PSScriptRoot\crowsnest.ps1"

        $script:consonantWords = 'brigantine', 'clipper', 'dreadnought', 'frigate', 'galleon', 'haddock',
        'junk', 'ketch', 'longboat', 'mullet', 'narwhal', 'porpoise', 'quay',
        'regatta', 'submarine', 'tanker', 'vessel', 'whale', 'xebec', 'yatch',
        'zebrafish'

        $script:vowelWords = 'aviso', 'eel', 'iceberg', 'octopus', 'upbound'
        $script:template = 'Ahoy, Captain, {0} {1} off the larboard bow!'  
    }
    
    It "Does Program exist?"{
        Test-Path $program | Should -Be $true
    }

    It "Does consonant input work?"{
        foreach ($consonantWord in $script:consonantWords){
            $actual = &$program $consonantWord
            $expected = $script:template -f 'a', $consonantWord

            $actual | Should -BeExactly $expected
        }
    }

    It "Does an uppercase consonant input work?"{
        foreach ($consonantWord in $script:consonantWords){
            $uppercasedWord = (Get-Culture).TextInfo.ToTitleCase($consonantWord)
            $actual = &$program $uppercasedWord
            $expected = $script:template -f 'a', $uppercasedWord

            $actual | Should -BeExactly $expected
        }
    }

    It "Does vowel input work?"{
        foreach ($vowelWord in $script:vowelWords){
            $actual = &$program $vowelWord
            $expected = $script:template -f 'an', $vowelWord

            $actual | Should -BeExactly $expected
        }
    }

    It "Does an uppercase consonant input work?"{
        foreach ($vowelWord in $script:vowelWords){
            $uppercasedWord = (Get-Culture).TextInfo.ToTitleCase($vowelWord)
            $actual = &$program $uppercasedWord
            $expected = $script:template -f 'an', $uppercasedWord

            $actual | Should -BeExactly $expected
        }
    }
}