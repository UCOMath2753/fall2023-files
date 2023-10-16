## fun with for loops
f <- function(x) exp(-x) - x
fp <- function(x) -exp(-x) - 1

plot(f)
abline(h=0)

x0 <- 0.2
(x1 <- x0 - f(x0)/fp(x0))
## abline uses y = a + bx
## y = f(x0) + fp(x0)*(x-x0)
## y = (f(x0) - fp(x0)*x0) + fp(x0)*x
abline(a = (f(x0) - fp(x0)*x0), b = fp(x0), col = "red")
points(x0, f(x0), col = "red", pch = 19)
points(x1, 0, col = "red", pch = 19)
points(x1, f(x1), col = "blue", pch = 19)
(x2 <- x1 - f(x1)/fp(x1))
abline(a = (f(x1) - fp(x1)*x1), b = fp(x1), col = "blue")

## automate

(x0 <- 0.2)
for(i in 1:10){
  x1 <- x0 - f(x0)/fp(x0)
  print(x1)
  x0 <- x1
}

## do this for g(x) and gp(x)
## see if it works
## it might help to graph g(x) and verify roots visually
## recall: this is a rootfinding technique for solving g(x) = 0
g <- function(x) 4*x^2 - 5*x - 1
plot(g, xlim = c(-1, 2))
abline(h = 0, lty = 3)

gp <- function(x) 8*x - 5
(x0 <- 5.1/8)
for(i in 1:20){
  x1 <- x0 - g(x0)/gp(x0)
  print(x1)
  x0 <- x1
}



f <- function(x) x^2 - 5
fp <- function(x) 2*x
(x0 <- 5)
for(i in 1:20){
  x1 <- x0 - f(x0)/fp(x0)
  ## x1 <- 1/2*(x0 + 5/x0)
  print(x1)
  x0 <- x1
}
sqrt(5)

## recurrence relations
## discrete-time dynamical systems - Drs. Laverty/Bannish
## difference equations - Drs. Hopkins/Milligan
## repeated function evaluation (i.e., composing a function with itself)

## vary the number between 0 and 4 and watch the graph
logistic <- function(x) 3.9*x*(1-x)
xs <- x0 <- 0.5
for(i in 1:100){
  x1 <- logistic(x0)
  xs <- c(xs, x1)
  #print(x1)
  x0 <- x1
}
plot(xs, type='b', ylim = c(0, 1))
