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
  installed_fonts <- systemfonts::system_fonts()[["family"]]
  fonts_mediocre <- c("Lato", "Josefin Sans", "Source Code Pro")
  internet_needed <- FALSE
  if (!("Josefin Sans" %in% installed_fonts)) {
    header_font_goog <- xaringanthemer::google_font("Josefin Sans", "400")
    internet_needed <- TRUE
  } else {
    header_font_goog <- NULL
  }

  if (!("Lato" %in% installed_fonts)) {
    text_font_goog <-xaringanthemer::google_font("Lato", "400", "400i")
    internet_needed <- TRUE
  } else {
    text_font_goog <- NULL
  }

  if (!("Source Code Pro" %in% installed_fonts)) {
    code_font_goog <- xaringanthemer::google_font("Source Code Pro", "400")
    internet_needed <- TRUE
  } else {
    code_font_goog <- NULL
  }

  if (!curl::has_internet() & internet_needed) {
    warning(paste("Internet connexion or locally installed Google Fonts,
                  Lato, Josefin Sans and Source Code Pro required."))
  }

  xaringanthemer::style_mono_light(
    base_color = colors_table[[which(colors_table$color == pal), "base"]],
    text_color = text_color,
    background_color =
      colors_table[[which(colors_table$color == pal), "background"]],
    header_font_google = header_font_goog,
    header_font_family = ifelse(
      "Josefin Sans" %in% installed_fonts,
      "Josefin Sans",
      xaringanthemer::xaringanthemer_font_default("header_font_family")),
    text_font_google = text_font_goog,
    text_font_family = ifelse(
      "Lato" %in% installed_fonts,
      "Lato",
      xaringanthemer::xaringanthemer_font_default("text_font_family")),
    code_font_google = code_font_goog,
    code_font_family = ifelse(
      "Source Code Pro" %in% installed_fonts,
      "Source Code Pro",
      xaringanthemer::xaringanthemer_font_default("code_font_family")),
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
