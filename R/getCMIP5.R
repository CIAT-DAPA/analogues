getCMIP5 <- function(var, rcp, model, year, res, lon=NA, lat=NA, path='') {
  if (!res %in% c(0.5, 2.5, 5, 10)) {
    stop('resolution should be one of: 2.5, 5, 10')
  }
  
  if (res==2.5) { 
    res <- '2_5min' 
  } else if (res == 0.5) {
    res <- "30s"
  } else {
    res <- paste(res, 'min', sep='')
  }
  
  #find tile (only for 30s data)
  if (res == "30s") {
    lon <- min(180, max(-180, lon))
    lat <- min(90, max(-60, lat))
    rs <- raster(nrows=3, ncols=5, xmn=-180, xmx=180, ymn=-60, ymx=90 )
    row <- c("a","b","c")[rowFromY(rs, lat)]
    col <- colFromX(rs, lon)
    ttile <- paste(row,col,sep="")
  }
  
  ####
  #need to do the tile thing, only for 30s data
  ####
  
  var <- tolower(var[1])
  vars <- c('tmin', 'tmax', 'prec', 'bio')
  stopifnot(var %in% vars)
  
  rcps <- c(2.6, 4.5, 6.0, 8.5)
  stopifnot(rcp %in% rcps)
  rcp <- paste("rcp",gsub("\\.","\\_",rcp),sep="")
  stopifnot(year %in% c(2030, 2050, 2070, 2080))
  year <- paste(year,"s",sep="")
  
  stopifnot(model %in% c(1:35))
  
  #check if combination of rcp and model is available
  i <- cmip5_table[model,rcp]
  if (!i) {
    warning('this combination of rcp and model is not available')
    return(invisible(NULL))
  }
  
  path <- paste(path, '/cmip5/', res, '/', sep='')
  dir.create(path, recursive=TRUE, showWarnings=FALSE)
  if (res == "30s") {
    baseurl <- "http://datacgiar.s3.amazonaws.com/ccafs/ccafs-climate/data/ipcc_5ar_ciat_tiled/"
    zip <- tolower(paste(cmip5_table$model[model], "_", rcp, "_", year, "_", var,"_",res, "_r1i1p1_",ttile,"_asc.zip", sep=''))
  } else {
    baseurl <- "http://datacgiar.s3.amazonaws.com/ccafs/ccafs-climate/data/ipcc_5ar_ciat_downscaled/"
    zip <- tolower(paste(cmip5_table$model[model], "_", rcp, "_", year, "_", var,"_",res, "_r1i1p1_no_tile_asc.zip", sep=''))
  }
  zipfile <- paste(path, zip, sep='')
  
  #url
  theurl <- paste(baseurl,rcp,"/",year,"/",cmip5_table$model[model],"/",res,"/",zip,sep="")
  
  if (!file.exists(zipfile)) {
    .download(theurl, zipfile)
    if (!file.exists(zipfile))	{ 
      message("\n Could not download file -- perhaps it does not exist") 
    }
  }	
  utils::unzip(zipfile, exdir=dirname(zipfile))
  if (var == "bio") {nv <- 19} else {nv <- 12}
  outstk <- raster::stack(paste(path, var, "_", 1:nv, ".asc", sep=""))
  return(outstk)
}
#x <- getCMIP5(var="prec", rcp=4.5, model=10, year=2030, res=0.5, lon=-75, lat=3, path='')

.download <- function(aurl, filename) {
  fn <- paste(tempfile(), '.download', sep='')
  res <- utils::download.file(url=aurl, destfile=fn, method="auto", quiet = FALSE, mode = "wb", cacheOK = TRUE)
  if (res == 0) {
    w <- getOption('warn')
    on.exit(options('warn' = w))
    options('warn'=-1) 
    if (! file.rename(fn, filename) ) { 
      # rename failed, perhaps because fn and filename refer to different devices
      file.copy(fn, filename)
      file.remove(fn)
    }
  } else {
    stop('could not download the file' )
  }
}

