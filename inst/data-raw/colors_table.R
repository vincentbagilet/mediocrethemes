## The (super simple) code to prepare the `color_table` data set goes here

library(readxl)

colors_table <- read_excel("inst/data-raw/colors_table.xlsx")

usethis::use_data(colors_table, overwrite = TRUE)
