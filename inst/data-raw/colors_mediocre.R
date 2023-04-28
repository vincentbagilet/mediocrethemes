## The (super simple) code to prepare the `colors_mediocre` data set goes here

library(readxl)

colors_mediocre <- read_excel("inst/data-raw/colors_mediocre.xlsx")

usethis::use_data(colors_mediocre, overwrite = TRUE)
