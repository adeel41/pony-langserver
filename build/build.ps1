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
$compilationFolder = Join-Path $rootFolder "src"
if ($Operation -eq "test") {
    $compilationFolder = Join-Path $compilationFolder "tests"
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


& corral run -- ponyc $compilationFolder -b "pony-langserver" --debug -o "out"
$executable = Join-Path $outFolder "pony-langserver.exe"

if ($Operation -eq "run") {
    #Clear-Host
    & $executable
    return
}

if ($Operation -eq "copy") {
    Copy-Item $executable -Destination $Destination -Force
}