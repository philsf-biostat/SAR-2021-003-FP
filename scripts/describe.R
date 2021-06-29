# setup -------------------------------------------------------------------

# library(Hmisc) # describe
# library(skimr) # skim
# library(tableone)
library(gtsummary)
# library(gmodels) # CrossTable

# exploratory -------------------------------------------------------------

dados %>% skimr::skim()

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

# EDA ---------------------------------------------------------------------

dados %>% ggplot(aes(tabagismo)) + geom_bar()
dados %>% ggplot(aes(etilismo)) + geom_bar()
dados %>% ggplot(aes(uso_de_analgesicos)) + geom_bar()
dados %>% ggplot(aes(medicacoes_em_uso)) + geom_bar()

# numericas

dados %>%
  select(idade_num, tempo_de_espera, charlson, hhs) %>% skimr::skim()

dados %>% ggplot(aes(tempo_de_espera)) + geom_histogram(breaks = seq(0, 20, 5)*12)
dados %>% ggplot(aes(tempo_anos)) + geom_bar()
dados %>% ggplot(aes(idade_num)) + geom_histogram(binwidth = 10)
dados %>% ggplot(aes(hhs)) + geom_histogram(binwidth = 10)

# charlson - busca de transformacao
dados %>% ggplot(aes(charlson)) + geom_histogram(binwidth = 2.5) # multimodal
dados %>% ggplot(aes(charlson)) + geom_bar()
dados %>% ggplot(aes(charlson+.001)) + geom_density()
dados %>% ggplot(aes(log10(charlson+.001))) + geom_density() # log10 é bimodal
dados %>% ggplot(aes(sqrt(charlson+.001))) + geom_density()

# correlacoes entre covariáveis
dados %>% ggplot(aes(medicacoes_em_uso, charlson)) + geom_jitter(alpha = .5)
dados %>% ggplot(aes(uso_de_analgesicos, charlson)) + geom_boxplot() + geom_jitter(alpha = .3)
dados %>% ggplot(aes(hhs, charlson)) + geom_jitter(alpha = .4)

# correlacoes com tempo de espera
dados %>% ggplot(aes(idade_num, tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1)
dados %>% ggplot(aes(sexo, tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)
dados %>% ggplot(aes(aposentado, tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)
dados %>% ggplot(aes(factor(tabagismo), tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)
dados %>% ggplot(aes(factor(etilismo), tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)

dados %>% ggplot(aes(charlson, tempo_de_espera)) + geom_jitter(alpha = .5)
dados %>% ggplot(aes(hhs, tempo_de_espera)) + geom_jitter(alpha = .5)
dados %>% ggplot(aes(factor(medicacoes_em_uso), tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)
dados %>% ggplot(aes(uso_de_analgesicos, tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)
dados %>% ggplot(aes(anti_depressivos, tempo_de_espera)) + geom_jitter(alpha = .5, height = .1, width = .1) + geom_boxplot(alpha = 0)



# tables ------------------------------------------------------------------

dados %>%
  select(-c(aposentado, charlson)) %>%
  gtsummary::tbl_summary() #%>% gtsummary::as_kable_extra()
