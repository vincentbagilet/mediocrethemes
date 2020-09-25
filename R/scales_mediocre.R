#' Mediocre colour scales
#'
#' The `mediocre` scales provide alternative default colours for ggplots.
#' The main colour scale has been chosen and created using \url{https://coolors.co/}.
#'
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}},
#' \code{\link[ggplot2]{continuous_scale}}, or \code{\link[ggplot2]{binned_scale}} to control name, limits, breaks,
#'   labels and so forth.
#' @family colour scales
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
scale_mediocre_d <- function(...) {
  mediocre_color_vector <- c("#5F0F40", "#9A031E", "#FB9637", "#AE5E26", "#44524A", "#15343D")

  mediocre_pal <- grDevices::colorRampPalette(mediocre_color_vector)

  ggplot2::discrete_scale(
    ...,
    aesthetics = c("fill", "colour"),
    scale_name = "disc_scale",
    palette = mediocre_pal
  )
}

#' @export
#' @rdname scale_mediocre_d
scale_mediocre_c <- function(...) {
  mediocre_color_vector <- c("#5F0F40", "#9A031E", "#FB9637", "#AE5E26", "#44524A", "#15343D")

  ggplot2::scale_fill_gradientn(
    ...,
    colors = mediocre_color_vector,
    aesthetics = c("fill", "colour")
  )
}
