# Roteiro de vídeo educativo — Módulo 7

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Funções com parâmetros, retorno e composição  
**Duração sugerida:** 5 a 7 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir separar cálculos em funções simples, passar argumentos por valor, acompanhar retornos e explicar como uma função chama outra.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Uma oficina compra seis componentes a R$ 2,50 cada e paga R$ 3,00 de frete. Queremos mostrar o custo dos itens e o total com frete. Antes do código, separemos dados, cálculos e saídas.

**Visual:** Mostrar seis componentes, o preço unitário e o frete em cartões distintos.

### 2. Entradas, processamento e saídas

**Narração:** As entradas são quantidade 6, preço 2,50 e frete 3,00. `custoItens` multiplica quantidade por preço e retorna 15,00. `custoTotal` chama `custoItens`, acrescenta o frete e retorna 18,00. As saídas são “Itens: R$ 15.00; total: R$ 18.00”.

**Visual:** Quadro “Entradas → Custo dos itens → Total com frete → Saídas”. Mostrar as duas quantias sem misturá-las.

### 3. Organizar as funções

**Narração:** Cada função recebe parâmetros simples por valor e devolve um resultado. `main` chama `custoItens(6, 2.50)` para obter o subtotal. Depois chama `custoTotal(6, 2.50, 3.00)`. Dentro dessa segunda função, `custoItens` é chamado novamente. O retorno de 15,00 é somado ao frete 3,00. O pseudocódigo formal não é exigido neste módulo.

**Visual:** Desenhar duas setas de `main`: uma para `custoItens` e outra para `custoTotal`. Da caixa `custoTotal`, desenhar uma seta para `custoItens` e uma seta de retorno marcada 18,00.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Apontar assinatura, parâmetros, retorno e chamadas, sem alterar a ordem nem os caracteres do programa.

```c
#include <stdio.h>

float custoItens(int quantidade, float preco) {
    return quantidade * preco;
}

float custoTotal(int quantidade, float preco, float frete) {
    return custoItens(quantidade, preco) + frete;
}

int main(void) {
    int quantidade;
    float preco, frete, itens, total;
    scanf("%d %f %f", &quantidade, &preco, &frete);
    itens = custoItens(quantidade, preco);
    total = custoTotal(quantidade, preco, frete);
    printf("Itens: R$ %.2f; total: R$ %.2f\n", itens, total);
    return 0;
}
```

**Visual:** Fonte monoespaçada grande. Se o código não couber, dividir em quadros consecutivos, preservando todas as linhas.

### 5. Execução

**Narração:** Digitar a entrada `6 2.50 3.00`. A primeira chamada produz 15,00; a segunda produz 18,00. Comparar a previsão com a saída exibida.

```text
Entrada: 6 2.50 3.00
Saída: Itens: R$ 15.00; total: R$ 18.00
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os argumentos e o retorno em cada chamada. Se o total não for 18,00, conferir o frete lido, a chamada interna de `custoItens` e a atribuição a `total`. Localizar a primeira etapa que diverge da previsão.

| Etapa | Argumentos ou dados | Retorno | Valor em `main` |
|---|---|---:|---|
| Leitura | 6, 2.50, 3.00 | — | entradas disponíveis |
| `custoItens` chamado por `main` | 6, 2.50 | 15.00 | `itens = 15.00` |
| `custoItens` chamado por `custoTotal` | 6, 2.50 | 15.00 | sem nova atribuição direta |
| `custoTotal` | 6, 2.50, 3.00 | 18.00 | `total = 18.00` |
| Saída | — | — | itens 15.00; total 18.00 |

**Visual:** Percorrer a tabela linha por linha, destacando a segunda chamada de `custoItens`.

### 7. Ampliar o tema

**Narração:** As outras atividades usam a mesma ideia para calcular área, escolher o maior valor e organizar soluções em funções simples. O nome da função deve indicar sua responsabilidade; os argumentos e o retorno devem corresponder ao resultado esperado.

**Visual:** Mostrar, sem resolver outro exercício, que diferentes problemas podem ser divididos em funções com entradas e saídas claras.

### 8. Síntese e desafio

**Narração:** Retomar problema → organização das funções → C → execução → teste de mesa e depuração. Qual seria o custo dos itens e o total com frete se fossem quatro componentes a R$ 2,50, mantendo o frete de R$ 3,00? Deixar a resposta para o estudante.

**Visual:** Encerrar com os dois resultados a prever, sem mostrá-los prontos.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- As duas funções, suas chamadas e os retornos aparecem na sequência correta.
- O código exibido corresponde literalmente ao primeiro exercício da atividade integrada.
- O caso `6 2.50 3.00` produz `Itens: R$ 15.00; total: R$ 18.00`.
- Não usar parâmetros por referência, ponteiros, recursão ou bibliotecas complexas.
