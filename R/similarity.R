similarity <-
  function (training_targ, val_ref, params) 
  {
    var_sim=matrix(nrow=ncell(training_targ[[1]]),ncol=length(params$vars))
    for (i in 1:length(params$vars)) {
      result=1:ncell(training_targ[[i]])
      if (length(val_ref[[i]]) == 1) {
        result[]=(training_targ[[i]][]-val_ref[[i]])^2
        result[]=sim_index(sqrt(result), params$vars[i])
        var_sim[,i]=result*params$weights[i]
      } else {
        res_month = matrix(nrow=ncell(training_targ[[i]]),ncol=12)
        res_month[,params$growing.season]=(t(t(training_targ[[i]][[params$growing.season]][])-val_ref[[i]][params$growing.season]))^2
        result[]=sim_index(sqrt(rowMeans(res_month,na.rm=T)), params$vars[i])
        var_sim[,i]=result*params$weights[i]
       }
    }
    combined=training_targ[[i]][[1]]
    if(length(params$vars)>1){
      combined[]=round(rowSums(var_sim),digits=3)
    }else{
      combined[]=round(var_sim[],digits=3)
    }
    return(combined)
  }
