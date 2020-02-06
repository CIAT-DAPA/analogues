\name{getCMIP5}
\alias{getCMIP5}
\title{
Format input parameters
}
\description{
Loads required packages and formats input parameters.
}
\usage{
getCMIP5(var, rcp, model, year, res, lon=NA, lat=NA, path='')
}

\arguments{
  \item{var}{
character: name of variable. Use one of 'prec', 'tmin', 'tmax', 'tmean', or 'bio'
}
  \item{rcp}{
numeric: representative concentrations pathway (RCP). Use one of 2.6, 4.5, 6.0, or 8.5.
}
  \item{model}{
numeric: a number from one to 35 indicating the model to be used. The full CMIP5 model list is in \code{\link{cmip5_table}}. Note that not all models are available for all RCPs.
}
  \item{year}{
numeric: the future year for which projections are to be downloaded. Available years are 2030, 2050, 2070, and 2080.
}
  \item{res}{
numeric: spatial resolution, in arc-min. Use one of 0.5, 2.5, 5, or 10.
}
  \item{lon}{
numeric: longitude (in decimal degrees) of a site so that a tile can be identified. Only needed when res=0.5 data.
}
  \item{lat}{
numeric: latitude (in decimal degrees) of a site so that a tile can be identified. Only needed when res=0.5 data.
}
  \item{path}{
character: path where the downloaded files will be stored.
}
}

\details{
To download 30s precipitation data of a given model, for RCP4.5 in 2030:

\code{getCMIP5(var="prec", rcp=4.5, model=10, year=2030, res=0.5, lon=-75, lat=3, path='')}

To download 10min global precipitation data of the same model, for RCP4.5 in 2030:

\code{getCMIP5(var="prec", rcp=4.5, model=10, year=2030, res=10, path='')}
}

\value{
A spatial object of class RasterStack with all layers.
}

\references{
\url{http://ccafs-climate.org}

\url{https://doi.org/10.1038/s41597-019-0343-8}
}