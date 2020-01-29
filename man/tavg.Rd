\name{tavg}
\alias{tavg}
\docType{data}
\title{
Temperature RasterStack
}
\description{
A RasterStack (tavg) for temperature at the monthly scale
}
\usage{data(climstack)}
\format{
  A RasterStack with 12 months of data for average temperature.
}
\source{
Derived from WorldClim (http://worldclim.org), aggregated to a lower resolution.
}
\examples{
data(climstack)
rs <- tavg[[1]] #put first month of data onto a separate RasterLayer
#plot(rs) #plot
}
\keyword{datasets}
