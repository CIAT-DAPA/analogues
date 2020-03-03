sim_index <-
function (dist, var) 
{
  k = sim_index_table[which(var == sim_index_table$var), 2]
  if (length(k) == 0) {k <- 10} #default
  return(k/(k + dist))
}
