\name{createParameters}
\alias{createParameters}
\title{
Format input parameters
}
\description{
Loads required packages and formats input parameters.
}
\usage{
createParameters(x, y, vars, weights, ndivisions, env.data.ref, env.data.targ, 
growing.season, rotation, threshold, outfile, fname, writefile)
}

\arguments{
  \item{x}{
numeric: latitude (decimal degrees)
}
  \item{y}{
numeric: longitude (decimal degrees)
}
  \item{vars}{
character vector: a vector with the name of the climatic variable(s) to use, e.g. c("prec","tmean"), or bioclimatic variable e.g. "bio_1"
}
  \item{weights}{
numeric vector: vector of length equal to the number of variables. Each value in the vector gives the weight given to each variable in the range 0-1. The sum of the weights must equal 1.
}
  \item{ndivisions}{
numeric vector: the number of divisions (usually months) for each variable. ndivisions=12 for climatic variables and ndivisions=1 for bioclimatic (or other types of variables) variables.
}
  \item{env.data.ref}{
list: a list of length equal to the number of variables that specifies the reference climatic conditions. Each element in the list is either a RasterLayer or a RasterStack object. RasterLayer applies to bioclimatic variables, whereas RasterStack applies for monthly data.
}
  \item{env.data.targ}{
list: a list of length equal to the number of variables that specifies the target climatic conditions. Each element in the list is either a RasterLayer or a RasterStack object. RasterLayer applies to bioclimatic variables, whereas RasterStack applies for monthly data.
}
  \item{growing.season}{
numeric vector: growing season (months) of interest in the analysis. Specified as a vector of length 2, where the first value specifies the start and the second value specifies the end of growing season. Not relevant for bioclimatic variables
}
  \item{rotation}{
character: should a rotation be applied. i.e. "tmean", "prec", "both" or "none". Rotation will allow comparisons between sites with different seasonality (e.g. northern vs. southern hemisphere)
}
  \item{threshold}{
numeric: value between 0-1. Only sites with a climatic similarity above this threshold will be saved and displayed.  
}
  \item{outfile}{
character: directory where the resultant similarity map will be saved
}
  \item{fname}{
character: name of output file
}
  \item{writefile}{
logical: if the output file is to be written on disk. Otherwise only an object will be returned.
}
}

\seealso{
\code{\link{calc_similarity}}
}
\examples{
data(climstack) #contains 2 RasterStack objects: prec and tavg

#create params, give equal weights to both variables
params <- createParameters(x=-75.5, y=3.2, vars=c("prec","tmean"),weights=c(0.5,0.5),
                        ndivisions=c(12,12),growing.season=c(1,12),rotation="tmean",threshold=1,
                        env.data.ref=list(prec,tavg), env.data.targ=list(prec,tavg),
                        outfile="~/.",fname='similarity',writefile=FALSE)

}
