Function Set-WallPaper($Value){
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}


Invoke-WebRequest "https://github.com/arratres/papayed/blob/main/papay.jpg?raw=true" -OutFile "$env:TEMP\papay.jpg"
Invoke-WebRequest "https://github.com/arratres/papayed/blob/main/barca.mp3?raw=true" -OutFile "$env:TEMP\barca.mp3"

Set-Wallpaper -value "$env:TEMP\Papay.jpg"

# opens barca, although when cmd is closed, not playing anymore
# don't want to be more aggresive
Add-Type -AssemblyName presentationCore;
$player = New-Object system.windows.media.mediaplayer;
$player.Open("$env:TEMP\barca.mp3");
$player.Play() 