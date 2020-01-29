calc_similarity<-
  function(params)
  {
    val_ref = ref_vals(params)
    wrapper = function() {
      if (class(params$env.data.targ[[1]])[1]=="RasterStack" | class(params$env.data.targ[[1]])[1] == "RasterLayer") {
        training_targ <- params$env.data.targ
      } else {
        stop("data in env.data.targ not a RasterStack or RasterLayer")
      }
      if (params$rotation == "none") {
        training_targ = training_targ
      } else {
        training_targ = rota_stack(val_ref, training_targ, params)
      }
      res=similarity(training_targ, val_ref, params)
      return(res)
    }
    simresult= wrapper()
    if (params$writefile) writeRaster(simresult, paste(params$outfile, "/out_",params$fname,".tif", sep = ""), overwrite = TRUE)
    return(simresult)
  }