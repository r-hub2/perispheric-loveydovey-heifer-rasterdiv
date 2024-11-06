## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(fig.width=10, fig.height=10,fig.asp = 0.618, out.width = "95%", fig.align = "center", fig.dpi = 150, collapse = FALSE, comment = "#") 
#knitr::opts_chunk$set(dev = 'pdf')


## ----results='hide', message=FALSE, warning=FALSE-----------------------------
require(rasterdiv)
require(terra)
require(rasterVis)
require(RColorBrewer)

## ----results='hide', message=FALSE, warning=FALSE-----------------------------
copNDVI <- load_copNDVI()

## -----------------------------------------------------------------------------
#Resample using terra::aggregate and a linear factor of 10
copNDVI <- terra::aggregate(copNDVI, fact=20)

## ----echo = T, results = 'hide', warning=FALSE, message=FALSE-----------------
#Shannon's Diversity
sha <- Shannon(copNDVI,window=9,na.tolerance=0.2,np=1)

#Pielou's Evenness
pie <- Pielou(copNDVI,window=9,na.tolerance=0.2,np=1)

#Berger-Parker's Index
ber <- BergerParker(copNDVI,window=9, na.tolerance=0.2, np=1)

#Parametric Rao's quadratic entropy with alpha ranging from 1 to 3
prao <- paRao(copNDVI, window=9, alpha=c(1:3), na.tolerance=0.8, dist_m="euclidean", np=1)

#Cumulative residual entropy 
cre <- CRE(copNDVI, window=9, na.tolerance=1, np=1, simplify=0)

#Hill's numbers
hil <- Hill(copNDVI, window=9, alpha=seq(0,1,0.5), na.tolerance=0.2, np=1)

#Rényi's Index
ren <- Renyi(copNDVI, window=9, alpha=seq(0,1,0.5), na.tolerance=0.2, np=1)

## ----fig03--------------------------------------------------------------------
#Shannon's Diversity
levelplot(sha, main="Shannon's entropy from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T,layout=c(0,1,1), ylim=c(-60,75), margin = list(draw = TRUE))

## ----fig04--------------------------------------------------------------------
#Pielou's Evenness
levelplot(pie, main="Pielou's evenness from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T, layout=c(0,1,1), ylim=c(-60,75), margin = list(draw = TRUE))

## ----fig05--------------------------------------------------------------------
#Berger-Parker' Index
levelplot(ber, main="Berger-Parker's index from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T, layout=c(0,1,1), ylim=c(-60,75), margin = list(draw = TRUE))

## ----fig06--------------------------------------------------------------------
#Parametric Rao's quadratic Entropy
levelplot(rast(prao[[1]]), main="Parametric Rao's quadratic entropy from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T,layout=c(0,3,1), ylim=c(-60,75), margin = list(draw = TRUE))


## ----fig07--------------------------------------------------------------------
#Cumulative residual entropy
levelplot(cre, main="Cumulative residual entropy from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T, layout=c(0,1,1), ylim=c(-60,75), margin = list(draw = TRUE))


## ----fig09--------------------------------------------------------------------
#Hill's numbers (alpha=0, 0.5 and 1)
levelplot(terra::rast(hil), main="Hill's numbers from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T, layout=c(0,3,1), ylim=c(-60,75))

## ----fig00--------------------------------------------------------------------
#Renyi' Index (alpha=0, 0.5 and 1)
levelplot(terra::rast(ren), main="Renyi's entropy from Copernicus NDVI 5 km (9 px-side moving window)", as.table = T,layout=c(0,3,1), names.attr=paste("alpha",seq(0,1,0.5),sep=" "), ylim=c(-60,75), margin = list(draw = FALSE))

