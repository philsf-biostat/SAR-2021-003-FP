# setup -------------------------------------------------------------------

# library(Hmisc) # describe
library(skimr) # skim
# library(tableone)
library(gtsummary)
# library(gmodels) # CrossTable

# exploratory -------------------------------------------------------------

dados %>% skim()

# categoricas

dados %>% count(sexo)
dados %>% count(escolaridade)
dados %>% count(renda)
dados %>% count(ano_atq)
dados %>% count(aposentado)
# dados %>% count(habitos_de_vida)
dados %>% count(tabagismo, etilismo)
dados %>% count(cirurgia_durante_a_espera)
dados %>% count(deambulacao)
dados %>% count(medicacoes_em_uso)
dados %>% count(uso_de_analgesicos)
dados %>% count(anti_depressivos)
dados %>% count(motivo_da_atq)

# numericas

dados %>%
  select(idade_num, tempo_de_espera, charlson, hhs) %>% skim()

dados %>% ggplot(aes(tempo_de_espera, ..density..)) + geom_histogram(binwidth = 12)
dados %>% ggplot(aes(idade_num)) + geom_histogram(binwidth = 10)
dados %>% ggplot(aes(hhs)) + geom_histogram(binwidth = .1)
dados %>% ggplot(aes(charlson +.001)) + geom_histogram(binwidth = .025) #+ scale_x_log10()

# tables ------------------------------------------------------------------

dados %>%
  select(-c(id, idade, ano_atq, aposentado, charlson)) %>%
  gtsummary::tbl_summary() #%>% gtsummary::as_kable_extra()
