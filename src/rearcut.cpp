#include <Rcpp.h>
using namespace Rcpp;
#include "earcut.hpp"

// The number type to use for tessellation
using Coord = double;

// The index type. Defaults to uint32_t, but you can also pass uint16_t if you know that your
// data won't have more than 65536 vertices.
using N = uint32_t;

// Create array
using Point = std::array<Coord, 2>;

//' Polygon triangulation
//'
//' Constrained polygon triangulation by ear cut algorithm,
//' also known as ear clipping.
//' @param x numeric vector x coordinates
//' @param y numeric vector y coordinates
//' @export
//' @examples
//' X <- c(0, 0, 0.75, 1, 0.5, 0.8, 0.69, 0)
//' Y <- c(0, 1, 1, 0.8, 0.7, 0.6, 0, 0)
//' ind <- rearcut(X, Y)  ## should be longer than 0 :)
//' if (length(ind) < 3) {
//'  ## this is rgl's solution, it's not necessarily deterministic
//'  ind <- c(8L, 2L, 1L, 8L, 5L, 2L, 8L, 7L, 5L, 5L, 3L, 2L, 5L,
//'               4L, 3L, 7L, 6L, 5L) - 1
//' }
//' plot(X, Y)
//' apply(matrix(ind, nrow = 3), 2, function(x) polygon(cbind(X, Y)[x + 1, ]))
// [[Rcpp::export]]
IntegerVector rearcut(NumericVector x, NumericVector y) {

  std::vector<std::vector<Point>> polygon;
  // ... fill polygon structure with actual data
  for (int ipoint = 0; ipoint < x.length(); ipoint++){
    // I don't see how to make this vector :)
    //polygon.push_back( std::make_pair( Point(x[ipoint], y[ipoint]), ipoint) );
  }

  // Run tessellation
  // Returns array of indices that refer to the vertices of the input polygon.
  // Three subsequent indices form a triangle.
  std::vector<N> indices = mapbox::earcut<N>(polygon);

  Rcpp::IntegerVector output(indices.size());
  for (int ii = 0; ii < output.length(); ii++) {
    output[ii] = indices[ii];

  }
  return output;
}


