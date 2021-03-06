\name{watershed}

\alias{watershed}

\concept{watershed transformation}
\concept{watershed segmentation}

\title{Watershed transformation and watershed based object detection}

\description{
  Watershed transformation and watershed based object detection.
}

\usage{
watershed(x, tolerance=1, ext=1, bg=0)
}

\arguments{

  \item{x}{An \code{Image} object or an array.}

  \item{tolerance}{ The minimum height of the object in the units of image
    intensity between its highest point (seed) and the point where it
    contacts another object (checked for every contact pixel). If the
    height is smaller than the tolerance, the object will be combined with
    one of its neighbors, which is the highest. Tolerance should be chosen
    according to the range of \code{x}. Default value is 1, which 
    is a reasonable value if \code{x} comes from \code{distmap}.}

  \item{ext}{Radius of the neighborhood in pixels for the detection
    of neighboring objects. Higher value smoothes out small objects. }

  \item{bg}{Background value under which pixels are not considered
    anymore for watersheding.}
}

\value{
  An \code{Grayscale} \code{Image} object or an array, containing the
  labelled version of \code{x}.
}

\details{
  The algorithm identifies and separates objects that stand out of the
  background (zero). It inverts the image and uses water to fill
  the resulting valleys (pixels with high intensity in the source image)
  until another object or background is met.
  The deepest valleys become indexed first, starting from 1.

  The function \code{bwlabel} is a simpler, faster alternative to 
  segment connected objects from binary images.
}

\seealso{ 
  \code{\link{bwlabel}},  \code{\link{propagate}} 
}

\examples{
  x = readImage(system.file('images', 'shapes.png', package='EBImage'))
  x = x[110:512,1:130]
  display(x, title='Binary')
  y = distmap(x)
  display(normalize(y), title='Distance map')
  w = watershed(y)
  display(normalize(w), title='Watershed')
}

\author{
  Oleg Sklyar, \email{osklyar@ebi.ac.uk}, 2007
}

\keyword{manip}
