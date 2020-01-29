\name{sim_index_table}
\alias{sim_index_table}
\docType{data}
\title{
Similarity index table
}
\description{
Data frame with 23 observaions for different variables for the use of the k metric to normalize the Euclidean distance into a 0 to 1 metric.
}
\usage{data(sim_index_table)}
\format{
  A data frame with 23 observations on the following 2 variables.
  \describe{
    \item{\code{var}}{a factor with levels \code{bio_1} \code{bio_10} \code{bio_11} \code{bio_12} \code{bio_13} \code{bio_14} \code{bio_15} \code{bio_16} \code{bio_17} \code{bio_18} \code{bio_19} \code{bio_2} \code{bio_3} \code{bio_4} \code{bio_5} \code{bio_6} \code{bio_7} \code{bio_8} \code{bio_9} \code{prec} \code{tmax} \code{tmean} \code{tmin}}
    \item{\code{k}}{a numeric vector}
  }
}
\source{
Own elaboration
}
\examples{
data(sim_index_table)
head(sim_index_table)
}
\keyword{datasets}
