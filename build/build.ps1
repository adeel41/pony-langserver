. ( Join-Path ((Get-Item ($MyInvocation.MyCommand.Definition)).Directory.FullName) "common.ps1" )
$srcFolder = Join-Path $rootFolder "src"

& ponyc.exe $srcFolder -b "pony-langserver" -o "out"
$executable = Join-Path $outFolder "pony-langserver.exe"