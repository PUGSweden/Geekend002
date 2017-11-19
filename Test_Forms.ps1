#function Get-DSCVideos {

#Invoke-RestMethod -uri "https://gdata.youtube.com/feeds/api/videos?v=2&q=Desired+State+Configuration+PowerShell" | 
#foreach {[PSCustomObject]@{Title=$_.Title; Author=$_.author.name; Link=$_.content.src}} | Format-List }

function PlayCatFails
{
$Shellobject = New-Object -ComObject shell.application
$Shellobject.MinimizeAll()
$IEObject = New-Object -ComObject internetexplorer.application
$IEObject.visible=$true
$IEObject.Fullscreen = $true
#$IEObject.navigate2("https://www.youtube.com/embed/O1KW3ZkLtuo")
$IEObject.navigate2("https://www.youtube.com/tv#/watch?v=79EvGkXHF9I") 
} 

Add-Type -AssemblyName System.Windows.Forms
$form = New-Object Windows.Forms.Form
#$form.Size = New-Object Drawing.Size @(700,400)
$form.StartPosition = "CenterScreen"
$Form.Text = "Catvideo Here!"
$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
    # Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Font2 = New-Object System.Drawing.Font("Times New Roman",12,[System.Drawing.FontStyle]::Bold)
    # Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Form.Font = $Font
$Form.AutoScroll = $False
$Form.AutoSize = $True
$Form.Top = $True
$Form.AutoSizeMode = "GrowAndShrink"
    # or GrowOnly 
$Form.MinimizeBox = $True
$Form.MaximizeBox = $True
$Form.BackColor = "Green"
#$Form.Backcolor.
$img = [Drawing.Image]::FromFile('C:\temp\scripts\intel_sidebar_lefttoright.bmp')
$Form.Width = $img.Width
$Form.Height = $img.Height
$Form.BackgroundImage = $img
$form.BackgroundImageLayout = 'Tile'
$Form.WindowState = "Normal"
    # Maximized, Minimized, Normal
$Form.SizeGripStyle = "Show"
    # Auto, Hide, Show
$Form.ShowInTaskbar = $True
$Form.Opacity = 0.7
    # 1.0 is fully opaque; 0.0 is invisible
$Form.StartPosition = "CenterScreen"
    # CenterScreen, Manual, WindowsDefaultLocation, WindowsDefaultBounds, CenterParent
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Did you say you wanted catvideos?"
$Label.AutoSize = $True
$Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
$Form.Icon = $Icon

$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(20,70) 
$objTextBox.Size = New-Object System.Drawing.Size(50,100) 
$Form.Controls.Add($objTextBox) 

$GatherButton = New-Object System.Windows.Forms.Button
$GatherButton.Location = New-Object System.Drawing.Size(80,70)
$GatherButton.Size = New-Object System.Drawing.Size(80,50)
$GatherButton.Font = $Font2
$GatherButton.BackColor = "Pink"
$GatherButton.Text = "Gather"
$GatherButton.Add_Click({$OKButton.Text = $objTextBox.Text})
#$GatherButton.Padding = 1
$Form.Controls.Add($GatherButton)

$gif = [Drawing.Image]::FromFile('C:\temp\scripts\325.gif')
$picbox = New-Object Windows.Forms.PictureBox
$picbox.Width  = $gif.Size.Width
$picbox.Height = $gif.Size.Height
$picbox.Location = New-Object System.Drawing.Size(300,300)
$picbox.BackColor = "white"
#$picbox.Image  = $gif

$Form.Controls.Add($Label)
$Form.Controls.Add($picbox)

$Form.KeyPreview = $True
$Form.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$TextBox.Text;$Form.Close()}})
$Form.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$Form.Close()}})
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(75,120)
$OKButton.Size = New-Object System.Drawing.Size(100,50)
$OKButton.Font = $font2
$OKButton.Text = "OK"
$OKButton.Add_Click({$picbox.Image  = $gif})
#$OKButton.Add_Click({Get-WmiObject win32_computersystem | select PSComputername|Out-Host;$Form.Close()})
#$btn.add_click({Get-WmiObject win32_computersystem | select PSComputername|Out-Host})
$Form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(200,120)
$CancelButton.Size = New-Object System.Drawing.Size(180,50)
$CancelButton.Font = $Font2
$CancelButton.BackColor = "Red"
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({PlayCatFails})
$Form.Controls.Add($CancelButton)

$drc = $form.ShowDialog()
#$btn = New-Object System.Windows.Forms.Button
#$btn.add_click({Get-WmiObject win32_computersystem | select PSComputername|Out-Host})
#$btn.Text = "Click here"
#$btn.l
#$form.Controls.Add($btn)
#$drc = $form.ShowDialog()

function PlayCatFails
{
$Shellobject = New-Object -ComObject shell.application
$Shellobject.MinimizeAll()
$IEObject = New-Object -ComObject internetexplorer.application
$IEObject.visible=$true
$IEObject.Fullscreen = $true
$IEObject.navigate2("https://www.youtube.com/embed/O1KW3ZkLtuo") 
} 
 
