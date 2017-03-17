$sb={
     $fullname = $Event.SourceEventArgs.Name
     $separator = [string[]]@("Multiplayer\")
     $name = $fullname.Split($separator, [System.StringSplitOptions]::RemoveEmptyEntries)[1]
     {{ scipts_dir }}\source-openrc.ps1 {{ scripts_dir }}\replays_scripts\openrc.sh
     swift upload replays_unprocessed $name
     $event
}

$fsw=New-Object IO.FileSystemWatcher('{{ replays_dir }}', '*.SC2Replay*')
$fsw.IncludeSubdirectories=$true
Register-ObjectEvent -InputObject $fsw -EventName Created -SourceIdentifier FileCreated -Action $sb
