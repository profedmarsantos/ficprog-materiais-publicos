<!-- Gerado automaticamente a partir do HTML; edite o HTML fonte. -->

Atividade Presencial

# Atividade Presencial — Módulo 1

2 h · trabalho individual com conferência em dupla

**Objetivo.** Transformar situações-problema em algoritmos sequenciais. Em cada exercício, identifique as entradas, descreva o processamento, apresente a saída, escreva o pseudocódigo e implemente a solução em C.

## Como resolver cada exercício

1.  Complete o quadro **Entrada → Processamento → Saída**.
2.  Escreva o algoritmo em pseudocódigo estruturado.
3.  Implemente em C usando somente `#include <stdio.h>`, `int`, `float`, `scanf`, `printf` e atribuição.
4.  Execute o programa com o caso de teste indicado e registre o resultado.
5.  Compare a saída obtida com o resultado esperado antes de passar ao próximo item.

**Nesta lista não use** `if`, `else`, `for`, `while`, vetores ou funções. O foco é a sequência de instruções.

### Exercício 1 — Medição de temperatura

Um técnico registra a temperatura de uma estufa em graus Celsius. Faça um programa que leia a temperatura e a mostre com **uma casa decimal**.

| Entrada | Processamento | Saída |
|----|----|----|
| Temperatura da estufa (`float`). | Ler a temperatura; não há cálculo adicional. | Temperatura registrada com uma casa decimal. |

**Caso de teste:** entrada `23.78` → saída esperada: `Temperatura registrada: 23.8 C`.

### Exercício 2 — Custo de componentes

Para preparar um kit, foram separados vários componentes de mesmo preço. Leia a quantidade inteira de componentes e o preço unitário, calcule e mostre o custo total do kit com duas casas decimais.

| Entrada | Processamento | Saída |
|----|----|----|
| Quantidade de componentes (`int`) e preço unitário (`float`). | `custoTotal = quantidade * precoUnitario`. | Custo total do kit com duas casas decimais. |

**Caso de teste:** quantidade `8`, preço unitário `0.75` → saída esperada: `Custo total: R$ 6.00`.

### Exercício 3 — Volume de um reservatório

Uma torneira adiciona 30 litros de água por minuto a um reservatório. Leia o número inteiro de minutos em que a torneira ficará aberta e mostre o volume adicionado.

| Entrada | Processamento | Saída |
|----|----|----|
| Quantidade de minutos (`int`). | `volume = 30 * minutos`. | Volume adicionado, em litros. |

**Caso de teste:** minutos `7` → saída esperada: `Volume adicionado: 210 litros`.

### Exercício 4 — Estimativa de consumo de energia

Uma conta possui uma taxa fixa, somada ao consumo em kWh multiplicado pelo preço de cada kWh. Leia os três valores e calcule: `valor total = taxa fixa + (consumo em kWh × preço por kWh)`.

| Entrada | Processamento | Saída |
|----|----|----|
| Taxa fixa, consumo em kWh e preço por kWh (`float`). | `valorTotal = taxaFixa + (consumoKwh * precoKwh)`. | Valor total da conta com duas casas decimais. |

**Caso de teste:** taxa fixa `12.50`, consumo `85.0`, preço por kWh `0.90` → saída esperada: `Valor total: R$ 89.00`.

### Desafio opcional — Troca de posições

Duas variáveis inteiras, `a` e `b`, armazenam posições de dois itens em uma fila. Leia os dois valores e troque-os usando uma terceira variável chamada `aux`. Mostre os valores finais.

**Caso de teste:** `a = 10` e `b = 25` → saída esperada: `a = 25 e b = 10`.

## Entrega e conferência

- Apresente o pseudocódigo e o código C dos quatro exercícios obrigatórios.
- Mostre o resultado do caso de teste de cada exercício.
- Explique oralmente por que cada variável foi declarada como `int` ou `float`.

Atividade Assíncrona

# Atividade Assíncrona — Módulo 1

2h15 · estudo individual orientado após o encontro presencial

## Roteiro da atividade assíncrona

Esta atividade assíncrona consolida as aprendizagens do Módulo 1. Siga os dois blocos na ordem indicada.

<table>
<thead>
<tr>
<th>Ordem</th>
<th>Bloco</th>
<th>Duração</th>
<th>Resultado esperado</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>Revisão pessoal orientada</td>
<td>1h30</td>
<td>Retomar entradas, processamento, saídas, tipos, atribuição e operações básicas.</td>
</tr>
<tr>
<td>2</td>
<td>Questionário Moodle</td>
<td>45 min</td>
<td>Enviar uma tentativa e consultar os feedbacks.</td>
</tr>
<tr>
<td colspan="2">Total da atividade assíncrona</td>
<td>2h15</td>
<td>—</td>
</tr>
</tbody>
</table>

### 1. Revisão pessoal orientada — Módulo 1 · 1h30

1.  Retome as anotações, os exemplos e os exercícios desta lista.
2.  Para cada problema, identifique as entradas, o processamento e a saída antes de observar o código.
3.  Reconstrua ou execute os exemplos em C; confira tipos, `scanf`, `printf`, atribuições e operações.
4.  Faça pelo menos um teste de mesa, comparando o resultado calculado com a saída do programa.
5.  Consulte o [painel de referência rápida de C](../dicas/painel-referencia-rapida-c.html) e anote dúvidas para o próximo encontro.

### 2. Questionário Moodle · 45 min

Responda ao questionário objetivo do Módulo 1. Há uma tentativa; envie-a e leia os feedbacks de todas as alternativas.

Use os feedbacks dos questionários para orientar a retomada dos conteúdos no próximo encontro.
