function PlayIt {
    $tune = @(
        @{ Pitch = 440; Length = 300; }
        @{ Pitch = 440; Length = 200; }
        @{ Pitch = 493; Length = 500; }
        @{ Pitch = 440; Length = 500; }
        @{ Pitch = 587; Length = 500; }
        @{ Pitch = 554; Length = 800; }

        @{ Pitch = 440; Length = 300; }
        @{ Pitch = 440; Length = 200; }
        @{ Pitch = 493; Length = 500; }
        @{ Pitch = 440; Length = 500; }
        @{ Pitch = 659; Length = 500; }
        @{ Pitch = 587; Length = 800; }

        @{ Pitch = 440; Length = 300; }
        @{ Pitch = 440; Length = 200; }
        @{ Pitch = 880; Length = 500; }
        @{ Pitch = 740; Length = 500; }
        @{ Pitch = 587; Length = 500; }
        @{ Pitch = 554; Length = 500; }
        @{ Pitch = 493; Length = 500; }
        @{ Pitch = 784; Length = 300; }
        @{ Pitch = 784; Length = 200; }
        @{ Pitch = 740; Length = 500; }
        @{ Pitch = 587; Length = 700; }
        @{ Pitch = 659; Length = 500; }
        @{ Pitch = 587; Length = 500; }
        )

    foreach ($Beep in $tune) {
        [Console]::Beep($Beep['Pitch'], $Beep['Length']);
        Start-Sleep -Milliseconds $Beep['Length']
    }

}
