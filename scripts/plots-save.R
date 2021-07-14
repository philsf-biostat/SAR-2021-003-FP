# setup -------------------------------------------------------------------
width <- 4
height <- 4

# save plots --------------------------------------------------------------

# ggsave(filename = "figures/plot.png", plot = gg)
ggsave(filename = "figures/dist_tempo.png", plot = gg_tempo_anos, width = width, height = height)
