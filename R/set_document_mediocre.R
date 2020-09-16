#' Sets the mediocre theme and colors for the whole document.
#'
#' @export
#' @examples
#' set_document_mediocre()
#'
set_document_mediocre <- function() {
  ggplot2::theme_set(mediocrethemes::theme_mediocre())
  scale_fill_discrete <- function(...) mediocrethemes::scale_mediocre_d(...)
  scale_fill_continuous <- function(...) mediocrethemes::scale_mediocre_c(...)
}
