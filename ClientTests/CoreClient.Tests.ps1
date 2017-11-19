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
}