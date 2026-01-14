#' Mediocre color scales
#'
#' The `mediocre` scales provide alternative default colors for ggplots.
#' These functions enable to create such palettes.
#' The main color palettes have been defined using \url{https://coolors.co/}.
#'
#' @inheritParams palette_mediocre_d
#' @inheritParams palette_mediocre_c
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
scale_mediocre_d <- function(pal = "autumn",
                             second_pair = FALSE,
                             gradient = NULL,
                             na.value = "gray91",
                             ...) {

  if (!(pal %in% mediocrethemes::colors_table[["pal"]])) {
    stop("This palette does not exist in this package")
  }

  mediocrethemes::palette_mediocre_d(
    pal = pal,
    second_pair = second_pair,
    gradient = gradient,
    na.value = na.value
  )()
}

#' @export
#' @rdname scale_mediocre_d
scale_mediocre_c <- function(pal = "autumn",
                             gradient = NULL,
                             na.value = "gray91",
                             ...) {

  if (!(pal %in% mediocrethemes::colors_table[["pal"]])) {
    stop("This palette does not exist in this package")
  }

  mediocrethemes::palette_mediocre_c(
    pal = pal,
    gradient = gradient,
    na.value = na.value
  )()
}
