rota_stack <-
function (val_ref, training_targ, params) 
{
  rotations = rot_clim(val_ref, training_targ, params)
  if (sum(params$vars == "tmean") == 1) {
    pos = which(params$vars == "tmean")
    mat_data = values(training_targ[[pos]])
    rota_data = values(rotations)
    valids = which(!is.na(rota_data))
    for (i in valids) {
      mat_data[i, ] = rota_serie(rota_data[i], mat_data[i, ])
    }
    values(training_targ[[pos]]) = mat_data
  }
  if (sum(params$vars == "tmin") == 1) {
    pos = which(params$vars == "tmin")
    mat_data = values(training_targ[[pos]])
    rota_data = values(rotations)
    valids = which(!is.na(rota_data))
    for (i in valids) {
      mat_data[i, ] = rota_serie(rota_data[i], mat_data[i, 
                                                        ])
    }
    values(training_targ[[pos]]) = mat_data
  }
  if (sum(params$vars == "tmax") == 1) {
    pos = which(params$vars == "tmean")
    mat_data = values(training_targ[[pos]])
    rota_data = values(rotations)
    valids = which(!is.na(rota_data))
    for (i in valids) {
      mat_data[i, ] = rota_serie(rota_data[i], mat_data[i, 
                                                        ])
    }
    values(training_targ[[pos]]) = mat_data
  }
  if (sum(params$vars == "prec") == 1) {
    pos = which(params$vars == "prec")
    mat_data = values(training_targ[[pos]])
    rota_data = values(rotations)
    valids = which(!is.na(rota_data))
    for (i in valids) {
      mat_data[i, ] = rota_serie(rota_data[i], mat_data[i, 
                                                        ])
    }
    values(training_targ[[pos]]) = mat_data
  }
  return(training_targ)
}
