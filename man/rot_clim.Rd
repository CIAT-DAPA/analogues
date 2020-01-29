\name{rot_clim}
\alias{rot_clim}
\title{
Rotate climate data
}
\description{
Internal function. Used within \code{\link{calc_similarity}}
}
\usage{
rot_clim(val_ref, training_targ, params)
}
\arguments{
  \item{val_ref}{Numeric vector of reference values}
  \item{training_targ}{Target Raster of values}
  \item{params}{List of parameters, created with function \code{\link{createParameters}}}
}
\value{
Vector of values
}
\seealso{
\code{\link{createParameters}},\code{\link{calc_similarity}}
}
\examples{
#no examples needed
}
