# Roteiro de vídeo educativo — Módulo 5

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Estruturas de repetição  
**Duração sugerida:** 5 a 7 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir identificar uma tarefa repetida; escolher entre for, while e do while; acompanhar contador e acumulador; verificar a parada.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Uma pessoa informa N = 5 e quer a soma dos inteiros de 1 a N. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: N = 5, dentro do intervalo 1 a 100. Processamento: iniciar soma em zero e acrescentar 1, 2, 3, 4 e 5, nessa ordem. Saída esperada: Soma: 15.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar cinco voltas numeradas de 1 a 5, acumulador atualizado em cada volta.

### 3. Organizar a solução

**Narração:** Marcar início, condição, corpo e atualização do laço. Para contagem conhecida, escolher `for`; comparar verbalmente com `while`, que testa antes, e `do while`, que executa ao menos uma vez. Pseudocódigo formal não é exigido.

**Visual:** cinco voltas numeradas de 1 a 5, acumulador atualizado em cada volta.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    int n, i, soma = 0;
    scanf("%d", &n);
    for (i = 1; i <= n; i++) {
        soma = soma + i;
    }
    printf("Soma: %d\n", soma);
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `5`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 5
Saída: Soma: 15
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. Conferir inicialização em zero, atualização de `i` e condição `i <= n`. Usar N = 1 para verificar o caso mínimo do enunciado; com `i < n`, o último termo ficaria fora. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Iteração | `i` | `soma` antes | `soma` depois |
|---|---:|---:|---:|
| início | — | — | 0 |
| 1 | 1 | 0 | 1 |
| 2 | 2 | 1 | 3 |
| 3 | 3 | 3 | 6 |
| 4 | 4 | 6 | 10 |
| 5 | 5 | 10 | 15 |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Comparar `for` para número conhecido de repetições, `while` para continuar enquanto uma condição é verdadeira e `do while` quando o corpo deve rodar antes da primeira verificação. Mostrar as três formas sem exigir que o mesmo problema use todas. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Preveja a soma para N = 6 antes de executar. Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 5 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `5` e resultado `Soma: 15` coerentes com o teste de mesa.
- Não introduzir vetores nem funções próprias.
