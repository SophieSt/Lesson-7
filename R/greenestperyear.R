### this function returns the province with the highest mean NDVI over the year.

greenestperyear = function(rasterobject, adm_boundaries, level = 2) {
  if (!level == 2){
    adm_boundaries = raster::aggregate(adm_boundaries, by=paste0('NAME_', level))
  }
  adm_RD = spTransform(adm_boundaries, CRS(proj4string(rasterobject)))
  meanNDVI = extract(rasterobject, adm_RD, na.rm=T, fun=mean, df=T, sp=T)
  months = c("January","February","March","April","May","June","July","August","September","October","November","December")
  meanNDVI@data$mean = rowMeans(meanNDVI@data[,months], na.rm=TRUE)
  highest = meanNDVI[which.max(meanNDVI@data$mean),]
  return (highest)
  
}


