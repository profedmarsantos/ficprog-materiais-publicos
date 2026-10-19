<!-- Gerado automaticamente a partir do HTML; edite o HTML fonte. -->

# Atividade integrada — Módulo 1

Atividade Presencial

## Atividade Presencial — Módulo 1

2 h · trabalho individual com conferência em dupla

**Objetivo.** Transformar situações-problema em algoritmos sequenciais. Em cada exercício, identifique as entradas, descreva o processamento, apresente a saída, escreva o pseudocódigo e implemente a solução em C.

### Como resolver cada exercício

1.  Complete o quadro **Entrada → Processamento → Saída**.
2.  Escreva o algoritmo em pseudocódigo estruturado.
3.  Implemente em C usando somente `#include <stdio.h>`, `int`, `float`, `scanf`, `printf` e atribuição.
4.  Execute o programa com o caso de teste indicado e registre o resultado.
5.  Compare a saída obtida com o resultado esperado antes de passar ao próximo item.

**Nesta lista não use** `if`, `else`, `for`, `while`, vetores ou funções. O foco é a sequência de instruções.

#### Exercício 1 — Medição de temperatura

Um técnico registra a temperatura de uma estufa em graus Celsius. Faça um programa que leia a temperatura e a mostre com **uma casa decimal**.

| Entrada | Processamento | Saída |
|----|----|----|
| Temperatura da estufa (`float`). | Ler a temperatura; não há cálculo adicional. | Temperatura registrada com uma casa decimal. |

**Caso de teste:** entrada `23.78` → saída esperada: `Temperatura registrada: 23.8 C`.

#### Exercício 2 — Custo de componentes

Para preparar um kit, foram separados vários componentes de mesmo preço. Leia a quantidade inteira de componentes e o preço unitário, calcule e mostre o custo total do kit com duas casas decimais.

| Entrada | Processamento | Saída |
|----|----|----|
| Quantidade de componentes (`int`) e preço unitário (`float`). | `custoTotal = quantidade * precoUnitario`. | Custo total do kit com duas casas decimais. |

**Caso de teste:** quantidade `8`, preço unitário `0.75` → saída esperada: `Custo total: R$ 6.00`.

#### Exercício 3 — Volume de um reservatório

Uma torneira adiciona 30 litros de água por minuto a um reservatório. Leia o número inteiro de minutos em que a torneira ficará aberta e mostre o volume adicionado.

| Entrada | Processamento | Saída |
|----|----|----|
| Quantidade de minutos (`int`). | `volume = 30 * minutos`. | Volume adicionado, em litros. |

**Caso de teste:** minutos `7` → saída esperada: `Volume adicionado: 210 litros`.

#### Exercício 4 — Estimativa de consumo de energia

Uma conta possui uma taxa fixa, somada ao consumo em kWh multiplicado pelo preço de cada kWh. Leia os três valores e calcule: `valor total = taxa fixa + (consumo em kWh × preço por kWh)`.

| Entrada | Processamento | Saída |
|----|----|----|
| Taxa fixa, consumo em kWh e preço por kWh (`float`). | `valorTotal = taxaFixa + (consumoKwh * precoKwh)`. | Valor total da conta com duas casas decimais. |

**Caso de teste:** taxa fixa `12.50`, consumo `85.0`, preço por kWh `0.90` → saída esperada: `Valor total: R$ 89.00`.

#### Desafio opcional — Troca de posições

Duas variáveis inteiras, `a` e `b`, armazenam posições de dois itens em uma fila. Leia os dois valores e troque-os usando uma terceira variável chamada `aux`. Mostre os valores finais.

**Caso de teste:** `a = 10` e `b = 25` → saída esperada: `a = 25 e b = 10`.

### Entrega e conferência

- Apresente o pseudocódigo e o código C dos quatro exercícios obrigatórios.
- Mostre o resultado do caso de teste de cada exercício.
- Explique oralmente por que cada variável foi declarada como `int` ou `float`.

### Gabarito

**Uso docente:** apresente cada solução somente após a tentativa dos estudantes. Os blocos podem ser abertos individualmente durante a correção coletiva.

### Exercício 1 — Medição de temperatura

**Entrada → processamento → saída:** temperatura real → não há cálculo adicional → temperatura com uma casa decimal.

    VAR
        real temperatura
    INÍCIO
        leia(temperatura)
        escreva(temperatura)
    FIM

    #include <stdio.h>

    int main() {
        float temperatura;
        printf("Digite a temperatura em C: ");
        scanf("%f", &temperatura);
        printf("Temperatura registrada: %.1f C\n", temperatura);
        return 0;
    }

| Passo    | temperatura | Saída                            |
|----------|-------------|----------------------------------|
| Leitura  | 23.78       | —                                |
| Exibição | 23.78       | `Temperatura registrada: 23.8 C` |

### Exercício 2 — Custo de componentes

**Entrada → processamento → saída:** quantidade inteira e preço real → `custoTotal = quantidade * precoUnitario` → custo em reais.

    VAR
        inteiro quantidade
        real precoUnitario, custoTotal
    INÍCIO
        leia(quantidade)
        leia(precoUnitario)
        custoTotal = quantidade * precoUnitario
        escreva(custoTotal)
    FIM

    #include <stdio.h>

    int main() {
        int quantidade;
        float precoUnitario, custoTotal;
        printf("Digite a quantidade de componentes: ");
        scanf("%d", &quantidade);
        printf("Digite o preco unitario: ");
        scanf("%f", &precoUnitario);
        custoTotal = quantidade * precoUnitario;
        printf("Custo total: R$ %.2f\n", custoTotal);
        return 0;
    }

