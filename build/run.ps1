. ( Join-Path ((Get-Item ($MyInvocation.MyCommand.Definition)).Directory.FullName) "common.ps1" )
. ( Join-Path $buildFolder "build.ps1" )

& clear
& $executable