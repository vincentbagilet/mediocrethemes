library(mediocrethemes)
library(testthat)
library(lintr)

# Unit Test for lintr()
if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {
    lintr::expect_lint_free(relative_path = FALSE)
  })
}
