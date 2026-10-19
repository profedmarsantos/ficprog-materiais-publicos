[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [switch]$ValidateInternal
)

$ErrorActionPreference = 'Stop'
if (-not $RepositoryRoot) { $RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path }
$questionValidator = Join-Path $RepositoryRoot 'scripts/Test-MoodleQuestionBank.ps1'
$exerciseValidator = Join-Path $RepositoryRoot 'scripts/Test-MoodleExerciseList.ps1'

for ($number = 1; $number -le 8; $number++) {
    $id = $number.ToString('00')
    $module = Join-Path $RepositoryRoot "conteudo/modulo-$id"
    if (-not (Test-Path -LiteralPath $module -PathType Container)) { throw "Módulo ausente: $module" }
    if (Test-Path -LiteralPath (Join-Path $module 'plano-modulo.html')) { throw "Plano HTML proibido no módulo $id" }
    if ($ValidateInternal -and -not (Test-Path -LiteralPath (Join-Path $module 'plano-modulo.md') -PathType Leaf)) { throw "Plano Markdown ausente no módulo $id." }
    if (@(Get-ChildItem -LiteralPath $module -Directory).Count -ne 0) { throw "Módulo $id deve manter os materiais na raiz, sem subpastas." }

    $activities = @(Get-ChildItem -LiteralPath $module -File -Filter 'atividade-integrada-*.html')
    if ($activities.Count -ne 1) { throw "Módulo $id precisa de exatamente uma atividade integrada HTML." }
    if ($ValidateInternal -and -not (Test-Path -LiteralPath ([System.IO.Path]::ChangeExtension($activities[0].FullName, '.md')) -PathType Leaf)) { throw "Módulo $id sem espelho Markdown da atividade integrada." }
    $html = [System.IO.File]::ReadAllText($activities[0].FullName, [System.Text.Encoding]::UTF8)
    if ($html -notmatch '(?is)<!doctype\s+html>.*<html\b.*</html>') { throw "Módulo $id sem página HTML completa." }
    if ($html -notmatch "(?is)<h2\b[^>]*>\s*Atividade Presencial\s*[\u2014\u2013-]\s*M.dulo $number\s*</h2>" -or
        $html -notmatch "(?is)<h2\b[^>]*>\s*Atividade Ass.ncrona\s*[\u2014\u2013-]\s*M.dulo $number\s*</h2>") { throw "Módulo $id sem as duas seções padronizadas." }
    foreach ($marker in @('Como resolver cada exerc.cio', 'Entrega e confer.ncia', 'Roteiro da atividade ass.ncrona', 'Revis.o pessoal orientada', 'Question.rio Moodle', 'Interven..es esperadas', 'Registro da carga EAD')) {
        if ($html -notmatch $marker) { throw "Módulo $id sem componente do padrão: $marker" }
    }
    if ($html -notmatch '(?is)<h[1-3][^>]*>\s*Gabarito(?:\s+docente)?\s*</h[1-3]>') { throw "Módulo $id sem gabarito no HTML integrado." }
    if (($html -notmatch 'Atividade Ass.ncrona' -and $html -notmatch 'Atividade EAD') -or $html -notmatch 'Desafio opcional') { throw "Módulo $id sem parte EAD ou desafio opcional." }
    if ([regex]::Matches($html, '<details\b', 'IgnoreCase').Count -ne 5) { throw "Módulo $id precisa de cinco gabaritos expansíveis." }
    if ([regex]::Matches($html, '<table\b', 'IgnoreCase').Count -lt 10) { throw "Módulo $id precisa de quadros dos exercícios, testes de mesa e roteiro EAD." }
    if ($number -ge 2) {
        if ([regex]::Matches($html, '<table\s+class="trace"', 'IgnoreCase').Count -ne 5) { throw "Módulo $id precisa de cinco testes de mesa tabulados." }
        if ($html -match 'Valores e confer.ncia|Compare a execu..o com o caso de teste') { throw "Módulo $id contém teste de mesa genérico; rastreie variáveis e passos reais." }
    }
    if ($html -match '&lt;-|&#60;-|←') { throw "Módulo $id usa seta para atribuição no pseudocódigo." }
    $eadDuration = if ($number -le 4) { '2h15' } elseif ($number -le 6) { '4h30' } else { '5h' }
    if ($html -notmatch [regex]::Escape($eadDuration)) { throw "Módulo $id sem carga EAD planejada de $eadDuration." }
    foreach ($exercise in 1..4) {
        if ($html -notmatch "Exerc.cio $exercise\s*[\u2014\u2013-]") { throw "Módulo $id sem exercício $exercise." }
    }

    $questionPath = Join-Path $module 'questionario-assincrono.xml'
    $exercisePath = Join-Path $module 'lista-exercicios-sincrona.xml'
    if (-not (Test-Path -LiteralPath $questionPath) -or -not (Test-Path -LiteralPath $exercisePath)) { throw "Módulo $id sem os dois bancos Moodle." }
    [xml]$questions = Get-Content -LiteralPath $questionPath -Raw -Encoding UTF8
    [xml]$exercises = Get-Content -LiteralPath $exercisePath -Raw -Encoding UTF8
    if (@($questions.SelectNodes('/quiz/question[@type="multichoice"]')).Count -ne 10) { throw "Módulo $id precisa de 10 questões objetivas." }
    if (@($exercises.SelectNodes('/quiz/question[@type="essay"]')).Count -ne 4) { throw "Módulo $id precisa de 4 questões discursivas." }
    & $questionValidator -Path $questionPath
    if (-not $?) { throw "Falha no questionário do módulo $id." }
    & $exerciseValidator -Path $exercisePath
    if (-not $?) { throw "Falha na lista discursiva do módulo $id." }

    foreach ($prefix in @('roteiro-video', 'video')) {
        $file = Join-Path $module "$prefix-modulo-$id-notebooklm.md"
        if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Material NotebookLM ausente: $file" }
    }
    Write-Host "Pacote do módulo $id aprovado."
}
Write-Host 'Todos os oito pacotes foram verificados.'
