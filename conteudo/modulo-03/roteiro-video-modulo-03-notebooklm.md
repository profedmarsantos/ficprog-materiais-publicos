# Roteiro de vídeo educativo — Módulo 3

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Estrutura sequencial e múltiplas entradas e saídas  
**Duração sugerida:** 4 a 6 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir organizar várias entradas; calcular subtotais na ordem correta; exibir saídas identificadas; conferir valores intermediários.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Uma oficina registra duas peças de uma ordem de serviço e o valor da mão de obra. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: quantidade 2 e preço 12,50 para a primeira peça; quantidade 3 e preço 4,00 para a segunda; mão de obra 20,00. Processamento: primeiro parcial 2 × 12,50 = 25,00; segundo parcial 3 × 4,00 = 12,00; total = 25,00 + 12,00 + 20,00 = 57,00. Saída esperada: Peca 1: R$ 25.00; peca 2: R$ 12.00; total: R$ 57.00.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar ordem de serviço com cinco entradas, dois parciais e a soma final.

### 3. Organizar a solução

**Narração:** Montar um quadro de entradas, cálculos e saídas e setas de dependência: preços e quantidades → subtotais → total de peças → total da ordem. O pseudocódigo pode ser apenas esboçado; sua escrita formal não é exigida.

**Visual:** ordem de serviço com cinco entradas, dois parciais e a soma final.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    int q1, q2;
    float p1, p2, maoObra, parcial1, parcial2, total;
    scanf("%d %f %d %f %f", &q1, &p1, &q2, &p2, &maoObra);
    parcial1 = q1 * p1;
    parcial2 = q2 * p2;
    total = parcial1 + parcial2 + maoObra;
    printf("Peca 1: R$ %.2f; peca 2: R$ %.2f; total: R$ %.2f\n",
           parcial1, parcial2, total);
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `2 12.50 3 4.00 20.00`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 2 12.50 3 4.00 20.00
Saída: Peca 1: R$ 25.00; peca 2: R$ 12.00; total: R$ 57.00
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. Se o total não for 57, conferir quantidades, preços, cada parcial e a inclusão dos 20 de mão de obra; observar a ordem das atribuições. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Etapa | parcial1 | parcial2 | total |
|---|---:|---:|---:|
| Leitura | — | — | — |
| Primeira multiplicação | 25.00 | — | — |
| Segunda multiplicação | 25.00 | 12.00 | — |
| Soma com mão de obra | 25.00 | 12.00 | 57.00 |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Generalizar o mesmo raciocínio para qualquer problema sequencial com múltiplos dados e resultados parciais. Mostrar por que ler todos os dados antes de usar cada variável evita valores indefinidos. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Qual seria o novo total se a mão de obra fosse 25,00? Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 3 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `2 12.50 3 4.00 20.00` e resultado `Peca 1: R$ 25.00; peca 2: R$ 12.00; total: R$ 57.00` coerentes com o teste de mesa.
- Não incluir decisões, laços, vetores ou funções próprias.
