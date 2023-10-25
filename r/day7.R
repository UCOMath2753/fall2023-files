## runif(how many, from, to)
(x <- runif(n = 1, min = 0, max = 1))
(y <- runif(n = 1, min = 0, max = 1))
(r <- runif(n = 1, min = 0, max = 1))

pts <- c(x, y, "black")

for(i in 1:10000){
  (r <- runif(n = 1, min = 0, max = 1))
if (r < 1/3){
  #print("r is small")
  x <- 0.5*x
  y <- 0.5*y
  color <- "red"
}else if (1/3 <= r & r < 2/3){
  x <- 0.5*(x + 0.5)
  y <- 0.5*(y + 1)
  color <- "blue"
  #print("r is medium")
}else{
  x <- 0.5*(x + 1)
  y <- 0.5*y
  color <- "orange"
  #print("r is big")
}

(pts <- rbind(pts, c(x, y, color)))
}

pts <- as.data.frame(pts)
names(pts) <- c("x", "y", "color")
head(pts)
par(bg="black")
plot(pts[100:nrow(pts), c("x", "y")], pch = '.', col = pts[100:nrow(pts), "color"])
