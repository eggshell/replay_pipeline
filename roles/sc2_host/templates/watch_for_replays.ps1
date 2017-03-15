$sb={
     $name = $Event.SourceEventArgs.FullPath
     swift auth
     swift upload replays_unprocessed $name
     $event
}

$fsw=New-Object IO.FileSystemWatcher('{{ replays_dir }}', '*.SC2Replay*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated -Action $sb
