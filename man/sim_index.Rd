\name{sim_index}
\alias{sim_index}
\title{
Similarity index lookup and normalization
}
\description{
Internal function. Used within \code{\link{calc_similarity}} to transform Euclidean distance into a 0 to 1 similarity index.
}
\usage{
sim_index(dist, var)
}
\arguments{
  \item{dist}{RasterLayer of Euclidean distance}
  \item{var}{Character indicating variable used to calculate similarity (e.g. prec)}
}
\value{
RasterLayer with normalized similarity metric.
}
\examples{
#no examples needed
}
