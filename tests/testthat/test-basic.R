context("test-basic.R")

test_that("earcut works", {
  ## (here the hole starts at 5 and is the only one)
  x <- c(.1, .1, .9, .9, .2, .2, .8, .8)
  y <- c(.1, .9, .9, .1, .2, .8, .8, .2)
  ind <- earcut(cbind(x, y), holes = 5L)
  expect_equal(ind, c(1L, 5L, 6L, 8L, 5L, 1L, 2L, 1L, 6L, 8L, 1L, 4L, 3L, 2L, 6L,
                      7L, 8L, 4L, 3L, 6L, 7L, 7L, 4L, 3L))
  expect_silent(rearcut:::plot_tri(x, y, ind, col = "grey"))
})
