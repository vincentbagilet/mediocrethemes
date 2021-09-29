#' Mediocre xanringan theme
#'
#' This function creates a CSS file \code{mediocre-xaringan.css} to build
#' \href{https://pkg.garrickadenbuie.com/xaringanthemer/}{\code{xaringanthemer}}
#' slides, based on mediocrethemes style, fonts and colors.
#'
#' For more information on how to use this function,
#' please refer to the associated vignette.
#'
#' @param pal a string. Defines the color palette selected.
#' Can either be either "autumn", "rainbow", "green",
#'  "hotcold", "blackandwhite", or "coty"
#' @param mediocre_plots if TRUE, sets the plots of the .Rmd document
#' to be made with mediocrethemes (calls \code{set_mediocre_all(pal)})
#'
#' @return This function adds a CSS file to your current working directory.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' xaringan_mediocre()
#'
#' xaringan_mediocre(pal = "rainbow")
#'}
xaringan_mediocre <- function(pal = "autumn", mediocre_plots = TRUE) {

  if (mediocre_plots) {
    mediocrethemes::set_mediocre_all(pal = pal, background = TRUE)
  }

  colors_table <- mediocrethemes::colors_table
  text_color <- ifelse(
    pal %in% c("rainbow", "coty"),
    colors_table[[which(colors_table$color == pal), "text"]],
    colors_table[[which(colors_table$color == pal), "base"]]
  )

  #set fonts
  if (!("Lato" %in% systemfonts::system_fonts()[["family"]]) |
    !("Josefin Sans" %in% systemfonts::system_fonts()[["family"]]) |
    !("Source Code Pro" %in% systemfonts::system_fonts()[["family"]])) {
    if (curl::has_internet()) {
      josefin <- xaringanthemer::google_font("Josefin Sans", "400")
      lato <- xaringanthemer::google_font("Lato", "400", "400i")
      source_code <- xaringanthemer::google_font("Source Code Pro", "400")
    } else {
      warning("Internet connexion or
         locally installed Google Fonts Lato,
         Josefin Sans and Source Code Pro required.")
    }
  }

  xaringanthemer::style_mono_light(
    base_color = colors_table[[which(colors_table$color == pal), "base"]],
    text_color = text_color,
    background_color =
      colors_table[[which(colors_table$color == pal), "background"]],
    header_font_google = josefin,
    text_font_google   = lato,
    code_font_google = source_code,
    header_font_weight = "bold",
    text_bold_color =
      colors_table[[which(colors_table$color == pal), "complementary"]],
    link_color =
      colors_table[[which(colors_table$color == pal), "complementary"]],
    text_font_size = "30px",
    header_h1_font_size = "52px",
    header_h2_font_size = "42px",
    header_h3_font_size = "32px",
    text_slide_number_font_size = "16px",
    outfile = "xaringan-mediocre.css"
  )
}
