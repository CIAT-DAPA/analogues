\name{rota_stack}
\alias{rota_stack}
\title{
Rotate climate data stack
}
\description{
Internal function. Used within \code{\link{calc_similarity}}
}
\usage{
rota_stack(val_ref, training_targ, params)
}
\arguments{
  \item{val_ref}{Numeric vector of reference values}
  \item{training_targ}{Target Raster of values}
  \item{params}{List of parameters, created with function \code{\link{createParameters}}}
}
\value{
Rotated RasterStack
}
\seealso{
\code{\link{createParameters}},\code{\link{calc_similarity}}
}
\examples{
#no examples needed
}
