# reproject input to projected dutch system, centered to Wageningen

reproject = function (object, object2) {
  prj_string_RD = CRS(proj4string(object2))
  reprojected = spTransform(object, prj_string_RD)
  return (reprojected)
}