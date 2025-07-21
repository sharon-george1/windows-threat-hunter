$events = Get-WinEvent -LogName "Microsoft-Windows-Sysmon/Operational" | Where-Object {
    $_.Message -like "*powershell.exe*" -or
    $_.Message -like "*reg query*" -or
    $_.Message -like "*Invoke-WebRequest*" -or
    $_.Message -like "*.dll"
}

$parsed = foreach ($event in $events) {
    [PSCustomObject]@{
        TimeCreated = $event.TimeCreated
        EventID = $event.Id
        Message = $event.Message
    }
}

$parsed | Export-Csv -Path ".\ioc_events.csv" -NoTypeInformation
Write-Host "`n IOC events exported to ioc_events.csv"