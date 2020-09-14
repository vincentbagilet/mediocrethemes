## The (super simple) code to prepare the `color_table` dataset goes here

library(tidyverse)
library(readxl)

colors_table <- read_excel("data-raw/colors_table.xlsx")

usethis::use_data(color_table, overwrite = TRUE)
