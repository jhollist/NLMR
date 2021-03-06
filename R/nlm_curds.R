#' nlm_curds
#'
#' @description Simulates a curdled neutral landscape model.
#'
#' @details Random curdling recursively subdivides the plane into blocks.
#' At each level of the recursion, a fraction of the this block is declared as
#' habitat (value == TRUE) while the remaining stays matrix (value == FALSE).
#'
#' @param p [\code{numerical(x)}]\cr
#' Vector with percentage(s) to fill with curds (fill with Habitat (value ==
#' TRUE)).
#' @param s [\code{numerical(x)}]\cr
#' Vector of successive cutting steps for the blocks (split 1 block into x
#' blocks).
#' @param ext [\code{numerical(1)}]\cr
#' Extent of the resulting raster (0,x,0,x).
#'
#' @return raster
#'
#' @examples
#'
#' # simulate random curdling
#' (random_curdling <- nlm_curds(c(0.5, 0.3, 0.6), c(32, 6, 2)))
#' \dontrun{
#' # Visualize the NLM
#' util_plot(random_curdling, discrete = TRUE)
#' }
#'
#' @seealso \code{\link{nlm_wheys}}
#'
#' @references
#' Keitt TH. 2000. Spectral representation of neutral landscapes.
#' \emph{Landscape Ecology} 15:479-493.
#'
#' @aliases nlm_curds
#' @rdname nlm_curds
#'
#' @importFrom magrittr "%>%"
#'
#' @export
#'

nlm_curds <- function(p,
                      s,
                      ext = 1) {

  # check for same lenght of p and s
  # maybe recycle percentages
  # convenient if only one is given!?

  # supposed to be faster if initialized with false and inverted in the end
  curd_raster <- raster::raster(matrix(FALSE, 1, 1))

  # convert amount of curds to amount of matrix to follow algorithm logic
  p <- 1 - p

  for (i in seq_along(s)) {

    # "tile" the raster into smaller subdivisions
    curd_raster <- raster::disaggregate(curd_raster, s[i])

    # get tibble with values and ids
    vl <- raster::values(curd_raster) %>%
      tibble::as_tibble() %>%
      dplyr::mutate(id = seq_len(raster::ncell(curd_raster)))

    # select ids randomly which are set to true and do so
    ids <- vl %>%
      dplyr::filter(!value) %>%
      dplyr::sample_frac(p[i]) %>%
      .$id
    vl$value[ids] <- TRUE

    # overwrite rastervalues
    raster::values(curd_raster) <- vl$value
  }

  # invert raster
  raster::values(curd_raster) <- !raster::values(curd_raster)

  # set resolution ----
  raster::extent(curd_raster) <- c(
    0,
    ext,
    0,
    ext
  )

  return(curd_raster)
}
