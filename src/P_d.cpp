#include <Rcpp.h>
using namespace Rcpp;
#include "earcut.hpp"


//' P
//' @param x numeric vector x coordinates
//' @param y numeric vector y coordinates
//' @export
// [[Rcpp::export]]
IntegerVector P_d(NumericVector x, NumericVector y) {

  // The number type to use for tessellation
  using Coord = double;

  // The index type. Defaults to uint32_t, but you can also pass uint16_t if you know that your
  // data won't have more than 65536 vertices.
  using N = uint32_t;

  // Create array
  using Point = std::array<Coord, 2>;
  std::vector<std::vector<Point>> polygon(x.length());
  Point p = Point({1.1, 2.2});
  polygon[0] = {p};
  //polygon.push_back(Point{1.1, 2.2});
  IntegerVector out(1);

 out[0] = polygon.size();
 return out;
}
