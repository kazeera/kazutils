#' Install/load packages from library into environment.
#'
#' Checks whether R packages are installed from CRAN and loads
#' all. Does not yet support installation of BioConductor packages.
#'
#' @param pkgs A character vector of package names.
#' @examples
#' load_packages(c("openxlsx", "dplyr"))
#' @export
load_packages <- function(pkgs) {
  # Install packages that are not found
  new.pkgs <- pkgs[!(pkgs %in% installed.packages()[, "Package"])]
  if (length(new.pkgs))
    install.packages(new.pkgs)
  # Load all packages
  lapply(pkgs, require, character.only = TRUE)
}
