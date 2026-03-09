$report = "event-log-report.txt"

"WINDOWS EVENT LOG ANALYSIS REPORT" | Out-File $report

"`nRECENT SYSTEM ERRORS" | Out-File $report -Append
Get-EventLog -LogName System -EntryType Error -Newest 20 | Out-File $report -Append

"`nRECENT APPLICATION ERRORS" | Out-File $report -Append
Get-EventLog -LogName Application -EntryType Error -Newest 20 | Out-File $report -Append

"`nRECENT WARNINGS" | Out-File $report -Append
Get-EventLog -LogName System -EntryType Warning -Newest 20 | Out-File $report -Append

Write-Output "Event log report generated: $report"