#' Takes in a string and creates a new folder with that name.
#'
#' String path can contain multiple folders that do not exist yet, separated by "/".
#' It returns the new path name, in case it needs to be assigned to a variable.
#' @param folder Path (string) of the new directory to be created.
#' @return The input parameter "folder" that indicates the path of the new folder.
#' @examples
#' create_folder("Sub1/Sub2")
#' @export
create_folder <- function(folder){
  # Get a vector of all parent folders
  folders <- split_one.by.one(folder, "/")

  # Create folders
  invisible(lapply(folders, function(f){
    if(!dir.exists(f))
      dir.create(f)
  }))

  return(folder)
}
