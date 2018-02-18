
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/rearcut)](https://cran.r-project.org/package=rearcut) [![Travis-CI Build Status](http://badges.herokuapp.com/travis/hypertidy/rearcut?branch=master&env=BUILD_NAME=trusty_release&label=linux)](https://travis-ci.org/hypertidy/rearcut) [![Build Status](http://badges.herokuapp.com/travis/hypertidy/rearcut?branch=master&env=BUILD_NAME=osx_release&label=osx)](https://travis-ci.org/hypertidy/rearcut) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hypertidy/rearcut?branch=master&svg=true)](https://ci.appveyor.com/project/hypertidy/rearcut) [![Coverage status](https://codecov.io/gh/hypertidy/rearcut/branch/master/graph/badge.svg)](https://codecov.io/github/hypertidy/rearcut?branch=master)

rearcut
=======

A direct coupling of [Mapbox earcut](https://github.com/mapbox/earcut) for R.

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

The idea is that more specialist contexts will wrap this lower level.

Another example.

``` r
txt <- readLines("https://raw.githubusercontent.com/mapbox/earcut/master/test/fixtures/water-huge.json")
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
x <- jsonlite::fromJSON(txt) %>% purrr::map_df(tibble::as_tibble, .id = "poly")


x <- x %>% filter(poly == 1)
tri <- earcut(x[c("V1", "V2")])
rearcut:::plot_tri(x$V1, x$V2, tri)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

    #> NULL

Installation
------------

Rearcut may be installed from Github.

``` r
## install.packages("devtools")
devtools::install_github("hypertidy/rearcut")
```

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
