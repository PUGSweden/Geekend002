try {
    $u = Get-ADUser blä
    $u.EmployeeNumer = $u.employeeID
    Set-ADUser -user $u    
}
Catch [Microsoft.ActiveDirectory.Management.ADServerDownException] {
    Write-Output "ADServer is down`nnew line!`twoho!","and another new line!"
}
catch {
    Write-Error 'UnknownError'
}

