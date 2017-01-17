### Team: Kraftfahrzeug-Haftpflichtversicherung
### Authors: Felten, Bettina; Stuhler, Sophie C.
### Date: 16-01-2017

# Import libraries
library(sp)
library(rgdal)
library(rgeos)

# Source functions
source('R/checkdir.R')
source('R/getsourcedata.R')
source('R/reproject.R')
source('R/greenestpermonth.R')
source('R/greenestperyear.R')



# call functions
checkdir('data')
getsourcedata('https://raw.githubusercontent.com/GeoScripting-WUR/VectorRaster/gh-pages/data/MODIS.zip', 'data', 'MODIS_NDVI.zip')
modispath = list.files(path='data', pattern=glob2rx('MOD*.grd'), full.names=T)
modis = brick(modispath)
nlMunicipality = getData('GADM', country='NLD', path='data', level=2)
nl_RD = reproject(nlMunicipality, modis)     # make sure to use projection from raster object 

highestjan = greenestpermonth(modis, nlMunicipality, 'January')
highestaug = greenestpermonth(modis, nlMunicipality, 'August')
highestprovjan = greenestpermonth(modis, nlMunicipality, 'January', level=1)
highestyear = greenestperyear(modis, nlMunicipality)

# plot the NDVI in januay and the municipality and province with the highest NDVI in january
plot(modis$January, axes=T, main='NDVI in January')
plot(highestjan, add=T)
plot(highestprovjan, add=T)
box()
mtext(side = 1, "Longitude", line = 2.5, cex=1.1)
mtext(side = 2, "Latitude", line = 2.5, cex=1.1)


