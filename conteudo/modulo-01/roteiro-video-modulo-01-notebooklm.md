# Roteiro de vídeo educativo — Módulo 1

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes, sem experiência prévia em programação  
**Uso:** adicionar este arquivo como fonte no NotebookLM e usar a instrução ao final para gerar um vídeo explicativo.  
**Escopo:** lógica e algoritmos, representações, entrada, processamento e saída, variáveis `int` e `float`, atribuição, operações aritméticas básicas e primeira execução em C.

## Objetivos de aprendizagem

Ao final do vídeo, espera-se que o estudante consiga:

- explicar que um algoritmo é uma sequência finita e organizada de instruções para resolver um problema;
- separar um problema simples em entradas, processamento e saídas;
- reconhecer pseudocódigo, fluxograma e código C como maneiras de representar uma solução;
- relacionar valores inteiros e reais aos tipos `int` e `float` e aos formatos `%d` e `%f` usados nos exemplos;
- acompanhar a atribuição e uma operação aritmética em um algoritmo sequencial;
- executar um programa simples e conferir seu resultado por teste de mesa.

## Roteiro narrado e visual

### 1. Abertura: da situação ao algoritmo

**Narração**  
Imagine que uma oficina precisa calcular o custo de um pequeno lote de componentes. A pessoa informa quantas peças serão usadas e o preço de cada peça. O programa deve calcular o total e apresentá-lo. Como podemos transformar essa tarefa em instruções claras para o computador?

Programar começa antes de escrever código. Primeiro entendemos o problema: quais dados temos, o que precisamos fazer com eles e qual resultado queremos obter. Um algoritmo organiza essa solução em passos precisos, finitos e executáveis na ordem prevista.

**Visual sugerido**  
Mostrar a situação da oficina e, em seguida, três cartões: “dados disponíveis”, “cálculo” e “resultado”. Apresentar a pergunta: “Como calcular o custo total?”.

### 2. Decompor: entrada, processamento e saída

**Narração**  
Neste exemplo, a entrada é a quantidade de componentes e o preço por unidade. O processamento multiplica esses valores. A saída é o custo total. Essa organização — entrada, processamento e saída — ajuda a evitar que algum dado ou etapa importante fique de fora.

Podemos conferir a ideia com oito componentes a setenta e cinco centavos cada. O cálculo é oito vezes zero vírgula setenta e cinco, que resulta em seis reais. Ainda não precisamos de código para entender a solução.

**Visual sugerido**  
Exibir o quadro:

| Entrada | Processamento | Saída |
|---|---|---|
| quantidade = 8; preço unitário = 0,75 | custo total = quantidade × preço unitário | custo total = 6,00 |

Animar os dados seguindo as setas “Entrada → Processamento → Saída”.

### 3. Representar a solução

**Narração**  
Uma mesma solução pode ser representada de diferentes maneiras. Em pseudocódigo, descrevemos os passos com palavras e uma estrutura organizada. Em um fluxograma, mostramos o fluxo com símbolos e setas. Em C, escrevemos instruções de uma linguagem de programação que o ambiente pode compilar e executar.

As representações ajudam a tornar a lógica visível. Para este curso, nos primeiros módulos, vamos praticar o pseudocódigo estruturado antes de implementar em C. A ideia central permanece a mesma: receber os dados, calcular e mostrar o resultado.

**Visual sugerido**  
Apresentar três colunas: uma lista de passos em pseudocódigo, um fluxograma simples “Início → Ler dados → Calcular total → Mostrar total → Fim” e o código C que aparecerá mais adiante. Não adicionar decisões ou repetições ao fluxograma.

### 4. Pseudocódigo estruturado

**Narração**  
Vamos escrever primeiro os passos em pseudocódigo. Declaramos nomes para os dados, lemos a quantidade e o preço, calculamos o total e apresentamos o resultado. As instruções aparecem na ordem em que devem ser realizadas.

```text
Algoritmo CustoComponentes
    Declare quantidade como inteiro
    Declare precoUnitario, custoTotal como real

    Leia quantidade
    Leia precoUnitario
    custoTotal = quantidade * precoUnitario
    Escreva custoTotal
FimAlgoritmo
```

**Visual sugerido**  
Revelar uma linha por vez. Destacar `Leia` como entrada, a atribuição de `custoTotal` como processamento e `Escreva` como saída. Explicar que, no pseudocódigo deste curso, `=` representa a atribuição do resultado da expressão à variável. Este exemplo não usa comparações.

### 5. Variáveis e operações

**Narração**  
Os nomes `quantidade`, `precoUnitario` e `custoTotal` identificam variáveis: espaços nomeados nos quais o programa mantém valores durante a execução. O tipo indica que espécie de valor esperamos. Aqui, `quantidade` é inteira e pode ser representada com `int`. Preços e totais podem ter parte decimal, então usamos `float`.

Uma atribuição guarda o resultado de uma expressão em uma variável. Na linha do cálculo, o programa multiplica a quantidade pelo preço unitário e atribui o resultado a `custoTotal`. A multiplicação é uma operação aritmética; a ordem das instruções também importa, porque os dados precisam ser lidos antes de usá-los no cálculo.

**Visual sugerido**  
Mostrar cartões identificados `quantidade: int`, `precoUnitario: float` e `custoTotal: float`. Atualizar o cartão `custoTotal` de vazio para `6.00` depois da multiplicação. Evitar explicações sobre endereços de memória ou detalhes internos de armazenamento.

### 6. Implementação inicial em C

