#' A table with different colors combinations for the theme
#'
#' A table containing the name of the color combination, a base color,
#' a background color, a lighter and a darker one
#'
#' @format A data frame with 644 rows and 3 variables:
#' \describe{
#'   \item{color}{color set name}
#'   \item{base}{base color, for one color graphs}
#'   \item{text}{color for text and axes}
#'   \item{background}{color for the background of plots}
#'   \item{complementary}{a complementary color to the base color, for contrast}
#'   \item{vector}{a vector of colors used in the scale}
#'   \item{four_colors}{a vector of 4 colors used when number of colors limited.
#'    For 3 colors, the third color in this list is dropped}
#'   ...
#' }
"colors_table"
