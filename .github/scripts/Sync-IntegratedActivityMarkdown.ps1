param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path,
    [switch]$Watch
)

$ErrorActionPreference = 'Stop'
$pandoc = Get-Command pandoc.exe -ErrorAction Stop
$encoding = [System.Text.UTF8Encoding]::new($false)
$moduleRoot = Join-Path $RepositoryRoot 'conteudo'

function Convert-IntegratedActivity {
    param([string]$HtmlPath)

    if (-not (Test-Path -LiteralPath $HtmlPath)) { return }
    $file = Get-Item -LiteralPath $HtmlPath
    if ($file.Name -notlike 'atividade-integrada*.html') { return }

    $html = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $html = [regex]::Replace($html, '\sstyle\s*=\s*"[^"]*"', '', 'IgnoreCase')
    $html = [regex]::Replace($html, '<\/?(?:div|section|span)\b[^>]*>', '', 'IgnoreCase')
    # GFM has no colspan support; expand a two-column cell so Pandoc can emit a pipe table.
    $html = [regex]::Replace($html, '<(td|th)\s+colspan\s*=\s*"2"[^>]*>(.*?)</\1>', '<$1>$2</$1><$1></$1>', 'IgnoreCase, Singleline')
    $html = [regex]::Replace($html, '<details\b[^>]*>|</details\s*>', '', 'IgnoreCase')
    $html = [regex]::Replace($html, '<summary\b[^>]*>', '<h3>', 'IgnoreCase')
    $html = [regex]::Replace($html, '</summary\s*>', '</h3>', 'IgnoreCase')

    $tempHtml = Join-Path ([System.IO.Path]::GetTempPath()) ("ficprog-" + [guid]::NewGuid().ToString('N') + '.html')
    $tempMarkdown = Join-Path ([System.IO.Path]::GetTempPath()) ("ficprog-" + [guid]::NewGuid().ToString('N') + '.md')
    $markdownPath = [System.IO.Path]::ChangeExtension($file.FullName, '.md')

    try {
        [System.IO.File]::WriteAllText($tempHtml, $html, $encoding)
        & $pandoc.Source $tempHtml '--from=html' '--to=gfm' '--wrap=none' "--output=$tempMarkdown"
        if ($LASTEXITCODE -ne 0) { throw "Pandoc falhou ao converter $($file.FullName)." }

        $markdown = "<!-- Gerado automaticamente a partir do HTML; edite o HTML fonte. -->`n`n" +
            [System.IO.File]::ReadAllText($tempMarkdown, [System.Text.Encoding]::UTF8)
        if (-not (Test-Path -LiteralPath $markdownPath) -or
            [System.IO.File]::ReadAllText($markdownPath, [System.Text.Encoding]::UTF8) -cne $markdown) {
            [System.IO.File]::WriteAllText($markdownPath, $markdown, $encoding)
            Write-Host "Markdown atualizado: $markdownPath"
        }
    }
    finally {
        Remove-Item -LiteralPath $tempHtml, $tempMarkdown -Force -ErrorAction SilentlyContinue
    }
}

function Get-IntegratedActivities {
    Get-ChildItem -LiteralPath $moduleRoot -Directory -Filter 'modulo-*' | ForEach-Object {
        Get-ChildItem -LiteralPath $_.FullName -File -Filter 'atividade-integrada*.html'
    }
}

Get-IntegratedActivities | ForEach-Object { Convert-IntegratedActivity $_.FullName }
if (-not $Watch) { exit 0 }

$watchers = @()
$subscriptions = @()
try {
    foreach ($directory in (Get-ChildItem -LiteralPath $moduleRoot -Directory -Filter 'modulo-*')) {
        $watcher = [System.IO.FileSystemWatcher]::new($directory.FullName, '*.html')
        $watcher.IncludeSubdirectories = $false
        $watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite -bor [System.IO.NotifyFilters]::FileName
        $prefix = 'IntegratedMarkdown-' + [guid]::NewGuid().ToString('N')
        foreach ($eventName in @('Changed', 'Created', 'Renamed')) {
            $sourceIdentifier = "$prefix-$eventName"
            Register-ObjectEvent -InputObject $watcher -EventName $eventName -SourceIdentifier $sourceIdentifier | Out-Null
            $subscriptions += $sourceIdentifier
        }
        $watcher.EnableRaisingEvents = $true
        $watchers += $watcher
    }

    Write-Host 'Markdown watcher started.'
    while ($true) {
        $event = Wait-Event -Timeout 1
        if (-not $event) { continue }

        $sourcePath = $event.SourceEventArgs.FullPath
        $sourceIdentifier = $event.SourceIdentifier
        Remove-Event -EventIdentifier $event.EventIdentifier -ErrorAction SilentlyContinue
        Start-Sleep -Milliseconds 400
        Get-Event -SourceIdentifier $sourceIdentifier -ErrorAction SilentlyContinue | Remove-Event -ErrorAction SilentlyContinue

        if ((Split-Path -Leaf $sourcePath) -like 'atividade-integrada*.html' -and (Test-Path -LiteralPath $sourcePath)) {
            Convert-IntegratedActivity $sourcePath
        }
    }
}
finally {
    foreach ($subscription in $subscriptions) {
        Unregister-Event -SourceIdentifier $subscription -ErrorAction SilentlyContinue
    }
    foreach ($watcher in $watchers) {
        $watcher.EnableRaisingEvents = $false
        $watcher.Dispose()
    }
    Write-Host 'Markdown watcher stopped.'
}
