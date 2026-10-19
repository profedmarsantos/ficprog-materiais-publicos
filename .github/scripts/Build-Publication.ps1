param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
)

$ErrorActionPreference = 'Stop'
$contentRoot = Join-Path $RepositoryRoot 'conteudo'
$publicationRoot = Join-Path $RepositoryRoot 'publicacao'
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)

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
    if ($integrated) { return $integrated }

    $asynchronous = Join-Path $ModuleDirectory.FullName 'atividade-assincrona.html'
    if (Test-Path -LiteralPath $asynchronous) { return Get-Item -LiteralPath $asynchronous }
    return $null
}

function Convert-ModuleActivity {
    param([System.IO.FileInfo]$SourceFile, [string]$ModuleNumber)

    $html = [System.IO.File]::ReadAllText($SourceFile.FullName, [System.Text.Encoding]::UTF8)
    if ([regex]::IsMatch($html, '<h2\b[^>]*>\s*Gabarito\s*</h2>', 'IgnoreCase,Singleline')) {
        throw "A atividade-fonte ainda contém um gabarito docente: $($SourceFile.FullName)"
    }

    $html = $html.Replace('../dicas/painel-referencia-rapida-c.html', 'referencia-rapida-c.html')
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

$moduleEntries = @()
foreach ($moduleDirectory in (Get-ChildItem -LiteralPath $contentRoot -Directory -Filter 'modulo-*' | Sort-Object Name)) {
    $activity = Get-ModuleActivity $moduleDirectory
    if (-not $activity) { continue }

    $moduleNumber = [regex]::Match($moduleDirectory.Name, '\d+').Value
    $outputName = "$($moduleDirectory.Name)-atividade.html"
    $sourceHtml = [System.IO.File]::ReadAllText($activity.FullName, [System.Text.Encoding]::UTF8)
    $heading = Get-HtmlTitle $sourceHtml
    if (-not $heading) { $heading = "Atividade do Módulo $moduleNumber" }
    $kind = if ($activity.Name -like 'atividade-integrada*') { 'atividade integrada' } else { 'atividade assincrona' }
    $label = "Modulo $moduleNumber - $kind"

    Write-Utf8File (Join-Path $publicationRoot $outputName) (Convert-ModuleActivity $activity $moduleNumber)
    $moduleEntries += [pscustomobject]@{ File = $outputName; Label = $label; Heading = $heading }
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
    '        <li><a href="referencia-rapida-c.html">Painel de referencia rapida de C</a></li>'
) -join "`n"

$index = @"
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Atividades e materiais de apoio do curso Logica de Programacao Basica e Construcao de Algoritmos.">
  <meta name="robots" content="index,follow">
  <title>Materiais do curso - Logica de Programacao</title>
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
      <h1>Materiais do curso</h1>
      <p>Logica de Programacao Basica e Construcao de Algoritmos - atividades e consulta rapida para acompanhar os modulos enquanto o ambiente Moodle estiver indisponivel.</p>
    </header>
    <section aria-labelledby="materiais">
      <h2 id="materiais">Atividades e apoio</h2>
      <ul>
$links
      </ul>
    </section>
    <p class="note">O questionario objetivo sera disponibilizado no Moodle quando o ambiente voltar a funcionar.</p>
  </main>
</body>
</html>
"@
Write-Utf8File (Join-Path $publicationRoot 'index.html') $index
Write-Utf8File (Join-Path $publicationRoot '.nojekyll') ''
Write-Utf8File (Join-Path $publicationRoot 'robots.txt') "User-agent: *`nAllow: /`n"
Write-Host "Publicação gerada a partir de $($moduleEntries.Count) atividade(s)-fonte em conteudo/."
