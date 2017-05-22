#'Show All Images on the Camera
#'
#'List all files found on the camera. The output of the functons is also
#'used for the function \code{\link{download_files}}
#'
#'@param url \code{\link{character}} (with default): the url for the server connection
#'
#'@param verbose \code{\link{logical}} (with default): enables or disables verbose mode
#'
#'@author Sebastian Kreutzer
#'
#'@return Returns a list with the files on the camera
#'
#'@export
list_images<- function(
  url = "http://192.168.0.1/v1",
  verbose = TRUE) {

  ##get files list
  photos <- jsonlite::fromJSON(txt = paste0(url,"/photos"))

  ##combine this list
  file_list <-  as.list(photos$dirs$files)
  names(file_list) <- photos$dirs$name

  ##verbose
  if(verbose){
    for(i in 1:length(file_list)){
      cat(paste0("> ",names(file_list[i]),"/"))
      cat(paste0("\n  |--",file_list[[i]]))

    }

  }

  ##return
  invisible(file_list)

}

