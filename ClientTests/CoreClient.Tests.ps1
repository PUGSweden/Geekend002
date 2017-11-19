$IsElevated = [System.Security.Principal.WindowsPrincipal][System.Security.Principal.WindowsIdentity]::GetCurrent() | 
    Foreach-Object -MemberName IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
Describe 'Core client configuration tests' {
    Context 'Connectivity' {
        It 'Has network connectivity' {
            $GWIP = Get-NetIPConfiguration |
                Select-Object -ExpandProperty IPv4DefaultGateway |
                Sort-Object -Property ifMetric -Descending |
                Select-Object -First 1 -ExpandProperty NextHop
            $PingParam = @{
                ComputerName = $GWIP
                InformationLevel = 'Quiet'
            }
            $Ping = Test-NetConnection @PingParam
            $Ping | Should -Be $True
        }

        It 'Has internet connectivity' {
            Test-NetConnection -CommonTCPPort HTTP |
                Select-Object -ExpandProperty TcpTestSucceeded |
                Should -Be $true
        }
    }

    Context 'Features' {
        if($true -eq $IsElevated) {
            $SMB1Features = Get-WindowsOptionalFeature -FeatureName SMB1* -Online
            foreach($Feature in $SMB1Features) {
                It "Has $($Feature.FeatureName) DISABLED" {
                    $Feature.State | Should -Be 'Disabled'
                }
            }   
        }
    }
}