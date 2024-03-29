# setup -------------------------------------------------------------------
# library(ggplot2)
# library(survminer)

ff.col <- "steelblue" # good for single groups scale fill/color brewer
ff.pal <- "Paired"    # good for binary groups scale fill/color brewer

# Theme setting (less is more)
theme_set(
  theme_classic()
)
theme_update(
  legend.position = "top"
)

# plots -------------------------------------------------------------------

gg <- ggplot(analytical, aes(outcome, fill = group)) +
  geom_density( alpha = .8) +
  # scale_color_brewer(palette = ff.pal) +
  scale_fill_brewer(palette = ff.pal) +
  labs()

gg_tempo_anos <-
  dados %>%
  ggplot(aes(tempo_anos)) +
  geom_histogram(binwidth = 1) +
  xlab(var_label(dados$tempo_anos)) + ylab("n") +
  ylim(c(0, 15))

