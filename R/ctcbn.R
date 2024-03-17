#' Calls ct-cbn
#'
#' `ct_cbn` performs the operations on the files.
#'
#' This is text that will be replaced, or forgotten
#' @export
ct_cbn <- function(filestem, N=0, e=0.0, B=NULL, M=0, R=1, S=1.0) {
  currentWd = getwd()
  packageLocation = .libPaths()[1]
  setwd(paste(packageLocation, "/", packageName(), "/extdata/source", sep = ""))
  a <- system(sprintf("mkdir %s & ./ct-cbn -f %s -N %d -e %f%s -M %d -R %d -S %f", filestem, filestem, N, e, if(is.null(B)) "" else sprintf(" -B %d", B), M, R, S), intern = TRUE)
  setwd(currentWd)

  # Create a dataframe
  df <- data.frame(t(
    as.numeric(
      unlist(strsplit(a[3], "\t"))
    )
  ))
  colnames(df) <- unlist(strsplit(a[2], "\t"))
  return(df)
}
