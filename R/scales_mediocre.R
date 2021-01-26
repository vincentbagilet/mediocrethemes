#' Mediocre color scales
#'
#' The `mediocre` scales provide alternative default colors for ggplots.
#' The main color scale has been defined using \url{https://coolors.co/}.
#'
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
scale_mediocre_d <- function(...) {

  colors_table <- mediocrethemes::colors_table
  color_theme <- colors_table[which(colors_table$color == "gray"), ]
  mediocre_color_vector <- unlist(
    strsplit(color_theme[["vector"]], split = ", ")
  )

  mediocre_pal <- function(n) {
    if (n == 2) { #cannot tell apart extreme values of the scale
      color_vector <- mediocre_color_vector[c(1, 8)]
    } else if (n == 3) {
      color_vector <- mediocre_color_vector[-c(2, 15)]
    } else if (n == 4) {
      color_vector <- mediocre_color_vector[-c(12, 13, 15)]
    } else {
      color_vector <- mediocre_color_vector
    }
    the_palette <- grDevices::colorRampPalette(color_vector)

    return(the_palette(n))
  }

  ggplot2::discrete_scale(
    ...,
    aesthetics = c("fill", "color"),
    scale_name = "disc_scale",
    palette = mediocre_pal
  )
}

#' @export
#' @rdname scale_mediocre_d
scale_mediocre_c <- function(...) {

  colors_table <- mediocrethemes::colors_table
  color_theme <- colors_table[which(colors_table$color == "gray"), ]
  mediocre_color_vector <- unlist(
    strsplit(color_theme[["vector"]], split = ", ")
  )

  ggplot2::scale_fill_gradientn(
    ...,
    colors = mediocre_color_vector,
    aesthetics = c("fill", "color")
  )
}
