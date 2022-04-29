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
#' @param gradient a string, either "left" or "right".
#' Turns divergent palettes into gradient ones by splitting it in two.
#' If equal to "right", the gradient palette is built with the right hand
#' side part of the divergent palette. If equal to "left", uses the left
#' hand side but flipping so that light values are on the left.
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
palette_mediocre_d <- function(pal = "autumn",
                               second_pair = FALSE,
                               gradient = NULL,
                               ...) {

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }
  if (!is.null(gradient)) {
    if (!(gradient %in% c("left", "right"))) {
      warning("If provided, gradient must be either 'left' or 'right'")
    }
  }

  make_palette <- function(...) {
    #access colors from table
    colors_table <- mediocrethemes::colors_table
    color_theme <- colors_table[which(colors_table$color == pal), ]
    mediocre_color_vector <- unlist(
      strsplit(color_theme[["vector"]], split = ", ")
    )
    mediocre_color_four <- unlist(
      strsplit(color_theme[["four_colors"]], split = ", ")
    )

    #make a gradient palette
    if (!is.null(gradient) & !(pal %in% c("green", "blackandwhite"))) {
      if (gradient == "right") {
        mediocre_color_vector <- mediocre_color_vector[8:15]
      } else if (gradient == "left") {
        mediocre_color_vector <- rev(mediocre_color_vector[1:8])
      }
    }

    #set second pair
    if (second_pair) {
      mediocre_color_four <- rev(mediocre_color_four)
    }

    mediocre_pal <- function(n) {
      if (is.null(gradient)) {
        if (n == 2) {
          color_vector <- mediocre_color_four[1:2]
        } else if (n == 3) {
          color_vector <- mediocre_color_four[-3]
        } else if (n == 4) {
          color_vector <- mediocre_color_four
        } else {
          color_vector <- mediocre_color_vector
        }
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
      na.value = "gray91"
    )
  }

  return(make_palette)
}

#' @family color scales
#' @export
#'
#' @rdname palette_mediocre_d
palette_mediocre_c <- function(pal = "autumn", gradient = NULL, ...) {

  if (!(pal %in% mediocrethemes::colors_table[["color"]])) {
    stop("This palette does not exist in this package")
  }
  if (!is.null(gradient)) {
    if (!(gradient %in% c("left", "right"))) {
      warning("If provided, gradient must be either 'left' or 'right'")
    }
  }

  make_palette <- function(...) {
    colors_table <- mediocrethemes::colors_table
    color_theme <- colors_table[which(colors_table$color == pal), ]
    mediocre_color_vector <- unlist(
      strsplit(color_theme[["vector"]], split = ", ")
    )

    if (!is.null(gradient)) {
      if (gradient == "right") {
        mediocre_color_vector <- mediocre_color_vector[8:15]
      } else if (gradient == "left") {
        mediocre_color_vector <- rev(mediocre_color_vector[1:8])
      }
    }

    ggplot2::scale_fill_gradientn(
      ...,
      colors = mediocre_color_vector,
      aesthetics = c("fill", "color"),
      na.value = "gray91"
    )
  }

  return(make_palette)
}
