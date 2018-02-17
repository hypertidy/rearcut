
<!-- README.md is generated from README.Rmd. Please edit that file -->
rearcut
=======

The goal of rearcut is to triangulate polygons for [silicate](https://github.com/hypertidy/silicate.git).

The basic function `earcut` for generic data is to be called with x/y coordinates in `x` (using the `grDevices::xy.coords` convention) and an optional marker index of where holes are.

``` r
## example data from polypath
## rather than separate rings by NA we indicate those positions
## (here the hole starts at 5 and is the only one)
x <- c(.1, .1, .9, .9, .2, .2, .8, .8)
y <- c(.1, .9, .9, .1, .2, .8, .8, .2)
library(rearcut)
ind <- earcut(cbind(x, y), holes = 5L)
rearcut:::plot_tri(x, y, ind, col = "grey")
```

<img src="man/figures/README-unnamed-chunk-1-1.png" width="100%" />

    #> NULL
