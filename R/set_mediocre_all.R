#' Sets the mediocre theme and colors for the whole document.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be "autumn" or "rainbow"
#' @param background If TRUE, a background is added to the plots
#' @param second_pair if true sets an alternative pair of colors
#' for graphs with two colors
#'
#' @export
#' @examples
#' set_mediocre_all()
#'
set_mediocre_all <-
  function(pal = "autumn", background = FALSE, second_pair = FALSE) {
    ggplot2::theme_set(mediocrethemes::theme_mediocre(
      pal = pal,
      background = background)
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
