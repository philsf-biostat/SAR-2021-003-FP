# setup -------------------------------------------------------------------
library(readxl)
# library(data.table)
library(tidyverse)
library(janitor)
library(labelled)

# data loading ------------------------------------------------------------
# raw.data <- fread("dataset/file.csv")
# raw.data <- readxl::read_excel("dataset/file.xls")

# raw.data <- data.table(raw.data)
dados.raw <- read_excel("dataset/PLANILHA UNIFORMIZADA.xlsx")
# dados.raw <- read_excel("dataset/PLANILHA UNIFORMIZADA.xlsx", 
#                         # elimina colunas que não serão usadas (skip)
#                         col_types = c("numeric", "text", "text", 
#                                       "numeric", "numeric", "text", "text", 
#                                       "numeric", "text", "numeric", "numeric", 
#                                       "text", "numeric", "numeric", "text", 
#                                       "numeric", "numeric", "numeric", 
#                                       "skip", "skip", "skip", "skip", "skip", 
#                                       "skip", "skip", "skip", "skip"))
dados.raw <- dados.raw %>%
  clean_names()

# data cleaning -----------------------------------------------------------

dados <- dados.raw
# dados <- dados.raw %>%
#   # elimina colunas que não serão usadas
#   select(-(acetabulo:obs))

dados <- dados %>%
  # limpeza
  mutate(
    # limpar observações
    cirurgia_durante_a_espera = str_match(cirurgia_durante_a_espera, ".{3}")
  ) %>% mutate(
    id = as.character(id),
    aposentado = str_to_title(aposentado),
    causa = str_to_title(causa),
    cirurgia_durante_a_espera = str_to_title(cirurgia_durante_a_espera),
    anti_depressivos = str_to_title(anti_depressivos),
    # contralateral = str_to_title(contralateral),
  ) %>% mutate( paprosky = case_when(
      paprosky == "um" ~ "1",
      paprosky == "dois" ~ "2",
      paprosky == "três" ~ "3",
      paprosky == "quatro" ~ "4",
      paprosky == "seis" ~ "6",
      TRUE ~ paprosky
    ) ) %>%
  mutate( paprosky = as.numeric(paprosky) )

# data wrangling ----------------------------------------------------------

dados <- dados %>%
  # idade_num ao lado de idade para comparação
  mutate(idade_num = parse_number(idade), .after = idade) %>%
  # tempo em anos ao lado do tempo original em meses
  mutate(tempo_anos = floor(tempo_de_espera/12)) %>%
  # faixa de Charlson
  mutate(charlson_faixa = cut(charlson
                              , breaks = c(-1, 0, .05, .1, Inf)
                              , labels = c("0%" ,"0% a 5%", "5% a 10%", "Maior que 10%"))
         , .after = hhs) %>%
  # escores como porcentagem
  mutate(charlson = charlson*100, hhs = hhs*100) %>%
  # preenche todos os NA em causa (assume que todos os NA são ativos)
  replace_na(list(causa = "Trabalhando")) %>%
  # fatores
  mutate(
    id = factor(id),
    sexo = factor(sexo),
    aposentado = factor(aposentado),
    cirurgia_durante_a_espera = factor(cirurgia_durante_a_espera),
    renda = factor(renda, labels = c("Até 1 SM", "2 a 5 SM", "Mais que 5 SM")),
    causa = factor(causa),
    escolaridade = factor(escolaridade, levels = 1:7, labels = c("Não alfabetizado", "Fund. incompleto", "Fundamental", "Méd. incompleto", "Médio", "Sup. incompleto", "Superior")),
    motivo_da_atq = factor(motivo_da_atq, labels = c("Fraturas", "Coxartrose", "Osteonecrose", "Displasia", "Outros")),
    deambulacao = factor(deambulacao, levels = 1:5, labels = c("Livre", "Bengala", "Andador", "Cadeira de rodas", "Leito")),
    # medicacoes_em_uso = factor(medicacoes_em_uso),
    uso_de_analgesicos = factor(uso_de_analgesicos, labels = c("Nenhum", "AINES", "Opióides", "Analgésicos", "Vários")),
    anti_depressivos = factor(anti_depressivos),
    # ano_atq = factor(ano_atq),
    motivo = factor(motivo, levels = 1:5, labels = c("Fratura Periprotética", "Infecção", "Soltura Asséptica Acetabular", "Soltura Asséptica Femoral", "Soltura Asséptica de Ambos")),
    diagnostico_atual = factor(diagnostico_atual, levels = 1:5, labels = c("Fratura Periprotética", "Infecção", "Soltura Asséptica Acetabular", "Soltura Asséptica Femoral", "Soltura Asséptica de Ambos")),
    paprosky = factor(paprosky, levels = 1:7, labels = c("1", "2A", "2B", "2C", "3A", "3B", "3C")),
  )

# reshape de habitos_de_vida -> tabagismo e etilismo
# reshape: valores = 1 | fill NA com 0
dados <- dados %>%
  # separar "1 2" em vars tidy
  separate_rows(habitos_de_vida) %>%
  # preparar variaveis para reshape
  mutate(habitos_de_vida = case_when(
    habitos_de_vida == "0" ~ "nenhum",
    habitos_de_vida == "1" ~ "tabagismo",
    habitos_de_vida == "2" ~ "etilismo"
  ),
  val = 1, # var sintetica temporaria
  ) %>%
  # reshape: valores = 1 | fill NA com 0, e remover "nenhum" = 0, 0
  pivot_wider(names_from = habitos_de_vida, values_from = val, values_fill = 0) %>%
  select(-nenhum)

# labels ------------------------------------------------------------------

dados <- dados %>%
  set_variable_labels(
    idade = "Idade",
    idade_num = "Idade",
    sexo = "Sexo",
    tempo_de_espera = "Tempo de espera (meses)",
    tempo_anos = "Tempo de espera (anos)",
    escolaridade = "Escolaridade",
    renda = "Renda familiar",
    causa = "Aposentadoria",
    deambulacao = "Deambulação",
    cirurgia_durante_a_espera = "Ciurgia (não ortop.) durante a espera",
    uso_de_analgesicos = "Uso de analgésicos",
    medicacoes_em_uso = "Número de medicações em uso",
    anti_depressivos = "Uso de antidepressivos",
    motivo_da_atq = "Motivo da ATQ",
    # habitos_de_vida = "Hábitos de vida",
    tabagismo = "Tabagismo",
    etilismo = "Etilismo",
    hhs = "HHS",
    charlson = "Escore de Charlson",
    charlson_faixa = "Escore de Charlson",
    revisoes = "Revisões prévias de quadril",
    motivo = "Motivo de revisões prévias",
    diagnostico_atual = "Diagnóstico atual",
    paprosky = "Classificação Paprosky",
    valor = "Valor (R$)",
  )

# dados clean (backup) ----------------------------------------------------

dados_clean <- dados
dados <- dados %>%
  select(-c(id, data_de_nascimento, idade, motivo_outro, acetabulo, femur, contralateral, cidade, obs))
