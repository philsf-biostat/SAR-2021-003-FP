# setup -------------------------------------------------------------------

# library(Hmisc) # describe
library(skimr) # skim
# library(tableone)
# library(gmodels) # CrossTable

# exploratory -------------------------------------------------------------

dados %>% skim()

# categoricas

dados %>% count(sexo)
dados %>% count(escolaridade)
dados %>% count(renda)
dados %>% count(ano_atq)
dados %>% count(aposentado)
dados %>% count(habitos_de_vida)
dados %>% count(cirurgia_durante_a_espera)
dados %>% count(deambulacao)
dados %>% count(medicacoes_em_uso)
dados %>% count(uso_de_analgesicos)
dados %>% count(anti_depressivos)
dados %>% count(motivo_da_atq)

# numericas

dados %>%
  select(idade_num, tempo_de_espera, charlson, hhs) %>% skim()

# tables ------------------------------------------------------------------


