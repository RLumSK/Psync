# Psync
**R** package to download images via Wi-Fi from PENTAX (TM) cameras

## Package metrics 
### CRAN statistics
[![CRAN](http://www.r-pkg.org/badges/version/Psync)](http://cran.rstudio.com/package=Psync)

#How to use this package?

## Package installation

To install the package directly from GitHub, run

```r
if(!require("devtools"))
  install.packages("devtools")
devtools::install_github("R-Lum/Psync@master")
```

## Download images

1. Establish a Wi-Fi connection to your camera
2. Open **R**
3. Load the package via `library(Psync)`
4. Download images via `download_images(output_path = "YOUR DOWNLOAD FOLDER NAME"`)

To just list the available images run `list_images()` in you **R** console.

# Tested camera models

* K-70 (Firmware: 1.10)


## Note

**The package comes without any guarantee!**

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
[GNU General Public License](https://github.com/R-Lum/Psync/blob/master/LICENSE) for more details.
