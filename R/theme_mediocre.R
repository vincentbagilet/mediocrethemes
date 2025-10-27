#' Defines the ggplot theme with the default R colors.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be either "autumn", "rainbow", "green",
#'  "hotcold", "blackandwhite", "coty", "leo", "portal" or "pem"
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
  base_size = if (.Platform$OS.type == "windows") 17 else 14,
  base_family = "Lato",
  base_line_size = base_size / 50,
  base_rect_size = base_size / 170) {

  if (!is.logical(background)) {
    stop("background should be logical")
  }
  if (!(pal %in% mediocrethemes::colors_table[["pal"]])) {
    stop("This palette does not exist in this package")
  }

  #quick access to the colors in the palette
  colors_table <- mediocrethemes::colors_table
  color_theme <- colors_table[which(colors_table$pal == pal), ]
  base_color <- color_theme[["base"]]
  text_color <- color_theme[["text"]]
  line_color <- grDevices::colorRampPalette(c("white", text_color))(10)[3]
  light_color <- grDevices::colorRampPalette(c("white", base_color))(10)[7]

  if (!is.null(gradient)) {
    if (gradient == "right") {
      mediocre_color_vector <- unlist(
        strsplit(color_theme[["vector"]], split = ", ")
      )
      base_color <- mediocre_color_vector[14]
      light_color <- mediocre_color_vector[10]
    }
  }

  #setting default colors
  geoms_color <- c("point", "line", "contour", "text",
                   "curve", "function", "spoke", "rug",
                   "errorbar", "errorbarh", "pointrange", "segment")
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
    list(colour = color_theme[["complementary"]], linetype = "dashed")
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

  ggplot2::update_geom_defaults(geom = "line", list(linewidth = 0.8))

  # set fonts
  showtextdb::load_showtext_fonts()
  if (!("Lato" %in% sysfonts::font_families())) {
    lato <- showtextdb::google_fonts("Lato")
    showtextdb::font_install(lato)
  }
  showtext::showtext_auto()

  #actual definition of the theme
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
        colour = line_color,
        linewidth = base_line_size
      ),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.x =  ggplot2::element_blank(),
      panel.grid.minor.y = ggplot2::element_blank(),
      plot.margin = ggplot2::unit(c(0.5, 0.5, 0.5, 0.5), "cm"),
      axis.text = ggplot2::element_text(size = ggplot2::rel(0.75)),
      axis.ticks.x = ggplot2::element_line(
        linewidth = ggplot2::rel(2),
        colour = color_theme[["text"]]
      ),
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
        size = ggplot2::rel(1.1),
        margin = ggplot2::margin(b = .7, unit = "cm")
      ),
      plot.subtitle = ggplot2::element_text(
        hjust = 0,
        size = ggplot2::rel(1),
        face = "italic",
        margin = ggplot2::margin(t = -.58, b = .7, unit = "cm")
      ),
      legend.position = "top",
      legend.direction = "horizontal",
      legend.justification = c(0, 0),
      legend.location = "plot",
      legend.margin = ggplot2::margin(t = -.2, unit = "cm"),
      legend.key.spacing.y = ggplot2::unit(0.01, "cm"),
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.88)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(0.78)),
      strip.placement = "outside",
      strip.text = ggplot2::element_text(
        size = ggplot2::rel(0.95),
        face = "bold"
      ),
      strip.text.x = ggplot2::element_text(
        hjust = 0,
        margin = ggplot2::margin(b = .3, unit = "cm")
      ),
      strip.text.y = ggplot2::element_text(hjust = 0.95),
      panel.spacing.y = ggplot2::unit(1.8, "lines"),
      panel.spacing.x = ggplot2::unit(1.3, "lines"),
      complete = TRUE
    )

  #modifications when background included
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


#' @export
#' @rdname theme_mediocre
theme_mediocre_map <- function(
    pal = "autumn",
    gradient = NULL,
    background = FALSE,
    base_size = if (.Platform$OS.type == "windows") 17 else 14,
    base_family = "Lato",
    base_line_size = base_size / 50,
    base_rect_size = base_size / 170) {

    mediocrethemes::theme_mediocre(
      pal = pal,
      gradient = gradient,
      background = background,
      base_size = base_size,
      base_family = base_family,
      base_line_size = base_line_size,
      base_rect_size = base_rect_size
    ) %+replace%
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_blank(),
      complete = TRUE
    )
}
