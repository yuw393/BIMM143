rescale3 <- function(x,na.rm=TRUE,plot=FALSE) {
  rng <- range(x, na.rm=na.rm)
  print("Hello")
  
  answer <- (x-rng[1]) / (rng[2] - rng[1])
  
  print(answer)
  
  print("is it me you are looking for?")
  
  if(plot) {
    plot(answer, typ="b",lwd=4)
  }
  print("I can see it in...")
  #return(answer)
}

rescale3(1:10, plot = TRUE)






