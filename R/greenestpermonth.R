### This function returns the administrative unit with the highest NDVI in a given month

greenestpermonth = function(rasterobject, adm_boundaries, month, level = 2) {
  if (!level == 2){
    adm_boundaries = raster::aggregate(adm_boundaries, by=paste0('NAME_', level))
  }
  rastermonth = rasterobject[[as.character(month)]]
  adm_RD = spTransform(adm_boundaries, CRS(proj4string(rasterobject)))
  meanNDVI = extract(rastermonth, adm_RD, na.rm=T, fun=mean, df=T, sp=T)
  highest = meanNDVI[which.max(meanNDVI@data[, month]),]
  return (highest)

}
