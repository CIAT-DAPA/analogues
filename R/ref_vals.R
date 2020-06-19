ref_vals <-
function (params) 
{
  if (class(params$env.data.ref[[1]])[1]=="RasterStack" | class(params$env.data.ref[[1]])[1] == "RasterLayer") {
    training_ref <- params$env.data.ref
  } else {
    stop("data in env.data.ref not a RasterStack or RasterLayer")
  }
  val_ref = list()
  for (i in 1:length(params$vars)) {
    val_ref[[i]] <- extract(training_ref[[i]], 
                            cbind(params$x, params$y))
  }
  return(val_ref)
}
