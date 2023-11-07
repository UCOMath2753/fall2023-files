## Day 4
## ?c

x <- c(1, 3, 5, 7)
x

## assigns and prints
(x <- c(1, 3, 5, 7))

## (y <- c(1, a, pi, -4))
(y <- c(1, "a", pi, -4))
y[1]
y[4]
y[5]## not listed

## accessing values in list or vector
y[1:2]
y[c(1,2)]

## : is quick, but best used to count by 1
1:2
## very flexible, but entries must be explicitly listed
c(1,2)
## seq is most explict
seq(from = 1, to = 2, by = 1)
## seq is also flexible in terms of how to space entries
seq(from = 1, to = 2, by = 0.1)
## seq can be used to count down
seq(from = 10, to = -1, by = -1)

(odds <- seq(from = 1, to = 9, by = 2))

### what can we do with this?
x <- seq(0, 1, length = 100)
x[1]
x[99]
x[100]

## generate values of a variable by applying formula
y <- 3*x + 7
y[1]
y[100]

plot(x, y)
plot(y ~ x)

pdf("scatter.pdf", height = 5, width = 5, bg = "white")
plot(y ~ x)
dev.off()

plot(function(x)sin(pi/x + pi/2), xlim = c(-10, 10))

## explicitly calculating points is one way to 'smooth' graphs
f <- function(x)sin(pi/x + pi/2)
x <- seq(-10, 10, by = 0.01)
length(x)

y <- f(x) ## other ways to evaluate
plot(x, y, type = 'l')

## another way to evaluate functions
y <- sapply(x, f)
## this is a useful tool - sapply() 
## applies the function to the first argument

mean(x)
## here it calculates the mean of each number, 
## which is that number itself!
sapply(x, mean)
?sapply

2 + 3
2/3
2*3
2**3 ## equivalent to caret for exponent
2^3
2 %% 3

5 %% 2 ## remainder
?'%%' ## quotes to search the command name in this case
5 %/% 2 ## number of even divisions into 5 by 2

(a <- 9/7)
round(a, 2)
round(a, 0)

ceiling(a)
floor(a)
trunc(a) ## rounds towards zero

(b <- -9/7)
round(b, 2)
round(b, 0)
ceiling(b)
floor(b)
trunc(b)

round(0.5)
## ?round ## be warned
round(1.5)

(x <- 10:20)
x %% 2
x[x %% 2 == 0]
## odds
x[x %% 2 != 0]
x[x %% 2 == 1]
## yet another way
which(x %% 2 == 0)
which(x == 15)
x[6]

x0 <- 1
x1 <- 1
(x2 <- x0 + x1)
(x3 <- x1 + x2)
(x4 <- x2 + x3)

## write a 'program' to calculate a few fibonacci numbers

xoldest <- 1
xold <- 1
xs <- c(xoldest, xold) ## initialize
for(i in 1:50){
  xnew <- xoldest + xold
  xs <- c(xs, xnew)
  xoldest <- xold
  xold <- xnew
}
xs

fibonacci <- function(n){
  xoldest <- 1
  xold <- 1
  xs <- c(xoldest, xold) ## initialize
  for(i in 1:(n-2)){## change the end of the loop
    xnew <- xoldest + xold
    xs <- c(xs, xnew)
    xoldest <- xold
    xold <- xnew
  }
  return(xs)
}

## gives n = 10 total fibonacci numbers, counting the first 2
fibonacci(10)
sapply(3:10, fibonacci)
