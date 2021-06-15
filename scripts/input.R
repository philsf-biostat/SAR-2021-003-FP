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
dados.raw <- dados.raw %>%
  clean_names()

# data cleaning -----------------------------------------------------------

dados <- dados.raw %>%
  # elimina colunas que não serão usadas
  select(-(acetabulo:obs))

dados <- dados %>%
  # limpeza
  mutate(
    id = as.character(id),
    aposentado = str_to_title(aposentado),
    causa = str_to_title(causa),
    cirurgia_durante_a_espera = str_to_title(cirurgia_durante_a_espera),
    anti_depressivos = str_to_title(anti_depressivos),
    # contralateral = str_to_title(contralateral),
  )

# data wrangling ----------------------------------------------------------

dados <- dados %>%
  # idade_num ao lado de idade para comparação
  mutate(idade_num = parse_number(idade), .after = idade) %>%
  # preenche todos os NA em causa (assume que todos os NA são ativos)
  replace_na(list(causa = "Trabalhando"))

# labels ------------------------------------------------------------------

dados <- dados %>%
  set_variable_labels(
    idade_num = "Idade",
    sexo = "Sexo",
    tempo_de_espera = "Tempo de espera",
    hhs = "HHS",
    charlson = "Escore de Charlson"
  )
