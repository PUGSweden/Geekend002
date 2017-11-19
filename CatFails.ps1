 function PlayCatFails
 {
   $Shellobject = New-Object -ComObject shell.application
    $Shellobject.MinimizeAll()
    $IEObject = New-Object -ComObject internetexplorer.application
    $IEObject.visible=$true
    $IEObject.FullScreen=$true
    $IEObject.navigate2("https://www.youtube.com/tv#/watch?v=79EvGkXHF9I") 
 }
 PlayCatFails