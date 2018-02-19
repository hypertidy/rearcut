data("minimal_mesh", package = "silicate")
coords <- silicate::sc_coord(minimal_mesh$geom[[1]])
gmap <- silicate::sc_path(minimal_mesh$geom[[1]])
##
rbind_na <- function(x) {
   head(dplyr::bind_rows(purrr::map(x, ~rbind(.x, NA))), -1L)
  }
library(dplyr)
minpoly <- coords %>%
  split(rep(seq_along(gmap$nrow), gmap$nrow)) %>%
  rbind_na()
usethis::use_data(minpoly)
#plot(minpoly)
#polypath(minpoly)



##------------------------------------------------
data("inlandwaters", package = "silicate")
tas <- sf::st_cast(inlandwaters, "POLYGON")
taslakes <- subset(tas, Province == "Tasmania")[2, ]
coords <- silicate::sc_coord(taslakes)
gmap <- silicate::sc_path(taslakes)
taslakes <- coords %>%
  split(rep(seq_along(gmap$ncoords_), gmap$ncoords_)) %>%
  rbind_na()

usethis::use_data(taslakes)
