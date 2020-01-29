rota_serie <-
function (rotation, sit) 
{
  if (rotation == 0 | abs(rotation) == 12) {
    sit_rot = sit[1:12]
  } else{
    if (rotation >= 1) {
      sit_rot = sit[c((1 + rotation):12, 1:rotation)]
    }else{
      sit_rot = sit[c((13 + rotation):12, 1:(12 + rotation))]
    }
  }
  return(sit_rot)
}