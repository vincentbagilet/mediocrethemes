#' Sets the mediocre theme and colors for the whole document.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be either "autumn", "rainbow", "green",
#'  "hotcold", "blackandwhite", or "coty"
#' @param background If TRUE, a background is added to the plots
#' @param second_pair if true sets an alternative pair of colors
#' for graphs with two colors
#' @param base_size Base font size, given in pts.
#' @param base_family Base font family
#' @param base_line_size Base size for line elements
#' @param base_rect_size Base size for rect elements
#'
#' @export
#' @examples
#' set_mediocre_all()
#'
set_mediocre_all <-
  function(pal = "autumn",
           background = FALSE,
           second_pair = FALSE,
           base_size = 12,
           base_family = "Lato",
           base_line_size = base_size/170,
           base_rect_size = base_size/170) {
    ggplot2::theme_set(mediocrethemes::theme_mediocre(
      pal = pal,
      background = background,
      base_size = base_size,
      base_family = base_family,
      base_line_size = base_line_size,
      base_rect_size = base_rect_size)
    )
    options(ggplot2.continuous.fill = mediocrethemes::palette_mediocre_c(
      pal = pal)
    )
    options(ggplot2.continuous.colour = mediocrethemes::palette_mediocre_c(
      pal = pal)
    )
    options(ggplot2.discrete.fill = mediocrethemes::palette_mediocre_d(
      pal = pal,
      second_pair = second_pair)
    )
    options(ggplot2.discrete.colour = mediocrethemes::palette_mediocre_d(
      pal = pal,
      second_pair = second_pair)
    )
  }
