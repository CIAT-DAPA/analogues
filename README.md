# analogues
This is the source code of the package analogues. The package is not on [CRAN](https://cran.r-project.org/web/packages/raster/index.html). The analogues package allows calculating climatic distances based on gridded climate data. The package was developed by [CCAFS](https://ccafs.cgiar.org).

## Installation
To install this package you can do:

```r
install.packages('devtools')
library(devtools)
install_github("CIAT-DAPA/analogues")
```

## Usage
You can use this package to calculate climatic similarity between a reference site and a prescribed area (e.g. the entire globe). This helps identifying locations with similar climates for, for instance, agricultural technology transfer or germplasm exchange. The following code should get you started (also see package examples):

```r
library(analogues)
data(climstack)

#create parameters
params <- createParameters(x=-75.5, y=3.2, vars=c("prec","tmean"),weights=c(0.5,0.5),
                           ndivisions=c(12,12),growing.season=c(1,12),rotation="tmean",threshold=1,
                           env.data.ref=list(prec,tavg), env.data.targ=list(prec,tavg),
                           outfile="~/.",fname=NA,writefile=FALSE)

#calculate similarity
sim_out <- calc_similarity(params)

#now you can plot the result
plot(sim_out)

#or save the result
writeRaster(sim_out,"~/analogues_output.tif")
```

The above example computes similarity for a site in South America (lon=-75.5, lat=3.2) with respect to the entire world. Climate data is from [WorldClim](http://worldclim.org), aggregated to 2 degrees, and reflects current climatic conditions (1979-2000). The similarity is computed based on both precipitation and average temperature, using the 12 months of the year.

## Climate data to use this package
We recommend that you use the following sources of climate data:
* For current climate data, use [WorldClim](http://worldclim.org). They provide globally comprehensive interpolated surfaces of current (1970-2000) climates at high resolution. Check this [paper](https://doi.org/10.1002/joc.5086) for more information on WorldClim.
* For future climate data, use the [CCAFS-Climate](http://ccafs-climate.org) data portal. CCAFS-Climate provides global high-resolution bias corrected data for all CMIP5 climate models and RCPs. Check this [paper](https://doi.org/10.1038/s41597-019-0343-8) for details.

We have built a function to directly download CCAFS-climate data. If you wish to download these data directly from R, and then use it in the ``analogues`` R package, the below examples will help you understand how to do that.

```r
library(analogues)

#download global future precipitation (monthly) for RCP 4.5, year 2030, at 10 arc-min spatial resolution
mydata1 <- getCMIP5(var="prec", rcp=4.5, model=10, year=2030, res=10, path='.')

#plot the 12 layers
plot(mydata1)

#download future precipitation (monthly) for RCP 4.5, year 2030, at 30 arc-sec spatial resolution
#use lon,lat to specify a location within your area of interest. We will search the right data tile.
mydata2 <- getCMIP5(var="prec", rcp=4.5, model=10, year=2030, res=0.5, lon=-75, lat=3, path='.')

#plot month 6
plot(mydata2[[6]])
```

Also check the function ``getData`` from the package ``raster``. That function will allow you to directly download WorldClim data (1971-2000 climate conditions).
