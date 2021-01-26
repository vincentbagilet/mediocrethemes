#' Sets the mediocre theme and colors for the whole document.
#'
#' @param background If TRUE, a background is added to the plots
#' @param pal a string. Defines the color palette selected.
#' Can either be "autumn" or "rainbow"
#'
#' @export
#' @examples
#' set_mediocre_all()
#'
set_mediocre_all <- function(pal = "autumn", background = FALSE) {
  ggplot2::theme_set(mediocrethemes::theme_mediocre(
    pal = pal,
    background = background)
  )
  options(ggplot2.continuous.fill = mediocrethemes::palette_mediocre_c(pal))
  options(ggplot2.continuous.colour = mediocrethemes::palette_mediocre_c(pal))
  options(ggplot2.discrete.fill = mediocrethemes::palette_mediocre_d(pal))
  options(ggplot2.discrete.colour = mediocrethemes::palette_mediocre_d(pal))
}
