calc_rot <-
function (ref, sit)
{
  if (class(ref) == "numeric" | class(ref) == "integer") {
    ref = rbind(ref)
    sit = rbind(sit)
  }
  n = dim(ref)[2]
  fourier1 = fft(ref)
  fourier2 = fft(sit)
  phase1 = Arg(fourier1)
  phase2 = Arg(fourier2)
  rotation = round(((phase1[2] - phase2[2]) * (n/2))/pi, 0)
  return(rotation)
}