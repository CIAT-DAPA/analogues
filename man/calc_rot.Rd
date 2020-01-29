\name{calc_rot}
\alias{calc_rot}
\title{
Data rotation using fast Fourier transform
}
\description{
Internal function to rotate data to align periods of peak observations which may not occur simultaneously at the reference site and in the search range. For instance this helps align the timing of summer in the Northern vs Southern hemispheres or the arrival of monsoon rains. 
}
\usage{
calc_rot(ref, sit)
}
\arguments{
  \item{ref}{
Vector of climatic data from the reference site
}
  \item{sit}{
Vector of climatic data from a pixel in the search range. This vector will be rotated to align periods of peak observations with that of the reference site
}
}

\examples{
a <- c(5,7,10,12,15,20,25,28,20,18,16,10) #reference
b <- c(35,33.5,32.5,29,25,23,19,15,16,22.5,24,32.5) #target
x <- calc_rot(a, b) #rotation point

#rotate series
if (x == 0 | abs(x) == 12) {
b_rot = b[1:12]
} else{
if (x >= 1) {
b_rot = b[c((1 + x):12, 1:x)]
}else{
b_rot = b[c((13 + x):12, 1:(12 + x))]
}}
}
