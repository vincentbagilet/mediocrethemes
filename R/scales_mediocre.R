#' Mediocre color scales
#'
#' The `mediocre` scales provide alternative default colors for ggplots.
#' These functions enable to create such palettes.
#' The main color palettes have been defined using \url{https://coolors.co/}.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be "autumn" or "rainbow"
#' @param ... Other arguments passed on to
#' \code{\link[ggplot2]{discrete_scale}},
#' \code{\link[ggplot2]{continuous_scale}},
#' or \code{\link[ggplot2]{binned_scale}} to control name, limits, breaks,
#' labels and so forth.
#'
#' @family color scales
#' @export
#'
#' @examples
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#'   geom_col() +
#'   theme_mediocre() +
#'   scale_mediocre_d()
#'
#' ggplot(ggplot2::mpg, aes(x = cty, y = displ, color = hwy)) +
#'   geom_point() +
#'   theme_mediocre() +
#'   scale_mediocre_c()
#'
scale_mediocre_d <- function(pal = "autumn", ...) {

  if (!(pal %in% c("autumn", "rainbow"))) {
    stop('pal should be either "autumn" or "rainbow"')
  }

  mediocrethemes::palette_mediocre_d(pal = pal)()
}

#' @export
#' @rdname scale_mediocre_d
scale_mediocre_c <- function(pal = "autumn", ...) {

  if (!(pal %in% c("autumn", "rainbow"))) {
    stop('pal should be either "autumn" or "rainbow"')
  }

  mediocrethemes::palette_mediocre_c(pal = pal)()
}
