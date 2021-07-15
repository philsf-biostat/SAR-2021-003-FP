# setup -------------------------------------------------------------------
library(ggplot2)
# library(survminer)

# plots -------------------------------------------------------------------

gg_tempo_anos <-
  dados %>%
  ggplot(aes(tempo_anos)) +
  geom_histogram(binwidth = 1) +
  xlab(var_label(dados$tempo_anos)) + ylab("n") +
  ylim(c(0, 15)) +
  theme_classic()

