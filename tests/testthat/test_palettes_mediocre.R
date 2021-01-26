library(mediocrethemes)
library(testthat)

test_that("Error if palette not defined", {
  expect_error(
    palette_mediocre_d(pal = "a"),
    'pal should be either "autumn" or "rainbow"'
  )
  expect_error(
    palette_mediocre_d(pal = 1),
    'pal should be either "autumn" or "rainbow"'
  )
  expect_error(
    palette_mediocre_c(pal = "a"),
    'pal should be either "autumn" or "rainbow"'
  )
  expect_error(
    palette_mediocre_c(pal = 1),
    'pal should be either "autumn" or "rainbow"'
  )
})
