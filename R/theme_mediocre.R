#' Defines the ggplot theme with the default R colors.
#'
#' @importFrom ggplot2 %+replace%
#'
#' @export
#' @examples
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#'   geom_col() +
#'   theme_mediocre() +
#'   labs(title = "A very nice title", subtitle = "A desapointing subtitle")
#'
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, color = hwy)) +
#'   geom_point() +
#'   theme_mediocre() +
#'   labs(title = "A very nice title", subtitle = "A desapointing subtitle")
#'
theme_mediocre <- function() {
  color_type <- mediocrethemes::colors_table[which(mediocrethemes::colors_table$color == "gray"),]

  ggplot2::update_geom_defaults(geom = "point", list(colour = color_type[["base"]]))
  ggplot2::update_geom_defaults(geom = "bar", list(fill = color_type[["base"]]))
  ggplot2::update_geom_defaults(geom = "col", list(fill = color_type[["base"]]))
  ggplot2::update_geom_defaults(geom = "line", list(colour = color_type[["base"]]))
  ggplot2::update_geom_defaults(geom = "density", list(colour = color_type[["base"]]))
  ggplot2::update_geom_defaults(geom = "smooth", list(colour = color_type[["light"]], fill = color_type[["light"]], alpha = 0.2))

  # set fonts
  # sysfonts::font_add_google("Open Sans", "opensans")
  # sysfonts::font_add_google("Montserrat", "montserrat")
  sysfonts::font_add_google("Nunito Sans", "nunito")
  showtext::showtext_auto()

  ggplot2::theme_minimal() %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = color_type[["background"]]),
      panel.grid.major.y = ggplot2::element_line(colour = color_type[["dark"]], size = 0.1),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.x =  ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      text = ggplot2::element_text(family = "nunito", colour = color_type[["dark"]],),
      axis.text = ggplot2::element_text(size = 10),
      axis.text.x = ggplot2::element_text(angle = 45),
      axis.ticks.x = ggplot2::element_line(size = 0.2),
      plot.title.position = "plot",
      plot.title = ggplot2::element_text(hjust = 0.1, size = 13),
      plot.subtitle = ggplot2::element_text(hjust = 0.12, vjust = 0, size = 10, face = "italic"),
      legend.position = "top",
      legend.title.align = 0.5,
      legend.title = ggplot2::element_text(size = 10, vjust = 0.8),
      legend.text = ggplot2::element_text(size = 8)
    )
}
