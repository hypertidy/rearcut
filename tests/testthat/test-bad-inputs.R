context("test-bad-inputs.R")

test_that("bad inputs are caught", {
  expect_error(earcut(1, 1), "need at least 3 coordinates")
  expect_error(earcut(list(x = 1:5, y = 1:6)), "Column `x` must be length 1 or 6, not 5")
  expect_error(earcut(cbind(1:4, c(1, NA, 3:4))), "missing values in y")
})
