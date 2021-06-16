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

dados %>% ggplot(aes(uso_de_analgesicos)) + geom_bar()
dados %>% ggplot(aes(medicacoes_em_uso)) + geom_bar()

# numericas

dados %>%
  select(idade_num, tempo_de_espera, charlson, hhs) %>% skim()

dados %>% ggplot(aes(tempo_de_espera)) + geom_histogram(breaks = seq(0, 20, 5)*12)
dados %>% ggplot(aes(idade_num)) + geom_histogram(binwidth = 10)
dados %>% ggplot(aes(hhs)) + geom_histogram(binwidth = .1)
dados %>% ggplot(aes(charlson +.001)) + geom_histogram(binwidth = .025) #+ scale_x_log10()

# correlacoes
dados %>% ggplot(aes(charlson, medicacoes_em_uso)) + geom_jitter(alpha = .5, height = .05)
dados %>% ggplot(aes(uso_de_analgesicos, charlson)) + geom_boxplot() + geom_jitter(alpha = .3, height = .025, width = .2)
dados %>% ggplot(aes(charlson, hhs)) + geom_jitter(alpha = .4)

# tables ------------------------------------------------------------------

dados %>%
  select(-c(id, idade, ano_atq, aposentado, charlson)) %>%
  gtsummary::tbl_summary() #%>% gtsummary::as_kable_extra()
