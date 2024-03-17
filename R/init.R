#' Initializes package
#'
#' `init` initalizes all of the executables needed for the package to run.
#'
#' This function should be called only once, right after the package is installed.
#' Requires gsl and gcc to be installed. Both can be installed on Mac using brew install and on alternate operating systems through corresponding functions.
#' @export
init <- function() {
  currentWd = getwd()
  packageLocation = .libPaths()[1]
  wd = paste(packageLocation, "/", packageName(), "/extdata/source", sep = "")

  file_path <- paste(wd, "/ct-cbn", sep="")
  # Check if executable exists
  if (file.exists(file_path)) {
    message("You've already initiated.")
  } else {
    setwd(wd)
    system("./configure")
    system("make -j2")
    system("./ct-cbn -h")
    setwd(currentWd)
  }
}
