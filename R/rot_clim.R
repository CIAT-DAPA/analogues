rot_clim <-
function (val_ref, training_targ, params) 
{
  if (params$rotation == "prec" | params$rotation == "tmean") {
    pos = which(params$vars == params$rotation)
    ref = val_ref[[pos]]
    sit_stack = training_targ[[pos]]
    sit_mat = sit_stack[]
    sit_rot = sit_stack[[1]][]
    valids = which(!is.na(sit_mat[, 1]))
    for (i in valids) {
      if (sum(is.na(sit_mat[i, ])) == 0) {
        sit_rot[i] = calc_rot(ref, sit_mat[i, ])
      }
      else {
        sit_rot[i] = 0
      }
    }
    sit_rot_rast = sit_stack[[1]]
    values(sit_rot_rast) = sit_rot
  }  else {
    pos = c(which(params$vars == "tmean"), which(params$vars == 
                                                   "prec"))
    ref = rbind(val_ref[[pos[1]]], val_ref[[pos[2]]])
    sit_stack = stack(training_targ[[pos[1]]], training_targ[[pos[2]]])
    sit_mat = sit_stack[]
    sit_rot = sit_stack[[1]][]
    valids = which(!is.na(sit_mat[, 1]))
    ndiv = params$ndivisions[pos[1]]
    ndiv2 = 2 * ndiv
    for (i in valids) {
      sit_rot[i] = calc_rot(ref, rbind(sit_mat[i, 1:ndiv], 
                                       sit_mat[i, (ndiv + 1):ndiv2]))
    }
    sit_rot_rast = sit_stack[[1]]
    values(sit_rot_rast) = sit_rot
  }
  return(sit_rot_rast)
}
