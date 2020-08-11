param ($Operation = "build", $Destination = "")

$validOperations = "build", "copy", "run", "test"

if ($validOperations -notcontains $Operation) {
    Write-Host "Please provide a valid operation from one of following options:" $validOperations
    return
} 

if ( $Operation -eq "copy" -and $Destination -eq "") {
    Write-Host "Please provide a valid destination"
    return
}

function GetOneFolderUp($path) {
    return split-path -parent $path 
}

$rootFolder = GetOneFolderUp(GetOneFolderUp($MyInvocation.MyCommand.Definition))
#$buildFolder = Join-Path $rootFolder "build"
$srcFolder = Join-Path $rootFolder "src"
if ($Operation -eq "test") {
    $srcFolder = Join-Path $srcFolder "lsp"
}
$outFolder = Join-Path $rootFolder "out"

function GetRelativePath {
    $combinedPath = $rootFolder
    for($i = 0; $i -lt $args.Count; $i++) {
        $combinedPath = Join-Path $combinedPath $args[$i]
    }
    return $combinedPath
}

function RefreshEnvironmentPathVariable() {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}


#& corral run -- ponyc $srcFolder -b "pony-langserver" --define openssl_0.9.0  -o "out"
& corral run -- ponyc $srcFolder -b "pony-langserver" --debug -o "out"
#& ponyc.exe $srcFolder -b "pony-langserver" -o "out"
$executable = Join-Path $outFolder "pony-langserver.exe"

if ($Operation -eq "run") {
    #Clear-Host
    & $executable
    return
}

if ($Operation -eq "copy") {
    Copy-Item $executable -Destination $Destination -Force
}