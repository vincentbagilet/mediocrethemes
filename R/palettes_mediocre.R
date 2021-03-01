#' Mediocre color palette
#'
#' The `mediocre` palettes provide alternative default colors for ggplots.
#' These functions enable to create such palettes.
#' The main color palettes have been defined using \url{https://coolors.co/}.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be "autumn" or "rainbow"
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
#' palette_mediocre_d()
#'
#' palette_mediocre_c(pal = "rainbow")
#'
palette_mediocre_d <- function(pal = "autumn", second_pair = FALSE, ...) {

  if (!(pal %in% c("autumn", "rainbow", "green", "hotcold"))) {
    stop('pal should be either "autumn", "rainbow", "green" or "hotcold"')
  }

  make_palette <- function(...) {
    colors_table <- mediocrethemes::colors_table
    color_theme <- colors_table[which(colors_table$color == pal), ]
    mediocre_color_vector <- unlist(
      strsplit(color_theme[["vector"]], split = ", ")
    )

    mediocre_pal <- function(n) {
      if (n == 2) {
        #cannot tell apart extreme values of the scale
        color_vector <- mediocre_color_vector[
          c(1 + 5 * second_pair + (pal == "hotcold"),
            8 + 5 * second_pair + (pal == "hotcold")
          )]
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
      palette = mediocre_pal,
      na.value = "grey"
    )
  }

  return(make_palette)
}

#' @export
#' @rdname scale_mediocre_d
palette_mediocre_c <- function(pal = "autumn", ...) {

  if (!(pal %in% c("autumn", "rainbow", "green", "hotcold"))) {
    stop('pal should be either "autumn", "rainbow", "green" or "hotcold"')
  }

  make_palette <- function(...) {
    colors_table <- mediocrethemes::colors_table
    color_theme <- colors_table[which(colors_table$color == pal), ]
    mediocre_color_vector <- unlist(
      strsplit(color_theme[["vector"]], split = ", ")
    )

    ggplot2::scale_fill_gradientn(
      ...,
      colors = mediocre_color_vector,
      aesthetics = c("fill", "color"),
      na.value = "grey"
    )
  }

  return(make_palette)
}
