## The (super simple) code to help me create a new color palette

library(tidyverse)

color_vect <- c("#051629", "#495C2E", "#DEB77D", "#AF5D0F", "#84151F")
create_palette <- grDevices::colorRampPalette(color_vect)
create_palette(15) %>%
  cat(sep = ", ")
