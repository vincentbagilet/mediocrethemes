library(mediocrethemes)
library(testthat)

test_that("Error if palette not correct", {
  expect_error(
    palette_mediocre_d(pal = "a"),
    'pal should be either "autumn", "rainbow", "green" or "hotcold"'
  )
  expect_error(
    palette_mediocre_d(pal = 1),
    'pal should be either "autumn", "rainbow", "green" or "hotcold"'
  )
  expect_error(
    palette_mediocre_c(pal = "a"),
    'pal should be either "autumn", "rainbow", "green" or "hotcold"'
  )
  expect_error(
    palette_mediocre_c(pal = 1),
    'pal should be either "autumn", "rainbow", "green" or "hotcold"'
  )
})
