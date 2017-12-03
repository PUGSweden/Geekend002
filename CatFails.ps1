# Parameter help description
Param 
(
    [Parameter(Mandatory=$true)]
    [ValidateSet("CatFails","imperialmarch")]
    [String[]]
    $Action
)
 
 function PlayCatFails
 {
   $Shellobject = New-Object -ComObject shell.application
    $Shellobject.MinimizeAll()
    $IEObject = New-Object -ComObject internetexplorer.application
    $IEObject.visible=$true
    $IEObject.FullScreen=$true
    $IEObject.navigate2("https://www.youtube.com/tv#/watch?v=79EvGkXHF9I") 
 }
 function imperialmarch
 {
 
     [console]::beep(440,500)       
     [console]::beep(440,500) 
     [console]::beep(440,500)        
     [console]::beep(349,350)        
     [console]::beep(523,150)        
     [console]::beep(440,500)        
     [console]::beep(349,350)        
     [console]::beep(523,150)        
     [console]::beep(440,1000) 
     [console]::beep(659,500)        
     [console]::beep(659,500)        
     [console]::beep(659,500)        
     [console]::beep(698,350)        
     [console]::beep(523,150)        
     [console]::beep(415,500)        
     [console]::beep(349,350)        
     [console]::beep(523,150)        
     [console]::beep(440,1000)    
 }
 
if ($action -eq 'imperialmarch')
{
 imperialmarch   
}
if ($action -eq 'catfails')
{
 PlayCatFails
}