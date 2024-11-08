% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paRao.R
\name{Rao}
\alias{Rao}
\title{Rao's index}
\usage{
Rao(x, ...)
}
\arguments{
\item{x}{Input data may be a matrix, a Spatial Grid Data Frame, a SpatRaster, or a list of these objects.}

\item{...}{Other parameters passed to `paRao`.}
}
\value{
A return value description.
}
\description{
An alias for `paRao` with `alpha` fixed at 2.
}
\examples{
\dontrun{
data(volcano)
r <- terra::rast(volcano)
res <- Rao(x = r, window = 3)
terra::plot(res[[1]][[1]])
}
}
