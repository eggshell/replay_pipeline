$sb={
     $filepath = $Event.SourceEventArgs.FullPath
     $fullname = $Event.SourceEventArgs.Name
     $separator = [string[]]@("Multiplayer\")
     $name = $fullname.Split($separator, [System.StringSplitOptions]::RemoveEmptyEntries)[1]
     {{ scripts_dir }}\source-openrc.ps1 {{ scripts_dir }}\openrc.sh
     swift upload --object-name $name replays_unprocessed $filepath
     $event
}

$fsw=New-Object IO.FileSystemWatcher('{{ replays_dir }}', '*.SC2Replay*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated -Action $sb
