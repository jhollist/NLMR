
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.com/marcosci/NLMR.svg?token=jEyKPuKzrFUKtpg4pK2t&branch=master)](https://travis-ci.com/marcosci/NLMR) [![Build status](https://ci.appveyor.com/api/projects/status/ns75pdrbaykxc865?svg=true)](https://ci.appveyor.com/project/marcosci/nlmr) [![codecov](https://codecov.io/gh/marcosci/NLMR/branch/master/graph/badge.svg?token=MKCm2fVrDa)](https://codecov.io/gh/marcosci/NLMR) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/NLMR)](https://cran.r-project.org/package=NLMR) [![Join the chat at https://gitter.im/NLMR\_landscapegenerator](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/NLMR_landscapegenerator) [![](http://cranlogs.r-pkg.org/badges/NLMR)](http://cran.rstudio.com/web/packages/NLMR/index.html)

NLMR <img src="vignettes/logo.png" align="right"  height="175" />
=================================================================

`NLMR` is an `R` package for simulating **n**eutral **l**andscape **m**odels (NLM). Designed to be a generic framework like [NLMpy](https://pypi.python.org/pypi/nlmpy), it leverages the ability to simulate the most common NLM that are described in the ecological literature. `NLMR` builts on the advantages of the `raster`-package and returns all simulation as `RasterLayer`-objects, thus ensuring a direct compability to common GIS tasks and a pretty flexible and simple usage.

Installation
------------

Install the release version from CRAN:

``` r
install.packages("NLMR")
```

To install the developmental version of `NLMR`, use the following R code:

``` r
# install.packages("devtools")
devtools::install_github("marcosci/NLMR", ref = "develop")
```

Example
-------

Here we will provide a simple example on using `NLMR`:

``` r
library(NLMR)
library(magrittr)
library(ggplot2)  # to extent the plot functionality of NLMR 
#> 
#> Attaching package: 'ggplot2'
#> The following object is masked from 'package:raster':
#> 
#>     calc
library(SDMTools) # to calculate basic landscape metrics
#> 
#> Attaching package: 'SDMTools'
#> The following object is masked from 'package:raster':
#> 
#>     distance

# Simulate 50x50 rectangular cluster raster
nlm_raster <- nlm_randomrectangularcluster(50,50, resolution = 1, minL = 3, maxL = 7)

# Plot the NLM
util_plot(nlm_raster, scale = "D") +
  labs(title="Random rectangular cluster NLM \n (50x50 cells)")
#> Coordinate system already present. Adding new coordinate system, which will replace the existing one.
```

<img src="vignettes/README-example-1.png" style="display: block; margin: auto;" />

``` r

# Classify into 3 categories
nlm_raster <- nlm_raster %>%
                 util_classify(., c(0.5, 0.25, 0.25))

# Plot the classified NLM
util_plot(nlm_raster, scale = "D", discrete = TRUE) +
  labs(title="Random rectangular cluster NLM \n (50x50 cells)")
#> Coordinate system already present. Adding new coordinate system, which will replace the existing one.
```

<img src="vignettes/README-example-2.png" style="display: block; margin: auto;" />

``` r

# Calculate basic landscape metrics
raster::as.matrix(nlm_raster) %>% 
  PatchStat() %>% 
  knitr::kable()
```

|  patchID|  n.cell|  n.core.cell|  n.edges.perimeter|  n.edges.internal|  area|  core.area|  perimeter|  perim.area.ratio|  shape.index|  frac.dim.index|  core.area.index|
|--------:|-------:|------------:|------------------:|-----------------:|-----:|----------:|----------:|-----------------:|------------:|---------------:|----------------:|
|        0|    1249|          588|                768|              4228|  1249|        588|        768|         0.6148919|     5.408451|        1.474733|        0.4707766|
|        1|     607|          193|                540|              1888|   607|        193|        540|         0.8896211|     5.400000|        1.530858|        0.3179572|
|        2|     644|          193|                582|              1994|   644|        193|        582|         0.9037267|     5.705882|        1.540015|        0.2996894|

Citation
--------

To cite package `NLMR` in publications please use:

    Sciaini, M; Simpkins, CE; Fritsch, M; Scherer, C (2017). NLMR: Simulating neutral landscape models with R. R package version 0.1.0. https://github.com/marcosci/NLMR.

Additionally, we keep a [record of publications](https://marcosci.github.io/NLMR/articles/publication_record.html/) that use`NLMR`. Hence, if you used `NLMR` please [file an issue on GitHub](https://github.com/marcosci/NLMR/issues/new/) so we can add it to the list.

Dependencies
------------

`NLMR` imports many great packages that it depends on. Many thanks to the developers of these tools:

     [1] "R (>= 3.1.0)"  " checkmate"    " dismo"        " dplyr"       
     [5] " ggplot2"      " gstat"        " igraph"       " lemon"       
     [9] " magrittr"     " maptools"     " purrr"        " RandomFields"
    [13] " raster"       " rasterVis"    " R.utils"      " sp"          
    [17] " spatstat"     " stats"        " tibble"       " viridis"
