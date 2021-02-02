#' Writes a list to a worksheet in an Excel workbook.
#' @param sheet_name A string indicating the name of the worksheet.
#' @param my_list A named list with vectors (can have varying sizes).
#' @param wb An openxlsx workbook object containing all current worksheets.
#' @return The workbook with the new sheet added. Does not have to be reassigned to wb in main.
#' @examples
#' wb <- openxlsx::createWorkbook() # Create a workbook
#' my_list <- list(a=1:3, b=5:12)
#' write_list_to_Excel("Sheet2", my_list, wb)
#' openxlsx::saveWorkbook(wb, file="filename.xlsx") # Save wb to file
#' @export
write_list_to_Excel <- function(sheet_name, my_list, wb){
  # Add a worksheet to the workbook with the name specified in the argument
  addWorksheet(wb, sheet_name)
  # Initialize column number counter
  col_num <- 1
  # In a loop, make a column for each list element
  for(i in 1:length(my_list)){
    # Name column based on element name
    writeData(wb, sheet = sheet_name, x = names(my_list[i]), startCol = col_num, startRow = 1)
    # Write data to worksheet
    writeData(wb, sheet = sheet_name, x = my_list[[i]], startCol = col_num, startRow = 2)
    # Update counter
    col_num <- col_num + 1
  }
  return(wb)
}
