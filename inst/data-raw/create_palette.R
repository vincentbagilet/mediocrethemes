## The (super simple) code to help me create a new color palette

library(tidyverse)

color_vect <- c("#362703", "#7A5B13", "#B7933D", "#D8CEB6", "#E9E7E3","#E6E7EC", "#CBCDE3", "#8D92D9", "#414CE1", "#091187")
create_palette <- grDevices::colorRampPalette(color_vect)
create_palette(15)

scales::show_col(create_palette, borders = FALSE)

create_palette(15) %>%
  cat(sep = ", ")
