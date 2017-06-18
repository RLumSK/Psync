#' Download Images from PENTAX (TM) cameras
#'
#' Download previously selected images. If the default is chosen all found images
#' are downloaded.
#'
#' \bold{How to establish the Wi-Fi connection?}
#'
#' 1. Switch on the Wi-Fi of your camera \cr
#' 2. Connect your computer with the Wi-Fi of the camera (you find the Wi-Fi password
#' in your camera settings: Settings >> 3 >> Wi-Fi >> Communication Info)\cr
#'
#'
#'@param files \code{\link{list}} (with default): list with files to import
#'
#'@param output_path \code{\link{character}} \bold{(required)}: character string
#'with a valid output path, where the downloaded files will be stored
#'
#'@param url \code{\link{character}} (with default): the url for server connection
#'
#'@param verbose \code{\link{logical}} (with default): enables or disables verbose mode
#'
#'@note This function has been tested with a Pentax K-70 (Firmware: v1.10) only! It should
#'theoretically work with other models providing this functionalit; however, it has been
#'not tested.
#'
#'@author Sebastian Kreutzer
#'
#'@examples
#'
#'\dontrun{
#'download_images(output_path = "~/Desktop/Download")
#'
#'}
#'
#'@return This function returns nothing.
#'
#' @export
download_images <- function(
  files = list_images(verbose = FALSE),
  output_path,
  url = "http://192.168.0.1/v1",
  verbose = TRUE

  ) {

  #check output path
  if(!dir.exists(output_path)){
    message("The specified download folder does not exist, do you want to create it?")
    selection <- readline("Y/N: ")

      ##create folder if needed
      if(any(c("Yes", "yes", "y", "Y")%in%selection)){
        dir.create(output_path)

      }else{
        stop("[download_imagess()] Sorry, I do not know where to put the files!", call. = FALSE)

      }

  }

  # grep camera
  camera <- try(jsonlite::fromJSON(txt = paste0(url, "/constants/device")), silent = TRUE)

    ##stop if connection could not be established
    if(is(camera, 'try-error')){
      stop("[download_imagess()] WiFi connection could not be established!", call. = FALSE)

    }

  #output
  if(verbose){
    cat(paste0("\n[download_imagess()]\n"))
    cat(paste0("\n Model:\t\t", camera$model))
    cat(paste0("\n Firmware:\t", camera$firmwareVersion))
    cat(paste0("\n SN:\t\t", camera$serialNo))
    cat(paste0("\n\n",length(unlist(files)), " files marked to download >>\n"))

  }


  #import data and create folder for every day
  for(i in 1:length(files)){

    ##create directory
    dir.create(path = paste0(output_path,"/",names(files[i])), showWarnings = FALSE)

    #download
    for(j in 1:length(files[[i]])){

      if(verbose) cat(paste0("\n\t", names(files[i]),"/",files[[i]][[j]], " ... "))

      curl::curl_download(
        url = paste0(url, "/photos/",names(files[i]),"/",files[[i]][[j]]),
        destfile = paste0(output_path,"/",names(files[i]),"/",files[[i]][[j]]),
        quiet = TRUE
      )

      if(verbose) cat("OK")

    }

  }

}
