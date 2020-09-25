library("tidyverse")
library("viridis")
library("wesanderson")

green <- c(base = "#2D6A48", light = "#D9F8D1", background = "#E7F5E7", dark = "#1C4221")
color <- c(base = "#283845", light = "#4A6982", background = "#F5F6F4", dark = "#1D2834")

own_pal <- c("#F94144", "#F86335", "#F68425", "#F9AF37", "#F9C74F", "#C5C35E", "#90BE6D", "#43AA8B", "4D908E", "#577590")

light_green <- "#E7F5E7"
color_base <- "#2D6A48"

theme_mediocre_only <- function() { 
  theme_minimal() %+replace% 
    theme(
      plot.background = element_rect(fill = color[["background"]]),
      panel.grid.major.y = element_line(colour = color[["dark"]], size = 0.1),
      panel.grid.minor.x = element_blank(),
      panel.grid.major.x =  element_blank(),
      panel.grid.minor.y = element_blank(),
      text = element_text(family = "Avenir Next", colour = color[["dark"]],),
      axis.text = element_text(size = 10),
      axis.text.x = element_text(angle = 45),
      axis.ticks.x = element_line(size = 0.2),
      plot.title.position = "plot",
      plot.title = element_text(hjust = 0.1, size = 13),
      plot.subtitle = element_text(hjust = 0.1, vjust = 0, size = 10, face = "italic"),
      legend.position = "top",
      legend.title.align = 0.5,
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8)
    ) 
}

theme_mediocre <- function() {
  update_geom_defaults(geom = "point", list(colour = color[["base"]]))
  update_geom_defaults(geom = "bar", list(fill = color[["base"]]))
  update_geom_defaults(geom = "col", list(fill = color[["base"]]))
  update_geom_defaults(geom = "line", list(colour = color[["base"]]))
  update_geom_defaults(geom = "density", list(colour = color[["base"]]))
  update_geom_defaults(geom = "smooth", list(colour = color[["light"]], fill = color[["light"]], alpha = 0.2))
  
  # colors_pal <- c("#470B0B", "#6A1011", "#A0181A","#D52023", "#F94144", "#F86335", "#F68425", "#F9AF37", "#F9C74F", "#DFC557", "#C5C35E", "#90BE6D", "#43AA8B", "#4D908E", "#577590", "#415462", "#2B353B", "#1C1F22")
  # colors_pal <- c("#6A1011", "#A0181A","#D52023", "#F94144", "#F86335", "#F68425", "#F9AF37", "#F9C74F", "#DFC557", "#C5C35E", "#90BE6D", "#43AA8B", "#4D908E", "#47647D", "#333D5B", "#333D5B")
  # colors_pal <- c("#6A1011", "#A0181A","#D52023", "#F94144", "#F86335", "#F68425", "#F9AF37", "#F9C74F", "#DFC557", "#C5C35E", "#90BE6D", "#43AA8B", "#4D908E", "#577590", "#415462", "#2B353B", "#1C1F22")
  colors_pal <- c("#5F0F40", "#9A031E", "#FB9637", "#AE5E26", "#44524A", "#15343D")
  
  own_pal <- colorRampPalette(colors_pal)
  # own_pal_disc <- c("#6A1011", "#1C1F22", "#43AA8B", "#4D908E", "#577590", "#415462", "#2B353B", "#1C1F22")
  # scale_fill_discrete <- function(...) discrete_scale(..., aesthetics = c("fill", "color"), scale_name = "disc_scale", palette = own_pal)
  # scale_fill_continuous <- function(...) scale_color_gradientn(..., colors = colors_pal, aesthetics = c("fill", "color"))
  
  if (scale_type() == "continuous") {
    scale_fill_total <- function(...) scale_color_gradientn(..., colors = colors_pal, aesthetics = c("fill", "color"))
  } else if (scale_type(.) == "discrete") {
    scale_fill_total <- function(...) discrete_scale(..., aesthetics = c("fill", "color"), scale_name = "disc_scale", palette = own_pal)
  }

  return(list(theme_mediocre_only(), scale_fill_total()))#, discrete_scale(aesthetics = c("fill", "color"), scale_name = "disc_scale", palette = own_pal), scale_fill_gradientn(colors = colors_pal, aesthetics = c("fill", "color"))))
  # return(list(theme_mediocre_only(), scale_fill_gradientn(scale_name = "disc_scale", palette = own_pal, colors = own_pal)))#, scale_fill_gradientn(colors = colors_pal, aesthetics = c("fill", "color"))))
}

# scale_fill_manual(values = own_pal)

mpg %>% 
  # filter(fl != "e", fl != "r", fl != "c") %>%
  ggplot(aes(x = cty, y = displ, color = manufacturer)) +
  # geom_col() +
  geom_point() +
  # geom_smooth() +
  # geom_density() +
  theme_mediocre() +
  # scale_fill_distiller(low = color[["light"]], high = color[["dark"]])
  # scale_fill_viridis_d() +
  # scale_fill_brewer(palette = "Spectral") +
  labs(title = "A very nice title", subtitle = "A desapointing subtitle")

  
  ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
    geom_col() +
    theme_mediocre() +
    scale_mediocre_d() +
    labs(title = "A very nice title", subtitle = "A desapointing subtitle")
  