| Passo    | quantidade | precoUnitario | custoTotal | Saída                  |
|----------|------------|---------------|------------|------------------------|
| Leitura  | 8          | 0.75          | —          | —                      |
| Cálculo  | 8          | 0.75          | 6.00       | —                      |
| Exibição | 8          | 0.75          | 6.00       | `Custo total: R$ 6.00` |

### Exercício 3 — Volume de um reservatório

**Entrada → processamento → saída:** minutos inteiros → `volume = 30 * minutos` → volume inteiro em litros.

    VAR
        inteiro minutos, volume
    INÍCIO
        leia(minutos)
        volume = 30 * minutos
        escreva(volume)
    FIM

    #include <stdio.h>

    int main() {
        int minutos, volume;
        printf("Digite os minutos: ");
        scanf("%d", &minutos);
        volume = 30 * minutos;
        printf("Volume adicionado: %d litros\n", volume);
        return 0;
    }

| Passo    | minutos | volume | Saída                           |
|----------|---------|--------|---------------------------------|
| Leitura  | 7       | —      | —                               |
| Cálculo  | 7       | 210    | —                               |
| Exibição | 7       | 210    | `Volume adicionado: 210 litros` |

### Exercício 4 — Estimativa de consumo de energia

**Entrada → processamento → saída:** taxa, consumo e preço reais → `valorTotal = taxaFixa + consumoKwh * precoKwh` → total em reais.

    VAR
        real taxaFixa, consumoKwh, precoKwh, valorTotal
    INÍCIO
        leia(taxaFixa)
        leia(consumoKwh)
        leia(precoKwh)
        valorTotal = taxaFixa + consumoKwh * precoKwh
        escreva(valorTotal)
    FIM

    #include <stdio.h>

    int main() {
        float taxaFixa, consumoKwh, precoKwh, valorTotal;
        printf("Digite a taxa fixa: "); scanf("%f", &taxaFixa);
        printf("Digite o consumo em kWh: "); scanf("%f", &consumoKwh);
        printf("Digite o preco por kWh: "); scanf("%f", &precoKwh);
        valorTotal = taxaFixa + consumoKwh * precoKwh;
        printf("Valor total: R$ %.2f\n", valorTotal);
        return 0;
    }

| Passo                       | taxaFixa | consumoKwh | precoKwh | valorTotal |
|-----------------------------|----------|------------|----------|------------|
| Leitura                     | 12.50    | 85.0       | 0.90     | —          |
| Multiplicação intermediária | 12.50    | 85.0       | 0.90     | 76.50      |
| Soma da taxa                | 12.50    | 85.0       | 0.90     | 89.00      |

A multiplicação ocorre antes da soma. Os parênteses podem explicitar essa intenção: `taxaFixa + (consumoKwh * precoKwh)`.

### Desafio opcional — Troca de posições

    VAR
        inteiro a, b, aux
    INÍCIO
        leia(a)
        leia(b)
        aux = a
        a = b
        b = aux
        escreva(a, b)
    FIM

    #include <stdio.h>

    int main() {
        int a, b, aux;
        printf("Digite a: "); scanf("%d", &a);
        printf("Digite b: "); scanf("%d", &b);
        aux = a;
        a = b;
        b = aux;
        printf("a = %d e b = %d\n", a, b);
        return 0;
    }

| Instrução      | a   | b   | aux |
|----------------|-----|-----|-----|
| Após a leitura | 10  | 25  | —   |
| `aux = a`      | 10  | 25  | 10  |
| `a = b`        | 25  | 25  | 10  |
| `b = aux`      | 25  | 10  | 10  |

#### Intervenções esperadas

- Contagens e minutos usam `int`; valores com casas decimais usam `float`.
- Em `scanf`, a variável é precedida de `&`; `%d` corresponde a `int` e `%f`, a `float`.
- No desafio, o teste de mesa deve acompanhar os valores após cada atribuição.

Atividade Assíncrona

## Atividade Assíncrona — Módulo 1

2h15 · estudo individual orientado após o encontro presencial

### Roteiro da atividade assíncrona

Esta atividade assíncrona consolida as aprendizagens do Módulo 1. Siga os dois blocos na ordem indicada.

<table>
<thead>
<tr>
<th scope="col">Ordem</th>
<th scope="col">Bloco</th>
<th scope="col">Duração</th>
<th scope="col">Resultado esperado</th>
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
<td colspan="2" scope="row">Total da atividade assíncrona</td>
<td>2h15</td>
<td>—</td>
</tr>
</tbody>
</table>

#### 1. Revisão pessoal orientada — Módulo 1 · 1h30

1.  Retome as anotações, os exemplos e os exercícios desta lista.
2.  Para cada problema, identifique as entradas, o processamento e a saída antes de observar o código.
3.  Reconstrua ou execute os exemplos em C; confira tipos, `scanf`, `printf`, atribuições e operações.
4.  Faça pelo menos um teste de mesa, comparando o resultado calculado com a saída do programa.
5.  Consulte o [painel de referência rápida de C](../dicas/painel-referencia-rapida-c.html) e anote dúvidas para o próximo encontro.

#### 2. Questionário Moodle · 45 min

Responda ao questionário objetivo do Módulo 1. Há uma tentativa; envie-a e leia os feedbacks de todas as alternativas.

**Registro da carga EAD:** quando o questionário for o único registro no Moodle, sua conclusão credita o bloco planejado de 2h15 do Módulo 1, incluindo o estudo orientado. Esse registro não mede o tempo real dedicado por cada estudante.

Use os feedbacks dos questionários para orientar a retomada dos conteúdos no próximo encontro.
