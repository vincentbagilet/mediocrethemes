library(mediocrethemes)
library(testthat)

test_that("Error if palette not correct", {
  expect_error(
    palette_mediocre_d(pal = "a"),
    "This palette does not exist in this package"
  )
  expect_error(
    palette_mediocre_d(pal = 1),
    "This palette does not exist in this package"
  )
  expect_error(
    palette_mediocre_c(pal = "a"),
    "This palette does not exist in this package"
  )
  expect_error(
    palette_mediocre_c(pal = 1),
    "This palette does not exist in this package"
  )
})
