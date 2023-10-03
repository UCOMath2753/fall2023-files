## download and rename .csv from link in D2L
## use the commands below to find it
## setwd("~/Dropbox/uco/fa23/TPMS/r/")
## use setwd(...) or file menu
getwd()
setwd("~/Dropbox/uco/fa23/TPMS/r")

dir()

## 'dat' is my shortcut for 'data', but data() is a built-in command
## <- is the 'assignment operator'
## works the same as = but 'preferred' in this context
## sep is the 'separation character', here a comma
dat <- read.delim("excerpt-salary-21.csv", sep = ',')

## shows first 6 rows
head(dat)
## shows last 6 rows
tail(dat)
## prints variable names
names(dat)
## shows dimensions
dim(dat)
## chop some empty columns
## blank before the comma means 'all rows'
dat <- dat[ , 1:17]
dim(dat)

## data-wrangling
## tabulate entries in the 'country' column of 'dat'
table(dat$country)
## bad row
dat[70, ]
## exclude row 70
dat <- dat[-70, ]
dim(dat)
table(dat$country)

dat$country <- toupper(dat$country)
table(dat$country)

dat[dat$country == "UNITED STATEES", "country"] <- "UNITED STATES"
dat[dat$country == "UNITEED STATES", "country"] <- "UNITED STATES"
dat[dat$country == "UNITES STATES", "country"] <- "UNITED STATES"
table(dat$country)

## %in% is used to search for variable values that occur in the provided list
dat[dat$country %in% c("US", "US ", "U.S.A", "U.S.A."), "country"] <- "UNITED STATES"
table(dat$country)
## unfortunately not helpful
summary(dat)
head(dat)
## More work here because we have a mix of numbers (and number formats) and text
table(dat$benefits)
table(dat$salary)

## switch gears to something else
plot(sin) ## plots sin(x), on [0, 1]
## axes are external not internal
## axes are [-pi, pi], but really print [-3, 3]
plot(function(x)sin(x), xlim = c(-pi, pi))
## rotate vertical axis (las = 1, 2, 3)
plot(function(x)sin(x), xlim = c(-pi, pi), las = 1)
## add nicer vertical axis label
plot(function(x)sin(x), xlim = c(-pi, pi), las = 1, ylab = "y = sin(x)")
## better add the horizontal label to match
plot(function(x)sin(x), xlim = c(-pi, pi), las = 1, xlab = "x", ylab = "y = sin(x)")
## let's make it purple
plot(function(x)sin(x), xlim = c(-pi, pi), las = 1, xlab = "x", ylab = "y = sin(x)", col = "purple")
## but how many purples are there?
colors()

