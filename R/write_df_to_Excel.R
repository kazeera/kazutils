#' Writes a data frame to a worksheet in an Excel workbook.
#' @param sheet_name A string indicating the name of the worksheet.
#' @param my_df A data frame.
#' @param wb An openxlsx workbook object containing all current worksheets.
#' @param incl_rownames Logical indicating whether rownames of the input data frame should be printed, default F.
#' @return The workbook with the new sheet added. Does not have to be reassigned to wb in main.
#' @examples
#' wb <- openxlsx::createWorkbook() # Create a workbook
#' my_df <- DNase
#' write_df_to_Excel("Sheet1", my_df, wb)
#' openxlsx::saveWorkbook(wb, file="filename.xlsx") # Save wb to file
#' @export
write_df_to_Excel <- function(sheet_name, my_df, wb, incl_rownames = F){
  # Add a worksheet to the workbook with the name specified in the argument
  addWorksheet(wb, sheet_name)
  # Write data frame to worksheet
  writeData(wb, sheet_name, x = my_df, rowNames = incl_rownames)
  return(wb)
}
