$current = Get-Location

function GetOneFolderUp($path) {
    return split-path -parent $path 
}

$rootFolder = GetOneFolderUp(GetOneFolderUp($MyInvocation.MyCommand.Definition))
$buildFolder = Join-Path $rootFolder "build"
$srcFolder = Join-Path $rootFolder "src"
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