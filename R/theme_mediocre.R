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
  if (!("opensans" %in% sysfonts::font_families())) {
    sysfonts::font_add_google("Open Sans", "opensans")
  }
  showtext::showtext_auto()

  ggplot2::theme_minimal(base_size = 11, base_family = "opensans") %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(color = color_type[["background"]], fill = color_type[["background"]]),
      panel.grid.major.y = ggplot2::element_line(colour = color_type[["base"]], size = 0.07),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.x =  ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm"),
      text = ggplot2::element_text(family = "opensans", colour = color_type[["base"]]),
      axis.text = ggplot2::element_text(size = rel(0.8)),
      axis.ticks.x = ggplot2::element_line(size = rel(0.2)),
      axis.title.x = element_text(margin = margin(t = .3, unit = "cm")),
      axis.title.y = element_text(margin = margin(r = .3, unit = "cm"), angle = 90),
      plot.title.position = "plot",
      plot.title = ggplot2::element_text(hjust = 0.05, size = rel(1.4), margin = margin(b = .5, unit = "cm")),
      plot.subtitle = ggplot2::element_text(hjust = 0.07, size = rel(1.2), face = "italic", vjust = 4.5),
      legend.position = "top",
      legend.title.align = 0,
      legend.title = ggplot2::element_text(size = rel(0.8)),
      legend.text = ggplot2::element_text(size = rel(0.7)),
      strip.text = ggplot2::element_text(size = rel(1.1), hjust = 0, margin = margin(b = .1, unit = "cm"))
    )
}
