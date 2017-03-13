$sb={
     $name = $Event.SourceEventArgs.FullPath
     $changeType = $Event.SourceEventArgs.ChangeType
     $timeStamp = $Event.TimeGenerated
     # TODO make this a REST API call pushing to object storage container
     Write-Host "The file $name was $changeType at $timeStamp" -fore green
     $event
     swift auth
     swift upload replays_unprocessed $name
}

$fsw=New-Object IO.FileSystemWatcher('{{ replays_dir }}', '*.SC2Replay*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated -Action $sb
