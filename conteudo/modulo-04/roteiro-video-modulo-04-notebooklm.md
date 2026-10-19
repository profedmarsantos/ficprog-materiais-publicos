# Roteiro de vídeo educativo — Módulo 4

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Condicionais e operadores relacionais e lógicos  
**Duração sugerida:** 5 a 7 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir ler uma condição, distinguir ramos e limites; usar if/else if/else e operadores relacionais e lógicos; testar casos de fronteira.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Uma escola já calculou a média de um estudante e quer decidir se houve aprovação. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: média 6,0. Processamento: comparar a média com 6,0; a expressão média >= 6,0 é verdadeira no limite. Saída esperada: Aprovado.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar régua de médias com fronteira 6,0 e bifurcação aprovado/recuperação.

### 3. Organizar a solução

**Narração:** Desenhar dois caminhos a partir da condição média ≥ 6. A entrada já é a média, não as notas. Pseudocódigo formal não é exigido.

**Visual:** régua de médias com fronteira 6,0 e bifurcação aprovado/recuperação.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    float media;
    scanf("%f", &media);
    if (media >= 6.0f) {
        printf("Aprovado\n");
    } else {
        printf("Em recuperacao\n");
    }
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `6.0`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 6.0
Saída: Aprovado
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. Testar 5,9, 6,0 e 6,1; `>` no lugar de `>=` rejeitaria erroneamente a fronteira. `=` atribui, `==` compara. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Média informada | Condição `media >= 6.0f` | Saída |
|---:|---|---|
| 5.9 | falsa | Em recuperacao |
| 6.0 | verdadeira | Aprovado |
| 6.1 | verdadeira | Aprovado |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Após o caso binário, estudar as outras questões da atividade: três faixas com `else if` e combinações de condições com `&&` e `||`. Conferir os limites e os ramos de cada uma. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Qual seria a saída se a média informada fosse 5,9? Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 4 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `6.0` e resultado `Aprovado` coerentes com o teste de mesa.
- Não introduzir laços, vetores ou funções próprias.
