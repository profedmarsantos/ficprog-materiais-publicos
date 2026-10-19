# Roteiro de vídeo educativo — Módulo 2

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Variáveis, atribuição e operações aritméticas  
**Duração sugerida:** 4 a 6 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir escolher tipos adequados para dados inteiros e reais, distinguir divisão inteira e resto, acompanhar atribuições e conferir expressões aritméticas.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Uma loja precisa organizar 127 parafusos em caixas que comportam 12 unidades cada. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: total 127 e capacidade 12, ambos inteiros e com capacidade positiva. Processamento: 127 / 12 fornece 10 caixas completas e 127 % 12 fornece 7 unidades restantes. Saída esperada: Caixas: 10; sobra: 7.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar doze parafusos por caixa, dez caixas completas e sete soltos; quadro separado para quociente e resto.

### 3. Pseudocódigo estruturado

**Narração:** A solução identifica entrada e saída, formaliza a divisão inteira e o resto em pseudocódigo estruturado e só então passa a C. Ler as instruções e relacionar tipos, cálculos e saída ao problema.

```text
VAR
    inteiro total, capacidade, caixas, sobra
INÍCIO
    leia(total, capacidade)
    caixas <- total / capacidade
    sobra <- total % capacidade
    escreva(caixas, sobra)
FIM
```

**Visual:** Revelar uma instrução por vez. O pseudocódigo vem antes da implementação em C.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    int total, capacidade, caixas, sobra;
    scanf("%d %d", &total, &capacidade);
    caixas = total / capacidade;
    sobra = total % capacidade;
    printf("Caixas: %d; sobra: %d\n", caixas, sobra);
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `127 12`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 127 12
Saída: Caixas: 10; sobra: 7
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. Conferir se a capacidade foi lida como 12, se a divisão inteira ficou em 10 e se a sobra é 7; 10 × 12 + 7 deve recompor 127. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Etapa | total | capacidade | caixas | sobra |
|---|---:|---:|---:|---:|
| Leitura | 127 | 12 | — | — |
| Divisão inteira | 127 | 12 | 10 | — |
| Resto | 127 | 12 | 10 | 7 |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Depois do caso inteiro, retomar os outros exercícios da atividade: média de três medições reais com parênteses, pagamento de horas extras e ordem das atribuições. Comparar divisão inteira de `int` com divisão real de `float` sem alterar o resultado das caixas. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Quantas caixas completas e unidades soltas resultam de 128 parafusos, com capacidade 12? Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 2 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `127 12` e resultado `Caixas: 10; sobra: 7` coerentes com o teste de mesa.
- Não introduzir condicionais, laços, vetores nem funções próprias.
