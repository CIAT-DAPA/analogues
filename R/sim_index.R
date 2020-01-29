sim_index <-
function (dist, var) 
{
  k = sim_index_table[which(var == sim_index_table$var), 2]
  return(k/(k + dist))
}
