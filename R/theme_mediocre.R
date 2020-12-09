#' Defines the ggplot theme with the default R colors.
#'
#' @param background If TRUE, a background is added to the plots
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
theme_mediocre <- function(background = FALSE) {
  color_type <- mediocrethemes::colors_table[which(mediocrethemes::colors_table$color == "gray"),]

  #setting default colors
  geoms_color <- c("point", "line", "contour", "text", "curve", "function", "spoke", "rug")
  geoms_complementary <- c("abline", "vline", "hline", "errorbar", "errorbarh")
  geoms_fill <- c("area", "bar", "col", "dotplot", "hex", "tile")
  geoms_density <- c("boxplot", "density", "violin", "contour_filled", "ribbon")

  lapply(geoms_color, ggplot2::update_geom_defaults, list(colour = color_type[["base"]]))
  lapply(geoms_complementary, ggplot2::update_geom_defaults, list(colour = color_type[["complementary"]]))
  lapply(geoms_fill, ggplot2::update_geom_defaults, list(fill = color_type[["base"]]))
  lapply(geoms_density, ggplot2::update_geom_defaults, list(fill = color_type[["base"]], alpha = 0.2))

  ggplot2::update_geom_defaults(geom = "smooth", list(colour = color_type[["light"]], fill = color_type[["light"]], alpha = 0.2))

  # set fonts
  showtextdb::load_showtext_fonts()
  if (!("Lato" %in% sysfonts::font_families())) {
    lato <- showtextdb::google_fonts("Lato")
    showtextdb::font_install(lato)
  }
  showtext::showtext_auto()

  theme_custom <- ggplot2::theme_minimal(base_size = 12, base_family = "Lato") %+replace%
    ggplot2::theme(
      panel.grid.major.y = ggplot2::element_line(colour = color_type[["base"]], size = 0.07),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.x =  ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      plot.margin = ggplot2::unit(c(0.5,0.5,0.5,0.5), "cm"),
      text = ggplot2::element_text(family = "Lato", colour = color_type[["base"]]),
      axis.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
      axis.ticks.x = ggplot2::element_line(size = ggplot2::rel(0.2)),
      axis.title.x = ggplot2::element_text(hjust = 0.97, margin = ggplot2::margin(t = .35, unit = "cm"), size = ggplot2::rel(1)),
      axis.title.y = ggplot2::element_text(hjust = 0.95, margin = ggplot2::margin(r = .35, unit = "cm"), size = ggplot2::rel(1), angle = 90),
      plot.title.position = "plot",
      plot.title = ggplot2::element_text(hjust = 0, size = ggplot2::rel(1.25), margin = ggplot2::margin(b = .7, l = 0.1, unit = "cm")),
      plot.subtitle = ggplot2::element_text(hjust = 0, size = ggplot2::rel(1), face = "italic", margin = ggplot2::margin(t = -.5, b = .7, l = 0.2, unit = "cm")),
      legend.position = "top",
      legend.title.align = 0,
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.8)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(0.7)),
      legend.key.size = unit(1, "lines"),
      strip.text = ggplot2::element_text(size = ggplot2::rel(1.1), hjust = 0, face = "italic", margin = ggplot2::margin(b = .3, unit = "cm"))
    )

  if (background) {
    theme_custom <- theme_custom +
      ggplot2::theme(
        plot.background = ggplot2::element_rect(color = color_type[["background"]], fill = color_type[["background"]])
      )
  }

  return(theme_custom)
}
