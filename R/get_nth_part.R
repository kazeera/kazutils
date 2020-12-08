#' Extracts the first (or nth) entry from each split.
#' @param x A character vector.
#' @param delimiter A character to split by.
#' @param entry_no A number indicating which part of split to return.
#' @return A character vector containing parts
#' @examples x = "2wk.1"   "2wk.2"   "2wk.3"   "2wk.4"   "2wk.5"   "2wk.6"   "2wk.7"   "2wk.8"   "2wk.9"   "2wk.10"
#'          delimiter = "\\."
#'          entry_no = 1L
#'          The return value is "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"  "2wk"
#' @export
get_nth_part <- function(x, delimiter, entry_no){
  sapply(strsplit(x,delimiter), `[`, entry_no)
}
