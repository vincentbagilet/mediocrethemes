#' Defines the ggplot theme with the default R colors.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be either "autumn", "rainbow", "green",
#'  "hotcold", "blackandwhite", or "coty"
#' @param gradient a string, either "left" or "right".
#' Turns divergent palettes into gradient ones by splitting it in two.
#' If equal to "right", the gradient palette is built with the right hand
#' side part of the divergent palette. If equal to "left", uses the left
#' hand side but flipping so that light values are on the left.
#' @param background If TRUE, a background is added to the plots
#' @param base_size Base font size, given in pts.
#' @param base_family Base font family
#' @param base_line_size Base size for line elements
#' @param base_rect_size Base size for rect elements
#'
#' @importFrom ggplot2 %+replace%
#'
#' @export
#' @examples
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#'   geom_col() +
#'   theme_mediocre() +
#'   labs(title = "A very nice title", subtitle = "A disappointing subtitle")
#'
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, color = hwy)) +
#'   geom_point() +
#'   theme_mediocre() +
#'   labs(title = "A very nice title", subtitle = "A disappointing subtitle")
#'
theme_mediocre <- function(
  pal = "autumn",
  gradient = NULL,
  background = FALSE,
  base_size = if (.Platform$OS.type == "windows") 15 else 12,
  base_family = "Lato",
  base_line_size = base_size / 170,
  base_rect_size = base_size / 170) {

  if (!is.logical(background)) {
    stop("background should be logical")
  }
  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }

  colors_table <- mediocrethemes::colors_table
  color_theme <- colors_table[which(colors_table$color == pal), ]
  if (!is.null(gradient)) {
    if (gradient == "right") {
      mediocre_color_vector <- unlist(
        strsplit(color_theme[["vector"]], split = ", ")
      )
      base_color <- mediocre_color_vector[14]
      light_color <- mediocre_color_vector[10]
    } else {
      base_color <- color_theme[["base"]]
      light_color <- color_theme[["light"]]
    }
  } else {
    base_color <- color_theme[["base"]]
    light_color <- color_theme[["light"]]
  }

  #setting default colors
  geoms_color <- c("point", "line", "contour", "text",
                   "curve", "function", "spoke", "rug",
                   "errorbar", "errorbarh", "pointrange")
  geoms_complementary <- c("abline", "vline", "hline")
  geoms_fill <- c("area", "bar", "col", "dotplot", "hex", "tile")
  geoms_density <- c("boxplot", "density", "violin", "contour_filled", "ribbon")

  lapply(
    geoms_color,
    ggplot2::update_geom_defaults,
    list(colour = base_color)
  )
  lapply(
    geoms_complementary,
    ggplot2::update_geom_defaults,
    list(colour = color_theme[["text"]], linetype = "dashed")
  )
  lapply(
    geoms_fill,
    ggplot2::update_geom_defaults,
    list(fill = base_color)
  )
  lapply(
    geoms_density,
    ggplot2::update_geom_defaults,
    list(fill = base_color, color = base_color, alpha = 0.2)
  )

  ggplot2::update_geom_defaults(
    geom = "smooth",
    list(colour = light_color,
         fill = light_color, alpha = 0.2)
  )

  # set fonts
  showtextdb::load_showtext_fonts()
  if (!("Lato" %in% sysfonts::font_families())) {
    lato <- showtextdb::google_fonts("Lato")
    showtextdb::font_install(lato)
  }
  showtext::showtext_auto()

  theme_custom <-
    ggplot2::theme_minimal(
      base_size = base_size,
      base_family = base_family,
      base_line_size = base_line_size,
      base_rect_size = base_rect_size
    ) %+replace%
    ggplot2::theme(
      text = ggplot2::element_text(
        size = base_size,
        family = base_family,
        colour = color_theme[["text"]]
      ),
      panel.grid.major.y = ggplot2::element_line(
        colour = color_theme[["text"]],
        size = base_line_size
      ),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.x =  ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      plot.margin = ggplot2::unit(c(0.5, 0.5, 0.5, 0.5), "cm"),
      axis.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
      axis.ticks.x = ggplot2::element_line(size = ggplot2::rel(2)),
      axis.title.x = ggplot2::element_text(
        hjust = 1,
        margin = ggplot2::margin(t = .35, unit = "cm"),
        size = ggplot2::rel(1)
      ),
      axis.title.y = ggplot2::element_text(
        hjust = 0.95,
        margin = ggplot2::margin(r = .35, unit = "cm"),
        size = ggplot2::rel(1),
        angle = 90
      ),
      plot.title.position = "plot",
      plot.title = ggplot2::element_text(
        hjust = 0,
        size = ggplot2::rel(1.25),
        margin = ggplot2::margin(b = .7, l = 0.1, unit = "cm")
      ),
      plot.subtitle = ggplot2::element_text(
        hjust = 0,
        size = ggplot2::rel(1),
        face = "italic",
        margin = ggplot2::margin(t = -.5, b = .7, l = 0.2, unit = "cm")
      ),
      legend.position = "top",
      legend.margin = ggplot2::margin(t = -.2, unit = "cm"),
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.8)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(0.7)),
      legend.key.size = ggplot2::unit(1, "lines"),
      strip.text = ggplot2::element_text(
        size = ggplot2::rel(0.9),
        hjust = 0,
        face = "bold",
        margin = ggplot2::margin(b = .3, unit = "cm")
      )
    )

  if (background) {
    theme_custom <- theme_custom +
      ggplot2::theme(
        plot.background = ggplot2::element_rect(
          color = color_theme[["background"]],
          fill = color_theme[["background"]]
        )
      )
  }

  return(theme_custom)
}
