setwd("~/Dropbox/uco/fa23/TPMS/r")
dat <- read.delim("clean-salary-21.csv", sep = ',')
head(dat)
names(dat)
## counts up the freq of each category
tab <- table(dat$age)
## lwd makes thicker lines
plot(tab, lwd = 2)
## relabel axes
plot(tab, lwd = 2, xlab = "Age group", ylab = "Frequency")
## fix vertical axis
plot(tab, lwd = 2, xlab = "Age group", ylab = "Frequency", las = 1, ylim = c(0, 500))
## what does c() do?
ylims <- c(0, 500)
## ()'s around assignment, assigns THEN prints
(unk <- c(0, "cat", 500, "chicken"))

plot(tab, lwd = 2, xlab = "Age group", ylab = "Frequency", las = 1, ylim = c(0, 500), main = "Workforce Distribition")
## or
plot(tab, lwd = 2, xlab = "Age group", ylab = "Frequency", las = 1, ylim = c(0, 500))
## for mtext, side = 3 is 'top'
## cex is "character expansion factor"
## font = 2 gives bold
## line counts into the margin
mtext("Workforce Distribution", side = 3, cex = 1.5, font = 2, line = 1)
## adds a box frame, if necessary
box()
## adds gridlines
grid()

names(dat)
(tab2 <- table(dat[ , c("age", "education")]))
## ages and education levels could (easily) be more sensibly ordered

head(dat)
## similar to "Excel pivot table"
(tab3 <- table(dat[ , c("exp_total", "exp_field")]))

head(dat)
## margins c(bot, left, top, right) in "lines"
par(mar = c(4.1, 5.1, 0.8, 0.8), bg = "white")
## par options apply while graph window remains open
## useful
plot(benefits ~ salary, dat)
## useful
plot(dat[, c("salary", "benefits")])
## not so nice
plot(dat$salary, dat$benefits)

## colors and symbols
head(dat)
table(dat$gender)
## ~ means "as a function of"
## axes are ugly, that's a later problem
plot(benefits ~ salary, dat, subset = gender == "Man", pch = 19, cex = 0.5, col = "gray")
points(benefits ~ salary, dat, subset = gender == "Woman", pch = 19, cex = 0.5, col = "black")
points(benefits ~ salary, dat, subset = gender == "Non-binary", pch = 19, cex = 0.5, col = "blue")
legend("topleft", c("Man", "Woman", "Non-binary"), pch = 19, col = c("gray", "black", "blue"))

plot(1:25, xlim = c(0, 25), ylim = c(0, 25), las = 1)
plot(1:25, pch = 1:25, xlim = c(0, 25), ylim = c(0, 25), las = 1)
plot(1:25, pch = 1:25, col = 1:25, xlim = c(0, 25), ylim = c(0, 25), las = 1)
## 21:25 accept bg and fg colors

plot(function(x)x^2, xlim = c(-4,4), lwd = 2, las = 1)
## points(c(2, 2), c(4, 6), pch = 19)
points(c(2, 2), c(4, 6), pch = 21, bg = c("white", "black"), col = "black", cex = 1.3, lwd =2)