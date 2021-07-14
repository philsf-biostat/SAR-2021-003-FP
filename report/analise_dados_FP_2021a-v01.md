---
title: "Perfil epidemiológico de pacientes aguardando na fila de revisão de ATQ em Santa Catarina"
author: '**De:** Felipe Figueiredo **Para:** Fernando Pina'
date: '**Data: ** 2021-07-14'
output:
  html_document:
    fig_caption: yes
    fig_height: 4
    fig_width: 4
    keep_md: yes
    number_sections: yes
    toc: yes
  pdf_document:
    number_sections: yes
    toc: yes
  word_document:
    fig_caption: yes
    fig_height: 4
    fig_width: 4
    reference_docx: misc/style_SAR_pt.docx
    toc: yes
subtitle: 'RELATÓRIO: analise_dados_FP_2021a-v01'
toc-title: "Sumário"
---



---

**Histórico do documento**


|Versão |Alterações     |
|:------|:--------------|
|01     |Versão inicial |

---

<!-- # Assinaturas -->

<!-- ```{r, echo=FALSE} -->
<!-- sig.field <- "__________________________" -->
<!-- date.field <- "_____________" -->
<!-- Stat <- c("Elaborador", "Nome", "Função", sig.field, date.field) -->
<!-- Reviewer <- c("Revisado por", "", "", sig.field, date.field) -->
<!-- Approver <- c("Verificado por", "", "", sig.field, date.field) -->
<!-- Final.Approver <- c("Aprovação final", "", "", sig.field, date.field) -->

<!-- sigs <- rbind( -->
<!--   Stat -->
<!--   , Reviewer -->
<!--   , Approver -->
<!--   , Final.Approver -->
<!--   ) -->
<!-- rownames(sigs) <- NULL -->
<!-- colnames(sigs) <- c("Papel", "Nome", "Função", "Assinatura", "Data") -->

<!-- # pander(sigs, split.cells = c(9, 14, 14, 16, 8), split.table = Inf) -->
<!-- kable(sigs) -->
<!-- ``` -->

# Lista de abreviaturas

# Introdução

## Objetivos

## Recepção e tratamento dos dados

# Metodologia



## Variáveis

### Desfechos primário e secundário

### Covariáveis

## Análises Estatísticas

### Softwares utilizados

Esta análise foi realizada utilizando-se o software `R` versão 4.1.0.

# Resultados

## Análise descritiva


|**Characteristic** |**N = 58** |
|:------------------|:----------|
|Idade              |63 (11)    |
|Sexo               |           |
|F                  |27 (47%)   |
|M                  |31 (53%)   |
|Escolaridade       |           |
|Não alfabetizado   |0 (0%)     |
|Fund. incompleto   |45 (78%)   |
|Fundamental        |11 (19%)   |
|Méd. incompleto    |0 (0%)     |
|Médio              |1 (1.7%)   |
|Sup. incompleto    |0 (0%)     |
|Superior           |1 (1.7%)   |
|Tabagismo          |9 (16%)    |
|Etilismo           |2 (3.4%)   |
|Aposentadoria      |           |
|Invalidez          |41 (71%)   |
|Pensionista        |1 (1.7%)   |
|Tempo De Serviço   |10 (17%)   |
|Trabalhando        |6 (10%)    |
|Renda familiar     |           |
|Até 1 SM           |46 (79%)   |
|2 a 5 SM           |10 (17%)   |
|Mais que 5 SM      |2 (3.4%)   |

Table: **Tabela 1** Características demográficas


|**Characteristic**                    |**N = 58** |
|:-------------------------------------|:----------|
|Motivo da ATQ                         |           |
|Fraturas                              |19 (33%)   |
|Coxartrose                            |29 (50%)   |
|Osteonecrose                          |1 (1.7%)   |
|Displasia                             |2 (3.4%)   |
|Outros                                |7 (12%)    |
|Deambulação                           |           |
|Livre                                 |7 (12%)    |
|Bengala                               |40 (69%)   |
|Andador                               |6 (10%)    |
|Cadeira de rodas                      |5 (8.6%)   |
|Leito                                 |0 (0%)     |
|Revisões prévias de quadril           |           |
|0                                     |4 (10%)    |
|1                                     |13 (33%)   |
|2                                     |22 (56%)   |
|Faltantes                             |19         |
|Motivo de revisões prévias            |           |
|Fratura Periprotética                 |1 (2.9%)   |
|Infecção                              |2 (5.7%)   |
|Soltura Asséptica Acetabular          |23 (66%)   |
|Soltura Asséptica Femoral             |2 (5.7%)   |
|Soltura Asséptica de Ambos            |7 (20%)    |
|Faltantes                             |23         |
|Ciurgia (não ortop.) durante a espera |3 (5.2%)   |

