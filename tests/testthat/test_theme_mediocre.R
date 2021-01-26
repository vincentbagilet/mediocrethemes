library(mediocrethemes)
library(testthat)

test_that("Error if background not logical", {
  expect_error(theme_mediocre(background = "a"), "background should be logical")
  expect_error(theme_mediocre(background = 1), "background should be logical")
})
