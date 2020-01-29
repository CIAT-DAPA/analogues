createParameters <-
function (x, y, vars, weights, ndivisions, env.data.ref, env.data.targ,
          growing.season, rotation, threshold, outfile, fname, writefile) 
{params <- list(x = x, y = y, growing.season = growing.season, rotation = rotation, 
                env.data.ref = env.data.ref, env.data.targ=env.data.targ,
                vars = vars, weights = weights, ndivisions = ndivisions, 
                outfile = outfile, threshold = threshold, fname = fname, writefile = writefile)
 if (length(params$growing.season) == 1) {
   params$growing.season = params$growing.season
 }
 else {
   if (length(params$growing.season) == 2 & params$growing.season[1] == 
         params$growing.season[2]) {
     params$growing.season = params$growing.season[1]
   }
   else {
     if (length(params$growing.season) == 2 & params$growing.season[1] > 
           params$growing.season[2]) {
       params$growing.season = c(params$growing.season[1]:12, 
                                 1:params$growing.season[2])
     }
     else {
       if (length(params$growing.season) == 2 & params$growing.season[1] < 
             params$growing.season[2]) {
         params$growing.season = c(params$growing.season[1]:params$growing.season[2])
       }
       else {
         if (length(params$growing.season) == 4 & params$growing.season[1] > 
               params$growing.season[2]) {
           params$growing.season = c(params$growing.season[1]:12, 
                                     1:params$growing.season[2], params$growing.season[3]:params$growing.season[4])
         }
         else {
           if (length(params$growing.season) == 4 & 
                 params$growing.season[3] > params$growing.season[4]) {
             params$growing.season = c(params$growing.season[1]:params$growing.season[2], 
                                       params$growing.season[3]:12, 1:params$growing.season[4])
           }
           else {
             params$growing.season = c(params$growing.season[1]:params$growing.season[2], 
                                       params$growing.season[3]:params$growing.season[4])
           }
         }
       }
     }
   }
 }
 params$growing.season=unique(params$growing.season)
 return(params)
}
