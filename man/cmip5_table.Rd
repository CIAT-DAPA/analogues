\name{cmip5_table}
\alias{cmip5_table}
\docType{data}
\title{
CMIP5 climate model and RCP availability table
}
\description{
Data frame with 35 observaions listing all available climate models and RCPs.
}
\usage{data(sim_index_table)}
\format{
  A data frame with 35 observations on the following 6 variables.
  \describe{
    \item{\code{id}}{a numeric vector with numbers from 1 to 35}
    \item{\code{model}}{a factor which lists all climate models}
    \item{\code{rcp2_6}}{a numeric vector with values of 0 and 1, where 1 indicates available, and 0 indicates not available, for RCP2.6}
    \item{\code{rcp4_5}}{a numeric vector with values of 0 and 1, where 1 indicates available, and 0 indicates not available, for RCP4.5}
    \item{\code{rcp6_0}}{a numeric vector with values of 0 and 1, where 1 indicates available, and 0 indicates not available, for RCP6.0}
    \item{\code{rcp8_5}}{a numeric vector with values of 0 and 1, where 1 indicates available, and 0 indicates not available, for RCP8.5}
  }
}
\source{
Own elaboration, based on Table 1 in \url{https://www.nature.com/articles/s41597-019-0343-8}
}
\examples{
data(cmip5_table)
head(cmip5_table)
}
\keyword{datasets}
