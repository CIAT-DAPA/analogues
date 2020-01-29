\name{prec}
\alias{prec}
\docType{data}
\title{
Precipitation RasterStack
}
\description{
A RasterStack (prec) with total precipitation at the monthly scale
}
\usage{data(climstack)}
\format{
  A RasterStack with 12 months of gridded data for precipitation.
}
\source{
Derived from WorldClim (http://worldclim.org), aggregated to a lower resolution.
}
\examples{
data(climstack)
rs <- prec[[1]] #put first month of data onto a separate RasterLayer
#plot(rs) #plot
}
\keyword{datasets}