Table: **Tabela 2** Características clínicas relativas à ATQ


|**Characteristic**           |**N = 58**  |
|:----------------------------|:-----------|
|Tempo de espera (anos)       |3.52 (3.21) |
|Diagnóstico atual            |            |
|Fratura Periprotética        |1 (2.1%)    |
|Infecção                     |1 (2.1%)    |
|Soltura Asséptica Acetabular |34 (72%)    |
|Soltura Asséptica Femoral    |1 (2.1%)    |
|Soltura Asséptica de Ambos   |10 (21%)    |
|Faltantes                    |11          |
|Escore de Charlson           |            |
|0%                           |29 (51%)    |
|0% a 5%                      |14 (25%)    |
|5% a 10%                     |8 (14%)     |
|Maior que 10%                |6 (11%)     |
|Faltantes                    |1           |
|HHS                          |41 (15)     |
|Faltantes                    |1           |
|Classificação Paprosky       |            |
|1                            |7 (13%)     |
|2A                           |7 (13%)     |
|2B                           |8 (15%)     |
|2C                           |19 (35%)    |
|3A                           |11 (20%)    |
|3B                           |2 (3.7%)    |
|3C                           |0 (0%)      |
|Faltantes                    |4           |
|Uso de antidepressivos       |8 (14%)     |
|Número de medicações em uso  |            |
|0                            |16 (28%)    |
|1                            |19 (33%)    |
|2                            |20 (34%)    |
|3                            |3 (5.2%)    |
|Uso de analgésicos           |            |
|Nenhum                       |9 (16%)     |
|AINES                        |18 (31%)    |
|Opióides                     |9 (16%)     |
|Analgésicos                  |2 (3.4%)    |
|Vários                       |20 (34%)    |

Table: **Tabela 3** Características clínicas durante a espera








A distribuição de tempo de espera é bimodal (Fig 1), onde identifica-se dois grandes grupos de pacientes aguardando há 2 anos e 6 anos respectivamente.
Há 10 pacientes que aguardam há 2 ou 3 anos, cujas idades entre 45 e 80 anos e nos quais o diagnóstico mais comum é Soltura Asséptica Acetabular (n = 6) seguido de Soltura Asséptica de Ambos (n = 3).
Seus índices de Charlson são tipicamente baixos, HHS em torno de 44% e as classificações Paprosky mais frequentes são 2C e 3A.
Os pacientes que aguardam há 5 ou 6 anos (n = 14) tem perfil semelhante, com idades entre 44 a 83 anos e diagnóstico típico Soltura Asséptica Acetabular.
A maiorira possui índice de Charlson baixo (n = 7), mas 3 pacientes possuem Charlson entre 0% e 5%, e 4 pacientes possuem Charlson entre 5% e 10%.
A classificação de Paprosky típica foi 2C (n=6) seguida das classificações 2A e 3A (n = 3, cada).

Seis pacientes aguardam na fila há menos de 1 ano completo, com tempo de espera entre 6 e 10 meses.
Estes são em sua maioria homens, com idades entre 48 e 69 anos.
O diagnóstico atual mais prevalente é Soltura Asséptica Acetabular, índice de Charlson baixo, HHS em torno de 40% e classificações de Paprosky 1, 2B e 2C.

No extremo superior se observou dois pacientes aguardando a revisão há mais de 10 anos -- um homem de 84 anos aguarda há 15 anos e uma mulher de 50 anos aguarda há 17 anos.
Os dados clínicos do primeiro não foram obtidos e o diagnóstico atual da segunda é Soltura Asséptica Acetabular e ela possui o índice de Charlson 3.4%, HHS 10% e classificação Paprosky 2C.

![](../figures/dist_tempo.png)

**Figura 1** Distribuição do tempo de espera para cirurgia de revisão

## Análise inferencial

# Exceções e Observações

# Conclusões

# Referências

# Apêndice

## Análise exploratória de dados

## Dados utilizados

Os dados utilizados neste relatório não podem ser publicados online por questões de sigilo.


