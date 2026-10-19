[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Leaf })]
    [string]$Path
)

$issues = [System.Collections.Generic.List[string]]::new()
$resolvedPath = (Resolve-Path -LiteralPath $Path).Path

try {
    $bytes = [System.IO.File]::ReadAllBytes($resolvedPath)
    $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
    $null = $utf8.GetString($bytes)
}
catch {
    $issues.Add("O arquivo não possui codificação UTF-8 válida: $($_.Exception.Message)")
}

$document = New-Object System.Xml.XmlDocument
$document.PreserveWhitespace = $true
try {
    $document.Load($resolvedPath)
}
catch {
    $issues.Add("O XML não é bem-formado: $($_.Exception.Message)")
}

if ($issues.Count -eq 0 -and $document.DocumentElement.Name -ne 'quiz') {
    $issues.Add('O elemento raiz deve ser <quiz>.')
}

if ($issues.Count -eq 0) {
    foreach ($textNode in @($document.SelectNodes('//text'))) {
        if ($textNode.ChildNodes.Count -ne 1 -or $textNode.FirstChild.NodeType -ne [System.Xml.XmlNodeType]::CDATA) {
            $issues.Add('Todo elemento <text> deve conter exclusivamente um bloco CDATA.')
            break
        }
    }

    $questions = @($document.SelectNodes('/quiz/question[@type="multichoice"]'))
    if ($questions.Count -eq 0) {
        $issues.Add('O banco não possui questões de múltipla escolha.')
    }

    foreach ($question in $questions) {
        $questionName = $question.SelectSingleNode('name/text').InnerText
        if ($null -eq $question.SelectSingleNode('questiontext/text')) {
            $issues.Add("${questionName}: falta o enunciado.")
        }
        if ($null -eq $question.SelectSingleNode('generalfeedback/text')) {
            $issues.Add("${questionName}: falta o feedback geral.")
        }
        if ($question.SelectSingleNode('single').InnerText -ne 'true') {
            $issues.Add("${questionName}: a questão deve aceitar somente uma resposta.")
        }

        $answers = @($question.SelectNodes('answer'))
        if ($answers.Count -ne 5) {
            $issues.Add("${questionName}: esperado 5 alternativas; encontradas $($answers.Count).")
            continue
        }

        $correctAnswers = @($answers | Where-Object { $_.GetAttribute('fraction') -eq '100' })
        $incorrectAnswers = @($answers | Where-Object { $_.GetAttribute('fraction') -eq '0' })
        if ($correctAnswers.Count -ne 1 -or $incorrectAnswers.Count -ne 4) {
            $issues.Add("${questionName}: esperado 1 alternativa com fração 100 e 4 com fração 0.")
        }

        foreach ($answer in $answers) {
            if ($null -eq $answer.SelectSingleNode('text') -or $null -eq $answer.SelectSingleNode('feedback/text')) {
                $issues.Add("${questionName}: toda alternativa deve ter texto e feedback específico.")
                break
            }
        }
    }
}

if ($issues.Count -gt 0) {
    Write-Host "FALHA: $resolvedPath"
    $issues | ForEach-Object { Write-Host "- $_" }
    exit 1
}

Write-Host "APROVADO: $resolvedPath"
Write-Host "- UTF-8 válido, XML bem-formado, CDATA obrigatório e padrão de 5 alternativas confirmado."
