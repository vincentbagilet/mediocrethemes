#' Sets the mediocre theme and colors for the whole document.
#'
#' @inheritParams scale_mediocre_d
#' @inheritParams scale_mediocre_c
#' @inheritParams theme_mediocre
#'
#' @export
#' @examples
#' set_mediocre_all()
#'
set_mediocre_all <-
  function(pal = "autumn",
           background = FALSE,
           second_pair = FALSE,
           base_size = if (.Platform$OS.type == "windows") 17 else 14,
           base_family = "Lato",
           base_line_size = base_size / 50,
           base_rect_size = base_size / 170,
           gradient = NULL) {
    #side effect: var of colors corresponding to the palette
    colors_mediocre <- NULL
    colors_mediocre <<-
      mediocrethemes::colors_table[mediocrethemes::colors_table$pal == pal,]

    #set themes
    ggplot2::theme_set(mediocrethemes::theme_mediocre(
      pal = pal,
      gradient = gradient,
      background = background,
      base_size = base_size,
      base_family = base_family,
      base_line_size = base_line_size,
      base_rect_size = base_rect_size)
    )
    options(ggplot2.continuous.fill = mediocrethemes::palette_mediocre_c(
      pal = pal, gradient = gradient)
    )
    options(ggplot2.continuous.colour = mediocrethemes::palette_mediocre_c(
      pal = pal, gradient = gradient)
    )
    options(ggplot2.discrete.fill = mediocrethemes::palette_mediocre_d(
      pal = pal,
      second_pair = second_pair,
      gradient = gradient)
    )
    options(ggplot2.discrete.colour = mediocrethemes::palette_mediocre_d(
      pal = pal,
      second_pair = second_pair,
      gradient = gradient)
    )
  }
