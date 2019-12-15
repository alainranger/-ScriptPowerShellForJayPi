param (
    [string]$rootPath
 )

Get-ChildItem -Path $rootPath -Filter "*.*" -Recurse | Where-Object { !$_.PSIsContainer } | ForEach-Object {    
    $fullname = $_.FullName
    $parent = $_.Directory.Parent.FullName

    Move-Item -Path $fullname -Destination $parent

    Write-Output "$fullname => $parent"
}

Get-ChildItem -Path $rootPath -Filter "AUDIO" -Recurse | ForEach-Object {
    Write-Output $_.FullName

    Remove-Item $_.FullName
}

Get-ChildItem -Path $rootPath -Filter "IMAGE" -Recurse | ForEach-Object {
    Write-Output $_.FullName

    Remove-Item $_.FullName
}