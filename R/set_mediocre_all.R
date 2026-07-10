#' Sets the mediocre theme and colors for the whole document.
#'
#' @param theme a string. Defines the theme used, either "mediocre" or "idid"
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
           theme = "mediocre",
           gradient = NULL,
           background = FALSE,
           black_text = FALSE,
           second_pair = FALSE,
           base_size = NULL,
           base_family = NULL,
           base_line_size = NULL,
           base_rect_size = NULL) {

    if (!(theme %in% c("mediocre", "idid"))) {
      stop("theme should be either 'mediocre' or 'idid'")
    }

    #side effect: var of colors corresponding to the palette
    colors_mediocre <- NULL
    colors_mediocre <<-
      mediocrethemes::colors_table[mediocrethemes::colors_table$pal == pal,]

    #set themes
    theme_fun <- if (theme == "idid") {
      mediocrethemes::theme_idid
    } else {
      mediocrethemes::theme_mediocre
    }

    #only override the theme function's own base_size/family/line/rect
    #defaults when the user actually provided one
    theme_args <- list(
      pal = pal,
      gradient = gradient,
      background = background,
      black_text = black_text
    )
    if (!is.null(base_size)) theme_args$base_size <- base_size
    if (!is.null(base_family)) theme_args$base_family <- base_family
    if (!is.null(base_line_size)) theme_args$base_line_size <- base_line_size
    if (!is.null(base_rect_size)) theme_args$base_rect_size <- base_rect_size

    ggplot2::theme_set(do.call(theme_fun, theme_args))
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
