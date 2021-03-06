% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util_calcboundaries.R
\name{util_calc_boundaries}
\alias{util_calc_boundaries}
\title{util_calc_boundaries}
\usage{
util_calc_boundaries(x, cumulative_proportions)
}
\arguments{
\item{x}{[\code{matrix(x,y)}]\cr 2D matrix of data values.}

\item{cumulative_proportions}{[\code{numerical}]\cr Vector of class cumulative proportions, as generated by \code{w2cp}.}
}
\value{
Numerical vector with boundaries for matrix classification
}
\description{
Determine upper class boundaries for classification of a matrix with values ranging 0-1 based upon an
vector of cumulative proportions.
}
\examples{
x <- matrix(runif(100,0,1),10,10)
y <- util_w2cp(c(0.5, 0.25, 0.25)) #cumulative proportion
util_calc_boundaries(x,y)

}
\keyword{internal}
