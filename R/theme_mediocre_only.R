#' Defines the ggplot theme with the default R colors.
#'
#' @param color A string. Define the main color of the theme. Possible options are "gray",
#'
#' @examples
#' ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#' geom_col() +
#' theme_mediocre_only() +
#' labs(title = "A very nice title", subtitle = "A desapointing subtitle")
#'
#' ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#' geom_point() +
#' theme_mediocre_only() +
#' labs(title = "A very nice title", subtitle = "A desapointing subtitle")
#'

theme_mediocre_only <- function(color = "gray") {
  color_type <- colors_table[which(colors_table$color == "gray"),]

  theme_minimal() %+replace%
    theme(
      plot.background = element_rect(fill = color_type[["background"]]),
      panel.grid.major.y = element_line(colour = color_type[["dark"]], size = 0.1),
      panel.grid.minor.x = element_blank(),
      panel.grid.major.x =  element_blank(),
      panel.grid.minor.y = element_blank(),
      text = element_text(family = "Avenir Next", colour = color_type[["dark"]],),
      axis.text = element_text(size = 10),
      axis.text.x = element_text(angle = 45),
      axis.ticks.x = element_line(size = 0.2),
      plot.title.position = "plot",
      plot.title = element_text(hjust = 0.1, size = 13),
      plot.subtitle = element_text(hjust = 0.1, vjust = 0, size = 10, face = "italic"),
      legend.position = "top",
      legend.title.align = 0.5,
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 8, vjust = 0.7)
    )
}
