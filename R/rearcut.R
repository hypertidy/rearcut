
#' @importFrom V8 v8
load_earcut <- function() {
  ct <- V8::v8()
  ## load up the bunde
  ct$source(system.file("js/earcutbundle.js", package = "rearcut"))
  ct
}

## numbers to json
toj <- function(x) {
  sprintf("[%s]", paste(x, collapse = ", "))
}
## x,y numbers to json
tojxy <- function(x, y) {
  sprintf("[%s]", paste(paste(x, y, sep = ","), collapse = ", "))
}
## run earcut
get_tri <- function(x, y, holes = NULL) {
  stopifnot(length(x) == length(y))
  stopifnot(!(any(is.na(x)) | any(is.na(y))))
  ct <- load_earcut()
  if (is.null(holes)) {
    ct$eval(sprintf("var triangles = earcut(%s);", tojxy(x, y)))

  } else {
    ## convert to Js 0-based index here
    ct$eval(sprintf("var triangles = earcut(%s, %s);", tojxy(x, y), toj(holes - 1L)))

  }
  ct$get("triangles") + 1L
}
#' @importFrom graphics plot polygon
plot_tri <- function(x, y, tri, ...) {
  xy <- cbind(x, y)
  plot(xy, pch = ".")

  apply(matrix(tri, nrow = 3), 2, function(a) polygon(xy[a, ], ...))
  invisible(NULL)
}

#' Ear cut algorithm
#'
#' Ear cutting for polygons, a method for constrained triangulation.
#'
#' @param x object to triangulate, any convertible to silicate PATH
#' @param holes 1-based index indicating where hole/s begin
#' @param ... arguments passed to methods
#' @name earcut
#' @return index triplets of triangles from vertex pool
#' @export
earcut <- function(x, holes = NULL, ...) {
  UseMethod("earcut")
}
#' @importFrom grDevices xy.coords
#' @name earcut
#' @export
earcut.default <- function(x, holes = NULL, ...) {
  xy <- grDevices::xy.coords(x)
  get_tri(xy$x, xy$y, holes = holes)
}


