# Roteiro de vídeo educativo — Módulo 6

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Vetores, indexação e iteração  
**Duração sugerida:** 5 a 7 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir identificar cinco posições de índice 0 a 4; percorrer o vetor; calcular média e contar valores acima dela; evitar acesso fora dos limites.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Registrar cinco temperaturas e calcular a média das leituras. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: temperaturas 20, 22, 24, 26 e 28. Processamento: primeiro percurso lê as cinco posições do vetor; segundo percurso soma 20 + 22 + 24 + 26 + 28 = 120; dividir por 5 resulta em 24. Saída esperada: Media: 24.00.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar cinco caixas numeradas 0 a 4, setas de leitura e uma segunda passagem para a soma.

### 3. Organizar a solução

**Narração:** Desenhar cinco posições, índices 0 a 4. Separar o percurso de leitura do percurso de soma, conforme a atividade. Pseudocódigo formal não é exigido.

**Visual:** cinco caixas numeradas 0 a 4, setas de leitura e uma segunda passagem para a soma.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    float temp[5], soma = 0.0f;
    int i;
    for (i = 0; i < 5; i++) {
        scanf("%f", &temp[i]);
    }
    for (i = 0; i < 5; i++) {
        soma += temp[i];
    }
    printf("Media: %.2f\n", soma / 5.0f);
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `20 22 24 26 28`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 20 22 24 26 28
Saída: Media: 24.00
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. Conferir índices de 0 a 4, `i < 5` nos dois percursos e soma iniciada em zero. O índice 5 já está fora do vetor. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Índice | `temp[i]` | Soma após o segundo percurso |
|---:|---:|---:|
| 0 | 20 | 20 |
| 1 | 22 | 42 |
| 2 | 24 | 66 |
| 3 | 26 | 92 |
| 4 | 28 | 120 |
| Média | — | 120 / 5 = 24 |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Depois da média, mostrar que o mesmo percurso serve para localizar o menor valor, inverter a exibição e contar elementos que atendem a uma condição, conforme os outros exercícios. Diferenciar quantidade de elementos e último índice. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Qual seria a média se a última temperatura fosse 33? Refaça a soma antes da divisão. Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 6 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `20 22 24 26 28` e resultado `Media: 24.00` coerentes com o teste de mesa.
- Não incluir matrizes, strings, alocação dinâmica, ponteiros explícitos nem funções com vetores.
