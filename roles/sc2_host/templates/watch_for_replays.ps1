$sb={
     $name = $Event.SourceEventArgs.FullPath
     $changeType = $Event.SourceEventArgs.ChangeType
     $timeStamp = $Event.TimeGenerated
     Write-Host "The file $name was $changeType at $timeStamp" -fore green
     swift auth
     swift upload replays_unprocessed $name
     $event
}

$fsw=New-Object IO.FileSystemWatcher('{{ replays_dir }}', '*.SC2Replay*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated -Action $sb
