# setup -------------------------------------------------------------------
# library(gt)
# library(gtsummary)
# library(moderndive)
# library(broom)
# library(broom.mixed)

# raw estimate ------------------------------------------------------------


# adjusted ----------------------------------------------------------------

# dados.mdl <- dados %>%
#   filter(!(causa %in% c("Pensionista", "Trabalhando"))) %>%
#   select(-aposentado) %>%
#   filter(tempo_de_espera < 150) %>%
#   droplevels()
#
# mdl_tempo_charlson_causa <- lm(tempo_de_espera ~ charlson + causa +0, dados.mdl)
# tbl_regression(mdl_tempo_charlson_causa)
# dados.mdl %>%
#   ggplot(aes(charlson, tempo_de_espera, color = causa)) +
#   geom_point() +
#   geom_parallel_slopes(se = FALSE) +
#   geom_quantile(lty = 2, quantiles = .5) +
#   theme_classic()
#
# mdl_tempo_charlson_causa_int <- lm(tempo_de_espera ~ charlson:causa + causa +0, dados.mdl)
# tbl_regression(mdl_tempo_charlson_causa_int)
# dados.mdl %>%
#   ggplot(aes(charlson, tempo_de_espera, color = causa)) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) +
#   geom_quantile(lty = 2, quantiles = .5) +
#   theme_classic()
# 
# mdl_sat <- lm(tempo_de_espera ~ ., dados.mdl)
#
# smdl_sat <- step(mdl_sat, direction = "back")
# summary(smdl_sat)
# smdl_sat$anova
#
# library(quantreg)
# 
# mdl_qr <- rq(tempo_de_espera ~ charlson + causa +0, .5, dados.mdl)
# 
# plot(summary(rq(tempo_de_espera ~ charlson , seq(.1, .9, .1), dados)), parm = "charlson")
