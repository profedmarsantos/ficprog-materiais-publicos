param(
    [string]$RepositoryRoot
)

$ErrorActionPreference = 'Stop'
if (-not $RepositoryRoot) { $RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path }
$contentRoot = Join-Path $RepositoryRoot 'conteudo'
$publicationRoot = Join-Path $RepositoryRoot 'publicacao'
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
[System.IO.Directory]::CreateDirectory($publicationRoot) | Out-Null

function Write-Utf8File {
    param([string]$Path, [string]$Content)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

function Get-HtmlTitle {
    param([string]$Html)
    $match = [regex]::Match($Html, '<h1\b[^>]*>(.*?)</h1>', 'IgnoreCase,Singleline')
    if (-not $match.Success) { return $null }
    $text = [regex]::Replace($match.Groups[1].Value, '<[^>]+>', '')
    return [System.Net.WebUtility]::HtmlDecode($text).Trim()
}

function Get-ModuleActivity {
    param([System.IO.DirectoryInfo]$ModuleDirectory)

    $integrated = Get-ChildItem -LiteralPath $ModuleDirectory.FullName -File -Filter 'atividade-integrada*.html' |
        Sort-Object Name | Select-Object -First 1
    if (-not $integrated) { throw "Atividade integrada ausente: $($ModuleDirectory.FullName)" }
    return $integrated
}

function Convert-ModuleActivity {
    param([System.IO.FileInfo]$SourceFile, [string]$ModuleNumber)

    $html = [System.IO.File]::ReadAllText($SourceFile.FullName, [System.Text.Encoding]::UTF8)
    $html = $html.Replace('../dicas/painel-referencia-rapida-c.html', 'referencia-rapida-c.html')
    if ($html -match '(?is)<html\b') { return $html }
    $title = Get-HtmlTitle $html
    if (-not $title) { $title = "Atividade do Módulo $ModuleNumber" }

    $description = [System.Net.WebUtility]::HtmlEncode("$title - Logica de Programacao Basica e Construcao de Algoritmos.")
    $documentTitle = [System.Net.WebUtility]::HtmlEncode("$title - Logica de Programacao")
    return @"
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="$description">
  <meta name="robots" content="index,follow">
  <title>$documentTitle</title>
</head>
<body>$html</body>
</html>
"@
}

function Convert-MarkdownResource {
    param([System.IO.FileInfo]$SourceFile, [string]$Title)

    $pandoc = Get-Command pandoc -ErrorAction Stop
    $body = (& $pandoc.Source $SourceFile.FullName '--from=gfm' '--to=html' '--wrap=none' | Out-String)
    if ($LASTEXITCODE -ne 0) { throw "Pandoc falhou: $($SourceFile.FullName)" }
    $safeTitle = [System.Net.WebUtility]::HtmlEncode($Title)
    return @"
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$safeTitle</title>
  <style>body{font:17px/1.65 system-ui,Arial,sans-serif;color:#172033;max-width:900px;margin:32px auto;padding:0 20px}h1,h2,h3{color:#075985}pre{background:#0f172a;color:#e2e8f0;padding:16px;overflow:auto;border-radius:8px}code{font-family:ui-monospace,Consolas,monospace}table{border-collapse:collapse;width:100%}td,th{border:1px solid #dbe4ee;padding:8px}a{color:#075985}</style>
</head>
<body>$body</body>
</html>
"@
}

$moduleEntries = @()
foreach ($moduleDirectory in (Get-ChildItem -LiteralPath $contentRoot -Directory -Filter 'modulo-*' | Sort-Object Name)) {
    $activity = Get-ModuleActivity $moduleDirectory

    $moduleNumber = [regex]::Match($moduleDirectory.Name, '\d+').Value
    $outputName = "$($moduleDirectory.Name)-atividade.html"
    $sourceHtml = [System.IO.File]::ReadAllText($activity.FullName, [System.Text.Encoding]::UTF8)
    $heading = Get-HtmlTitle $sourceHtml
    if (-not $heading) { $heading = "Atividade do Módulo $moduleNumber" }
    $label = "Módulo $moduleNumber - atividade integrada"

    Write-Utf8File (Join-Path $publicationRoot $outputName) (Convert-ModuleActivity $activity $moduleNumber)
    $moduleEntries += [pscustomobject]@{ File = $outputName; Label = $label; Heading = $heading }

    foreach ($xmlName in @('lista-exercicios-sincrona.xml', 'questionario-assincrono.xml')) {
        $sourceXml = Join-Path $moduleDirectory.FullName $xmlName
        if (-not (Test-Path -LiteralPath $sourceXml)) { throw "XML obrigatório ausente: $sourceXml" }
        $targetName = "$($moduleDirectory.Name)-$xmlName"
        Copy-Item -LiteralPath $sourceXml -Destination (Join-Path $publicationRoot $targetName) -Force
    }

    foreach ($videoKind in @('roteiro-video', 'video')) {
        $sourceVideo = Join-Path $moduleDirectory.FullName "$videoKind-modulo-$moduleNumber-notebooklm.md"
        if (-not (Test-Path -LiteralPath $sourceVideo)) { throw "Material de vídeo ausente: $sourceVideo" }
        $videoTitle = if ($videoKind -eq 'roteiro-video') { "Módulo $moduleNumber - roteiro de vídeo" } else { "Módulo $moduleNumber - instrução de vídeo" }
        $targetName = "$($moduleDirectory.Name)-$videoKind.html"
        Write-Utf8File (Join-Path $publicationRoot $targetName) (Convert-MarkdownResource (Get-Item -LiteralPath $sourceVideo) $videoTitle)
    }
}

$referenceSource = Join-Path $contentRoot 'dicas/painel-referencia-rapida-c.html'
if (-not (Test-Path -LiteralPath $referenceSource)) { throw "Painel de referência não encontrado: $referenceSource" }
$referenceHtml = [System.IO.File]::ReadAllText($referenceSource, [System.Text.Encoding]::UTF8)
Write-Utf8File (Join-Path $publicationRoot 'referencia-rapida-c.html') @"
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Painel de referencia rapida de C para os conteudos ja trabalhados no curso.">
  <meta name="robots" content="index,follow">
  <title>Painel de referencia rapida de C - Logica de Programacao</title>
</head>
<body>$referenceHtml</body>
</html>
"@

$links = @(
    foreach ($entry in $moduleEntries) {
        "        <li><a href=`"$($entry.File)`">$([System.Net.WebUtility]::HtmlEncode($entry.Label))</a></li>"
    }
) -join "`n"

$index = @"
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Atividades integradas do curso Logica de Programacao Basica e Construcao de Algoritmos.">
  <meta name="robots" content="index,follow">
  <title>Atividades integradas - Logica de Programacao</title>
  <style>
    :root { color-scheme: light; font-family: system-ui, -apple-system, "Segoe UI", sans-serif; color: #172033; background: #f1f5f9; }
    body { margin: 0; }
    main { width: min(900px, calc(100% - 32px)); margin: 48px auto; }
    header { padding: 32px; border-radius: 18px; color: white; background: linear-gradient(135deg, #0f172a, #075985); }
    h1 { margin: 0 0 12px; font-size: clamp(1.8rem, 5vw, 2.6rem); }
    header p { margin: 0; max-width: 65ch; color: #dbeafe; line-height: 1.6; }
    section { margin-top: 28px; }
    h2 { color: #0c4a6e; }
    ul { display: grid; gap: 12px; padding: 0; list-style: none; }
    li { padding: 18px 20px; border: 1px solid #dbe4ee; border-radius: 12px; background: white; }
    a { color: #075985; font-weight: 700; }
    a:focus-visible { outline: 3px solid #f59e0b; outline-offset: 3px; }
    .note { margin-top: 28px; color: #475569; font-size: .95rem; }
  </style>
</head>
<body>
  <main>
    <header>
      <h1>Atividades integradas</h1>
      <p>Lógica de Programação Básica e Construção de Algoritmos</p>
    </header>
    <section aria-labelledby="modulos">
      <h2 id="modulos">Módulos</h2>
      <ul>
$links
      </ul>
    </section>
  </main>
</body>
</html>
"@
Write-Utf8File (Join-Path $publicationRoot 'index.html') $index
Write-Utf8File (Join-Path $publicationRoot '.nojekyll') ''
Write-Utf8File (Join-Path $publicationRoot 'robots.txt') "User-agent: *`nAllow: /`n"
Write-Host "Publicação gerada a partir de $($moduleEntries.Count) atividade(s)-fonte em conteudo/."
