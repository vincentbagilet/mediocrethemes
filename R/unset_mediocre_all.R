#' Unsets the mediocre theme and colors, reverting to the ggplot2 defaults.
#'
#' @export
#' @examples
#' unset_mediocre_all()
#'
unset_mediocre_all <- function() {
  ggplot2::theme_set(ggplot2::theme_gray())
  showtext::showtext_auto(FALSE)
  ggplot2::reset_geom_defaults()

  options(
    ggplot2.discrete.fill = "default",
    ggplot2.discrete.colour = "default",
    ggplot2.continuous.colour = "gradient",
    ggplot2.continuous.fill = "gradient"
  )
}
