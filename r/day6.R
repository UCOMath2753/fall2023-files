## Riemann sums for integration
## (i.e., rectangle rules)

f <- function(x) x^2 + 1
a <- 1
b <- 3
n <- 4
(deltax <- (b - a)/n)
(auc <- 0)

plot(f, xlim = c(0, 4), ylim = c(0, 20))

(auc <- auc + f(a)*deltax)
polygon(c(a, a + deltax, a + deltax, a), c(0, 0, f(a), f(a)))

(auc <- auc + f(a + deltax)*deltax)
polygon(c(a + deltax, a + 2*deltax, a + 2*deltax, a + deltax), + # one line
        c(0, 0, f(a + deltax), f(a + deltax)))

(auc <- auc + f(a + 2*deltax)*deltax)
polygon(c(a + 2*deltax, a + 3*deltax, a + 3*deltax, a + 2*deltax), + # one line
        c(0, 0, f(a + 2*deltax), f(a + 2*deltax)))

(auc <- auc + f(a + 3*deltax)*deltax)
polygon(c(a + 3*deltax, a + 4*deltax, a + 4*deltax, a + 3*deltax), + # one line
        c(0, 0, f(a + 3*deltax), f(a + 3*deltax)))

integrate(f, lower = a, upper = b)
## automate
plot(f, xlim = c(0, 4), ylim = c(0, 20))
auc <- 0
n <- 4
deltax <- (b - a)/n
for(i in 1:n){
  lo <- a + (i-1)*deltax
  hi <- a + i*deltax
  auc <- auc + f(lo)*deltax
  ## print(auc)
  if(i %% 2 == 0){## selective feedback
    cat("After ", i, " rectangles, the area is ", +
        auc,".\n", sep = "")
  }
  polygon(c(lo, hi, hi, lo), c(0, 0, f(lo), f(lo)), density = 15, angle = ((-1)^i)*45, col = "red")
}

rectangles <- function(a, b, n, f){
  plot(f, xlim = c(a - 1, b + 1), ylim = c(0, 20))
  ## might want to recalculate y-limits
  auc <- 0
  deltax <- (b - a)/n
  for(i in 1:n){
    lo <- a + (i-1)*deltax
    hi <- a + i*deltax
    auc <- auc + f(lo)*deltax
    polygon(c(lo, hi, hi, lo), c(0, 0, f(lo), f(lo)), density = 15, angle = ((-1)^i)*45, col = "red")
  }
  mtext(paste("area is ", auc, sep=""), 3)
  return(auc)
}

rectangles(a = 1, b = 3, n = 20, function(x)x^2 + 1)
