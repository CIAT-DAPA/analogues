\name{similarity}
\alias{similarity}
\title{
Similarity calculation
}
\description{
Internal function to calculate similarity between a target set of pixels and the reference site. Used Used within \code{\link{calc_similarity}}
}
\usage{
similarity(training_targ, val_ref, params)
}
\arguments{
  \item{training_targ}{Target Raster of values}
  \item{val_ref}{Numeric vector of reference values}
  \item{params}{List of parameters, created with function \code{\link{createParameters}}}
}
\value{
Matrix of similarity values.
}
\seealso{
\code{\link{createParameters}},\code{\link{calc_similarity}}
}
\examples{
#no examples needed
}
