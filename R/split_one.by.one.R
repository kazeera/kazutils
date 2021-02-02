#' Split string and iteratively return parts pasted to first part
#'
#' @param x A character vector.
#' @param delimiter A character to split by.
#' @param un_list A logical value whether to unlist
#' @examples
#' split_one.by.one("Heatmaps/BY.CORE/TMA.stromal.subtype_all excl HRD excl neo dots Moffitt/Surv", "/")
#' returns:
# [1] "Heatmaps"
# [2] "Heatmaps/BY.CORE"
# [3] "Heatmaps/BY.CORE/TMA.stromal.subtype_all excl HRD excl neo dots Moffitt"
# [4] "Heatmaps/BY.CORE/TMA.stromal.subtype_all excl HRD excl neo dots Moffitt/Surv"
#' @return
#' @export
split_one.by.one <- function(x, delimiter, un_list = T) {
  # Split vector by delimiter
  x <- unlist(strsplit(x, split = delimiter))
  # Recursively add
  l <- lapply(1:length(x), function(i) {
    paste(x[1:i], collapse = delimiter)
  })
  # Return list/vector
  if (un_list) {
    unlist(l)
  } else {
    l
  }
}
