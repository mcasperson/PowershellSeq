$PublishParams = @{
    Path = "$(Get-Location)\PowershellSeq"
    NuGetApiKey = $env:PowershellGalleryApiKey
}

# There is no way to exclude files, so move the files were are interested in to a temporary location
If (Test-Path PowershellSeq){
    Remove-Item -Recurse PowershellSeq
}
mkdir PowershellSeq
mkdir PowershellSeq/Public
cp PowershellSeq.psd1 PowershellSeq
cp PowershellSeq.psm1 PowershellSeq
cp Public/Seq.ps1 PowershellSeq/Public

# Publish the module
Publish-Module @PublishParams

# Clear the temporary files
Remove-Item -Recurse PowershellSeq