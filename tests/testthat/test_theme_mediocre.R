library(mediocrethemes)
library(testthat)

test_that("Error if background not logical", {
  expect_error(theme_mediocre(background = "a"), "background should be logical")
  expect_error(theme_mediocre(background = 1), "background should be logical")
})

test_that("Error if palette not correct", {
  expect_error(
    theme_mediocre(pal = "a"),
    'pal should be either "autumn", "rainbow", "green", "hotcold", "blackandwhite", or "coty"'
    }
  )
  expect_error(
    theme_mediocre(pal = 1),
    'pal should be either "autumn", "rainbow", "green", "hotcold", "blackandwhite", or "coty"'
  )
})
