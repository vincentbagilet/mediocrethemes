## The (super simple) code to help me create a new color palette

library(tidyverse)

color_vect <- c("blue", "red")
create_palette <- grDevices::colorRampPalette(color_vect)
create_palette(15) %>%
  cat(sep = ", ")
