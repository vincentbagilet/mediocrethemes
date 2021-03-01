#' Mediocre color scales
#'
#' The `mediocre` scales provide alternative default colors for ggplots.
#' These functions enable to create such palettes.
#' The main color palettes have been defined using \url{https://coolors.co/}.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be either "autumn", "rainbow", "green",
#'  "hotcold", "blackandwhite", or "coty"
#' @param second_pair if true sets an alternative pair of colors
#' for graphs with two colors
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
scale_mediocre_d <- function(pal = "autumn", second_pair = FALSE, ...) {

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }

  mediocrethemes::palette_mediocre_d(pal = pal, second_pair = second_pair)()
}

#' @export
#' @rdname scale_mediocre_d
scale_mediocre_c <- function(pal = "autumn", ...) {

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }

  mediocrethemes::palette_mediocre_c(pal = pal)()
}
