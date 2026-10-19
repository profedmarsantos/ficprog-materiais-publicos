param(
    [Parameter(Mandatory = $true)]
    [string]$Path
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "Arquivo não encontrado: $Path"
}

$bytes = [System.IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $Path))
if ($bytes.Length -ge 2 -and $bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) {
    throw 'O arquivo deve estar codificado em UTF-8, não UTF-16.'
}

$utf8 = New-Object System.Text.UTF8Encoding($false, $true)
try {
    $null = $utf8.GetString($bytes)
} catch {
    throw 'O arquivo não contém UTF-8 válido.'
}

[xml]$xml = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
if ($xml.DocumentElement.Name -ne 'quiz') {
    throw 'O elemento raiz deve ser <quiz>.'
}

$textNodes = @($xml.SelectNodes('//text'))
foreach ($node in $textNodes) {
    if ($node.ChildNodes.Count -ne 1 -or $node.FirstChild.NodeType -ne [System.Xml.XmlNodeType]::CDATA) {
        throw "Todo conteúdo de <text> deve ser CDATA. Falha em: $($node.OuterXml)"
    }
}

$questions = @($xml.SelectNodes('/quiz/question[@type="essay"]'))
if ($questions.Count -eq 0) {
    throw 'A lista deve possuir pelo menos uma questão do tipo essay.'
}

foreach ($question in $questions) {
    $name = $question.SelectSingleNode('./name/text')
    $questionText = $question.SelectSingleNode('./questiontext/text')
    $feedback = $question.SelectSingleNode('./generalfeedback/text')
    $responseFormat = $question.SelectSingleNode('./responseformat')

    if ($null -eq $name -or [string]::IsNullOrWhiteSpace($name.InnerText)) { throw 'Cada questão essay deve possuir nome.' }
    if ($null -eq $questionText -or [string]::IsNullOrWhiteSpace($questionText.InnerText)) { throw "A questão '$($name.InnerText)' não possui enunciado." }
    if ($null -eq $feedback -or [string]::IsNullOrWhiteSpace($feedback.InnerText)) { throw "A questão '$($name.InnerText)' não possui feedback geral." }
    if ($null -eq $responseFormat -or $responseFormat.InnerText -ne 'editor') { throw "A questão '$($name.InnerText)' deve usar responseformat editor." }
}

Write-Host "Lista Moodle válida: $($questions.Count) questão(ões) discursiva(s), UTF-8 e CDATA verificados."
