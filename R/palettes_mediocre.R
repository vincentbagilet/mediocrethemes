#' Mediocre color palette
#'
#' The `mediocre` palettes provide alternative default colors for ggplots.
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
#' palette_mediocre_d()
#'
#' palette_mediocre_c(pal = "rainbow")
#'
palette_mediocre_d <- function(pal = "autumn", second_pair = FALSE, ...) {

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }

  make_palette <- function(...) {
    colors_table <- mediocrethemes::colors_table
    color_theme <- colors_table[which(colors_table$color == pal), ]
    mediocre_color_vector <- unlist(
      strsplit(color_theme[["vector"]], split = ", ")
    )

    if (pal %in% c("green", "blackandwhite")) {
      mediocre_color_vector <- rev(mediocre_color_vector)
    }

    if (pal == "autumn") {
      set_colors <- c(1, 8, 14)
    } else if (pal == "coty") {
      set_colors <- c(3, 9, 15)
    } else if (pal == "hotcold") {
      set_colors <- c(1, 10, 15)
    } else {
      set_colors <- c(1, 9, 15)
    }

    mediocre_pal <- function(n) {
      if (n == 2) {
        if (pal %in% c("coty", "rainbow")) {
          set_colors <- set_colors + 2 * second_pair
        } else {
          set_colors <- set_colors + 5 * second_pair
        }
        color_vector <- mediocre_color_vector[set_colors[1:2]]
      } else if (n == 3) {
        color_vector <- mediocre_color_vector[set_colors]
      } else if (n == 4) {
        color_vector <- mediocre_color_vector[-c(12, 13, 15)]
      } else {
        if (pal %in% c("green", "blackandwhite")) {
          mediocre_color_vector <- rev(mediocre_color_vector)
        }
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

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
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
