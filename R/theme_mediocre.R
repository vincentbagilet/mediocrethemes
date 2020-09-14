#' Defines the ggplot theme with the corresponding colors.
#'
#' @param color A string. Define the main color of the theme. Possible options are "gray",
#'
#' @examples
#' ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#' geom_col() +
#' theme_mediocre() +
#' labs(title = "A very nice title", subtitle = "A desapointing subtitle")
#'
#' ggplot(data = ggplot2::mpg, aes(x = cty, y = displ, fill = manufacturer)) +
#' geom_point() +
#' theme_mediocre() +
#' labs(title = "A very nice title", subtitle = "A desapointing subtitle")

theme_mediocre <- function(color = "gray") {
  color_type <- colors_table[which(colors_table$color == "gray"),]

  update_geom_defaults(geom = "point", list(colour = color_type[["base"]]))
  update_geom_defaults(geom = "bar", list(fill = color_type[["base"]]))
  update_geom_defaults(geom = "col", list(fill = color_type[["base"]]))
  update_geom_defaults(geom = "line", list(colour = color_type[["base"]]))
  update_geom_defaults(geom = "density", list(colour = color_type[["base"]]))
  update_geom_defaults(geom = "smooth", list(colour = color_type[["light"]], fill = color_type[["light"]], alpha = 0.2))

  colors_pal <- c("#470B0B", "#6A1011", "#A0181A","#D52023", "#F94144", "#F86335", "#F68425", "#F9AF37", "#F9C74F", "#DFC557", "#C5C35E", "#90BE6D", "#43AA8B", "#4D908E", "#577590", "#415462", "#2B353B", "#1C1F22")
  own_pal <- colorRampPalette(colors_pal)
  # own_pal_disc <- c("#6A1011", "#1C1F22", "#43AA8B", "#4D908E", "#577590", "#415462", "#2B353B", "#1C1F22")

  return(list(theme_mediocre_only(color), discrete_scale(aesthetics = c("fill", "color"), scale_name = "disc_scale", palette = own_pal), scale_fill_gradientn(colors = colors_pal, aesthetics = c("fill", "color"), scale_name = "disc_scale", palette = own_pal)))
}



