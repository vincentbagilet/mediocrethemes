#' Sets the mediocre theme and colors for the whole document.
#'
#' @export
#' @examples
#' set_mediocre_all()
#'
set_mediocre_all <- function(background = FALSE) {
  ggplot2::theme_set(mediocrethemes::theme_mediocre(background = background))
  options(ggplot2.continuous.fill = mediocrethemes::scale_mediocre_c)
  options(ggplot2.continuous.colour = mediocrethemes::scale_mediocre_c)
  options(ggplot2.discrete.fill = mediocrethemes::scale_mediocre_d)
  options(ggplot2.discrete.colour = mediocrethemes::scale_mediocre_d)
}
