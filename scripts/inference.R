# setup -------------------------------------------------------------------
# library(tableone)
# library(gt)
# library(gtsummary)
# library(infer)
# 
# null_dist <- dados.mdl %>%
#   specify(tempo_de_espera ~ causa) %>%
#   hypothesize(null = "independence") %>%
#   generate(reps = 1000, type = "permute") %>%
#   calculate(stat = "diff in means", order = c("Invalidez", "Tempo De Serviço"))
# 
# (obs <- dados.mdl %>%
#   specify(tempo_de_espera ~ causa) %>%
#   # hypothesize(null = "independence") %>%
#   # generate(reps = 1000, type = "permute") %>%
#   calculate(stat = "diff in means", order = c("Invalidez", "Tempo De Serviço")) %>%
#   pull())
# 
# get_p_value(null_dist, obs, direction = "two sided")
# 
# visualise(null_dist) + shade_p_value(obs, direction = "two sided")

# tables ------------------------------------------------------------------

inf_charlson_pap3 <- dados %>%
  select(charlson_faixa, paprosky3) %>%
  # reordenar levels em ordem alfabética para tabela de contingência
  mutate(charlson_faixa = fct_relevel(charlson_faixa, sort),
         paprosky3 = fct_relevel(paprosky3, sort)) %>%
  tbl_cross(missing = "no") %>%
  add_p()
