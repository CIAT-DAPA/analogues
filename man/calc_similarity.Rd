\name{calc_similarity}
\alias{calc_similarity}

\title{
Calculate climatic similarity
}
\description{
Uses the parameters specified by the function \code{\link{createParameters}}. Extracts climatic data from the reference site and compares with every pixel in the search range. Returns a map (RasterLayer) of the search range filled with the calculated climatic similarity.
}
\usage{
calc_similarity(params)
}

\arguments{
  \item{params}{
List of required input parameters, as specified to function \code{\link{createParameters}}
}
}

\value{
RasterLayer with the calculated similarity.
}

\seealso{
\code{\link{ref_vals}},\code{\link{rota_stack}},\code{\link{similarity}}
}
\examples{
data(climstack) #contains 2 RasterStack objects: prec and tavg

#create params, give equal weights to both variables
params <- createParameters(x=-75.5, y=3.2, vars=c("prec","tmean"),weights=c(0.5,0.5),
                        ndivisions=c(12,12),growing.season=c(1,12),rotation="tmean",threshold=1,
                        env.data.ref=list(prec,tavg), env.data.targ=list(prec,tavg),
                        outfile="~/.",fname='similarity',writefile=FALSE)

#calculate similarity
sim_out <- calc_similarity(params)
}