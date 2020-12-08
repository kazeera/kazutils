# Presenting the kazutils R package!

<!-- badges: start -->
<!-- badges: end -->

This package contains a bunch of functions for data analysis tasks. It includes functions
    to write objects to an excel file using openxlsx, as well as creating a new directory 
    based on a path.

## Installation
You can install the latest version from Github:
``` r
devtools::install_github("kazeera/kazutils", upgrade_dependencies = FALSE)
```

## How to Use 
Load package.
``` r
library(kazutils)
```

1. Load multiple packages into the environment.
This function will install CRAN packages if they are not already installed.
``` r
load_packages(c("dplyr", "openxlsx"))
```

2. Create a folder.
``` r
out_dir <- create_folder("Folder/Subfolder")  
```
The above line creates a directory called "Folder" if it doesn't already exist, and then a "Subfolder" directory within it if it doesn't already exist. Then it assigns "Folder/Subfolder" to the variable out_dir.

3. An Excel file or workbook may contain multiple named worksheets.
Worksheets are spreadsheets or tabs and contain data.
Here are some functions to write data into worksheets. 
``` r
# Create a workbook
wb <- openxlsx::createWorkbook()

# Write a data frame to a worksheet
my_df <- DNase
write_df_to_Excel("Sheet1", my_df, wb)

# Write a list to a worksheet
my_list <- list(a=1:3, b=5:12)
write_list_to_Excel("Sheet2", my_list, wb)

# Save Excel file with .xlsx extension
filename <- sprintf("%s/file1.xlsx", out_dir) # gives "Folder/Subfolder/file1.xlsx"
openxlsx::saveWorkbook(wb, filename, overwrite = T)
```

4. Here is a function to get part of an element in a character vector, delimited by a certain character.
``` r
fruits <- paste(rep(c("Green", "Yellow"), 5), rep(c("Apple", "Pear"), each=5), 1:10, sep="_")
print(fruits)
```
To get the 2nd part of each element, the fruit, do this:
``` r
get_nth_part(fruits, "_", 2)
```
To get the 1st part of each element, the color, do this:
``` r
get_nth_part(fruits, "_", 1)
```