**Narração**  
Agora traduzimos os mesmos passos para C. O programa inclui a biblioteca padrão de entrada e saída, começa a executar em `main`, lê os dados com `scanf`, faz a atribuição do cálculo e apresenta o resultado com `printf`.

Observe a correspondência entre os tipos e os formatos de leitura: `%d` para um `int` e `%f` para um `float` em `scanf`. O símbolo `&` antes do nome da variável em cada chamada a `scanf` faz parte da forma de leitura usada neste exemplo. Para mostrar um valor real com duas casas decimais, usamos `%.2f` em `printf`.

```c
#include <stdio.h>

int main(void) {
    int quantidade;
    float precoUnitario;
    float custoTotal;

    scanf("%d", &quantidade);
    scanf("%f", &precoUnitario);

    custoTotal = quantidade * precoUnitario;

    printf("Custo total: %.2f\n", custoTotal);

    return 0;
}
```

**Visual sugerido**  
Exibir o código em fonte monoespaçada, com linhas curtas e sem animações sobre os caracteres. Destacar por etapas: declaração das variáveis, leitura, cálculo e saída. Mostrar separadamente a entrada de exemplo (`8` e `0.75`) e a saída (`Custo total: 6.00`).

### 7. Execução, teste de mesa e depuração

**Narração**  
Escrever o programa não encerra a solução. Precisamos executá-lo com dados conhecidos e verificar se o resultado faz sentido. Um teste de mesa acompanha os valores das variáveis passo a passo.

Com quantidade igual a oito e preço unitário igual a zero vírgula setenta e cinco, depois da leitura temos esses valores nas variáveis. O cálculo produz seis. A saída esperada é “Custo total: 6.00”. Se o resultado obtido for diferente, voltamos às etapas: conferimos os dados, os tipos, a fórmula, a atribuição e a forma de exibição. Essa investigação e correção fazem parte da depuração.

**Visual sugerido**  
Preencher esta tabela em sequência:

| Etapa | `quantidade` | `precoUnitario` | `custoTotal` | Observação |
|---|---:|---:|---:|---|
| Leitura | 8 | 0.75 | — | Dados recebidos |
| Cálculo | 8 | 0.75 | 6.00 | 8 × 0.75 |
| Saída | 8 | 0.75 | 6.00 | Exibir com duas casas decimais |

### 8. Síntese e desafio

**Narração**  
Retome o caminho completo: entendemos o problema, identificamos entrada, processamento e saída, descrevemos um algoritmo, representamos os passos, implementamos em C, executamos e conferimos o resultado com um teste de mesa.

Para praticar, pense em um programa que leia a quantidade de cadernos comprados e o preço de cada caderno. Que variáveis você usaria? Qual cálculo produziria o custo total? Qual seria a saída? Antes de programar, registre a entrada, o processamento e a saída; depois escreva o pseudocódigo e implemente a solução sequencial em C.

**Visual sugerido**  
Encerrar com a sequência “Problema → Representação → Execução → Teste de mesa e depuração” e apresentar o desafio sem revelar uma solução pronta.

## Instrução para personalizar a geração no NotebookLM

Copie e cole o texto abaixo na personalização do resumo em vídeo. Adicione este roteiro e os materiais do Módulo 1 como fontes do caderno.

```text
Crie um vídeo explicativo em Português do Brasil para estudantes iniciantes, sem experiência prévia em programação. Use como base somente as fontes deste caderno. O vídeo deve apresentar o tema completo do Módulo 1: lógica e algoritmos; análise de um problema em entrada, processamento e saída; pseudocódigo, fluxograma e código C como representações; variáveis int e float; atribuição e operações aritméticas básicas; entrada e saída com scanf e printf; execução, teste de mesa e depuração.

Organize a explicação nesta sequência: situação-problema concreta; decomposição em entrada, processamento e saída; apresentação da mesma solução em pseudocódigo, fluxograma e C; acompanhamento da execução com valores de exemplo; teste de mesa e conferência do resultado; síntese e desafio para o estudante. Use o exemplo de custo de componentes do roteiro e preserve os valores e resultados apresentados nas fontes.

Mantenha o nível introdutório e explique os termos antes de usá-los. Não introduza condicionais, repetições, vetores, funções, ponteiros ou tópicos de módulos posteriores. O pseudocódigo deve aparecer antes da implementação em C. Mostre a sequência problema → representação → execução → depuração/teste de mesa.

Todo o áudio, a narração e os textos visíveis devem estar em Português do Brasil. Quando exibir C, preserve exatamente a sintaxe e os caracteres do código fornecido nas fontes, incluindo #include <stdio.h>, aspas retas, ponto e vírgula, especificadores de formato, & em scanf, indentação e quebras de linha. Não invente nem reconstrua código a partir de imagens: use o código como texto. Se algum trecho não puder ser reproduzido com exatidão, explique-o verbalmente sem apresentar uma versão de código potencialmente incorreta.

Use formato explicativo horizontal 16:9 e estilo visual simples de quadro branco ou minimalista, com alto contraste, diagramas limpos e código em fonte monoespaçada legível. Reduza elementos decorativos. Termine com uma síntese curta e um desafio de custo total, sem fornecer a resposta do desafio.
```

## Conferência do vídeo gerado

Antes de usar o vídeo com a turma, confira se:

- a narração e os textos estão em Português do Brasil;
- a explicação permanece no escopo do Módulo 1;
- problema, representação, execução e teste de mesa aparecem nessa ordem;
- o pseudocódigo e o código C correspondem à solução explicada;
- o código exibido preserva os caracteres, formatos e a indentação do código-fonte;
- os valores `8` e `0.75` produzem o custo total `6.00` no exemplo.
