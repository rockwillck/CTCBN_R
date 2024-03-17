.onAttach <- function(libname, pkgname) {
  packageLocation = .libPaths()[1]
  wd = paste(packageLocation, "/", packageName(), "/extdata/source", sep = "")
  file_path <- paste(wd, "/ct-cbn", sep="")

  # Check if executable exists
  if (file.exists(file_path)) {
    packageStartupMessage("The ", pkgname, " package has been successfully loaded.")
  } else {
    packageStartupMessage("Please run ", pkgname, "::init() to initialize the packge.")
  }
}
