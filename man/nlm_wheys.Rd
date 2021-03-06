% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nlm_wheys.R
\name{nlm_wheys}
\alias{nlm_wheys}
\title{nlm_wheys}
\usage{
nlm_wheys(p, s, q, ext = 1)
}
\arguments{
\item{p}{[\code{numerical(x)}]\cr
Vector with percentage(s) to fill with curds (fill with Habitat (value ==
TRUE)).}

\item{s}{[\code{numerical(x)}]\cr
Vector of successive cutting steps for the blocks (split 1 block into x
blocks).}

\item{q}{[\code{numerical(x)}]\cr
Vector of with percentage(s) to fill with wheys (fill with Habitat (value ==
TRUE)).}

\item{ext}{[\code{numerical(1)}]\cr
Extent of the resulting raster (0,x,0,x).}
}
\value{
raster
}
\description{
Simulates a wheyed neutral landscape model.
}
\details{
Wheyed landscape models builts on landscapes derived from random
curdling (\code{nlm_curds()}), by adding "wheye" on the "curds". Wheye is
hereby an additional step after the first recursion, where previously
selected cells that were declared matrix (value == FALSE) are now considered
to contain a proportion (\code{q}) of habitat.

If \deqn{p_{1} = p_{2} = q_{2} = ... = p_{n} = p_{n}} the models resembles
a binary random map.
}
\examples{
# simulate wheyed curdling
wheyed_curdling <- nlm_wheys(c(0.1, 0.3, 0.6), c(32, 6, 2), c(0.1, 0.05, 0.2))

\dontrun{
# visualize the NLM
util_plot(wheyed_curdling, discrete = TRUE)
}
}
\references{
Szaro, Robert C., and David W. Johnston, eds. Biodiversity in managed
landscapes: theory and practice. \emph{Oxford University Press}, USA, 1996.
}
\seealso{
\code{\link{nlm_curds}}
}
