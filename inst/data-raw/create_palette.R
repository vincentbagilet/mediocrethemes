## The (super simple) code to help me create a new color palette

library(tidyverse)

color_vect <- c("#112438", "#8C1620", "#EDC385", "#AF5D0F", "#2A361C")
create_palette <- grDevices::colorRampPalette(color_vect)
create_palette(15) %>%
  cat(sep = ", ")
