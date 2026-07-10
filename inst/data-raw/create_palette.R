## The (super simple) code to help me create a new color palette

library(tidyverse)

color_vect <- c("#edd2a4", "#deba71", "#a58941", "#6b5811", "#302903")
create_palette <- grDevices::colorRampPalette(color_vect)
create_palette(15)

scales::show_col(create_palette, borders = FALSE)

create_palette(15) %>%
  cat(sep = ", ")
