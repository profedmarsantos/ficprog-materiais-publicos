# Roteiro de vídeo educativo — Módulo 8

**Curso:** Lógica de Programação Básica e Construção de Algoritmos  
**Público:** estudantes iniciantes que já estudaram os módulos anteriores  
**Tema:** Integração de algoritmos e aplicações práticas  
**Duração sugerida:** 6 a 8 minutos  
**Uso:** adicionar este arquivo e a atividade integrada como fontes textuais do NotebookLM

## Objetivos

Ao final, o estudante deve conseguir decompor uma aplicação pequena; integrar condição e laço; rastrear saldo entre operações; reconhecer onde vetores e funções podem organizar extensões do módulo.

## Roteiro narrado e visual

### 1. Situação-problema

**Narração:** Simular um caixa eletrônico com saldo inicial 100 e três pedidos de saque: 30, 80 e 20. Vamos primeiro compreender os dados, as regras e o resultado esperado.

**Visual:** Apresentar a situação concreta, sem mostrar código neste momento.

### 2. Entradas, processamento e saídas

**Narração:** Entradas: saldo inicial 100; pedidos 30, 80 e 20. Processamento: em cada pedido, aceitar somente valor positivo que não ultrapasse o saldo corrente; subtrair e contar apenas os saques aceitos. Saída esperada: Saques aceitos: 2; saldo: R$ 50.00.

**Visual:** Preencher “Entrada → Processamento → Saída”, pedir uma previsão e usar painel de saldo, três pedidos sequenciais e tabela de aceitação.

### 3. Organizar a solução

**Narração:** Montar tabela de saldo antes, pedido, condição, contagem e saldo depois. O programa percorre três pedidos sem guardar dados bancários reais. Pseudocódigo formal não é exigido.

**Visual:** painel de saldo, três pedidos sequenciais e tabela de aceitação.

### 4. Programa em C

**Narração:** Exibir o código completo abaixo, exatamente como consta no gabarito da atividade integrada. Relacionar cada trecho à análise anterior; se não couber em um quadro, usar quadros consecutivos sem trocar caracteres.

```c
#include <stdio.h>

int main(void) {
    float saldo, saque;
    int i, aceitos = 0;
    scanf("%f", &saldo);
    for (i = 0; i < 3; i++) {
        scanf("%f", &saque);
        if (saque > 0.0f && saque <= saldo) {
            saldo = saldo - saque;
            aceitos++;
        }
    }
    printf("Saques aceitos: %d; saldo: R$ %.2f\n", aceitos, saldo);
    return 0;
}
```

**Visual:** Usar fonte monoespaçada grande. Destacar entradas, operações, condições ou laços, quando presentes, e a saída.

### 5. Execução

**Narração:** Digitar a entrada `100 30 80 20`, executar e comparar com a previsão. A entrada e a saída devem aparecer separadas.

```text
Entrada: 100 30 80 20
Saída: Saques aceitos: 2; saldo: R$ 50.00
```

### 6. Teste de mesa e depuração

**Narração:** Acompanhar os valores na ordem real de execução. O segundo pedido excede o saldo 70 e deve ser recusado. Testar também saque igual ao saldo, zero e valor negativo; conferir atualização e contagem somente no ramo aceito. Quando o resultado divergir, localizar a primeira etapa em que os valores deixam de corresponder à previsão.

| Pedido | Saldo antes | Teste | Aceitos | Saldo depois |
|---:|---:|---|---:|---:|
| 30 | 100.00 | aceito | 1 | 70.00 |
| 80 | 70.00 | recusado | 1 | 70.00 |
| 20 | 70.00 | aceito | 2 | 50.00 |

**Visual:** Preencher uma linha por vez e destacar apenas a variável ou condição alterada.

### 7. Ampliar o tema

**Narração:** Relacionar o mesmo método aos outros exercícios: abastecimento com desconto, controle de estacionamento e painel de medições. No painel, um vetor guarda cinco leituras e uma função simples decide se cada leitura atinge o limite; assim, os recursos dos módulos anteriores são integrados. Arduino em código textual no Tinkercad Circuits é exploração opcional, sem questão ou avaliação. Usar os outros exercícios da atividade como apoio, sem transformar o vídeo numa coleção de soluções prontas.

**Visual:** Esquema curto que relacione os conceitos do módulo ao problema inicial.

### 8. Síntese e desafio

**Narração:** Retomar problema → representação adequada → implementação em C → execução → teste de mesa e depuração. Quantos saques seriam aceitos se o terceiro pedido fosse 70? Qual seria o saldo final? Deixar a resposta para a prática do estudante.

**Visual:** Reunir os cartões de entrada, processamento e saída e encerrar com a pergunta.

## Conferência do vídeo gerado

- Narração e textos em Português do Brasil.
- Tema completo do Módulo 8 explicado sem antecipar tópicos posteriores.
- Código copiado literalmente da fonte textual, com `scanf`, `printf`, operadores, chaves e pontuação legíveis.
- Caso `100 30 80 20` e resultado `Saques aceitos: 2; saldo: R$ 50.00` coerentes com o teste de mesa.
- Não usar arquivos, redes, dados bancários reais, hardware obrigatório, ponteiros ou bibliotecas complexas. Não cobrar Arduino.
