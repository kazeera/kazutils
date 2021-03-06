#' Read in Excel file table to list 
#' 
#' Each column becomes a vector and a list element, column name becomes list element name.
#' @param file Name of Excel file (.xlsx), string.
#' @param sheet Sheet (name or index) to read in as list.
#' @param ... Additional parameters passed to openxlsx::read.xlsx
read_xl_to_list <- function(file, sheet, ...){
  df <- openxlsx::read.xlsx(xlsxFile = file, sheet = sheet, ...)
  lapply(df, function(x) x[!is.na(x)])
}
