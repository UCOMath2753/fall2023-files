## original script to randomize
## dat <- read.delim("~/Dropbox/uco/fa23/TPMS/R/manager-salary-21.csv", sep=',')
## head(dat)
## dim(dat)
## dat <- dat[, -c(1, 19:24)]
## head(dat)
## names(dat)
## names(dat) <- c("age", "industry", "title", "context", "salary", "benefits", "currency", "currency-other", "income_context", "country", "us_state", "city", "exp_total", "exp_field", "education", "gender", "race")

## dat <- dat[sample(1:nrow(dat), 1000),]

## head(dat)
## table(dat$us_state)
## table(dat$country)

## write.table(dat, "excerpt-salary-21.csv", sep = ",")
setwd("~/Dropbox/uco/fa23/TPMS/R/")
library(stringr)
dat <- read.delim("excerpt-salary-21.csv", sep = ',')
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

head(dat)
salary <- dat$salary
salary <- gsub(",", "", salary)
dat$salary <- as.numeric(salary)
dat$salary

head(dat)
dat$benefits <- as.numeric(dat$benefits)
head(dat)

country <- dat$country
table(country)
country <- gsub("[.]", "", country)
country <- sapply(country, str_trim)

country[country %in% c("THE UNITED STATES", "UNITED SATES", "UNITED STATES OF AMERICA", "UNITED STATEW", "US", "USA")] <- "UNITED STATES"
table(country)

country[country %in% c("ENGLAND", "ENGLAND, UK", "ENGLAND/UK", "UK", "UNITED KINDOM", "UNITED KINGDOM", "UNITED KINGDOM (ENGLAND)", "WALES (UNITED KINGDOM)")] <- "UNITED KINGDOM/UK"
country[country =="THE NETHERLANDS"] <- "NETHERLANDS"
country[country %in% c("FROM NEW ZEALAND BUT ON PROJECTS ACROSS APAC", "", "USD")] <- NA
dat$country <- as.factor(country)

head(dat)
state <- dat$us_state
table(dat$us_state)
state[grepl(",",state)] <- 'ZZ_Multiple'
state[state==""]<- NA
dat$us_state <- as.factor(state)
table(dat$us_state)

head(dat)
(nms <- names(table(dat$currency)))
dat[dat$currency=="", "currency"] <- NA
dat[dat$currency==nms[3],]
dat <- dat[-200, ]
dat$currency <- as.factor(dat$currency)
head(dat)

table(dat$age)
dat[dat$age =="", "age"] <- NA
nms <- names(table(dat$age))
dat$age <- ordered(dat$age, levels = c(nms[c(7, 1:6)]))
summary(dat)

table(dat$industry)
dat$industry <- gsub("&", "and", dat$industry)

dat$industry <- tolower(dat$industry)
dat$industry <- sapply(dat$industry, str_trim)
dat$industry <- as.factor(dat$industry)

## too many to be useful
table(dat$title)
dat$title <- gsub("[.]", "", dat$title)
dat$title <- toupper(dat$title)
dat$title <- sapply(dat$title, str_trim)
dat$title <- as.factor(dat$title)
summary(dat)

table(dat$currency.other)

dat[dat$currency.other %in% c("", "None"), "currency"] <- NA
dat$currency.other <- as.factor(dat$currency.other)
summary(dat)

## quite complicated to be useful
table(dat$city)
dat$city <- toupper(dat$city)
dat$city <- sapply(dat$city, str_trim)
dat$city <- gsub("[.]", "", dat$city)
dat$city <- as.factor(dat$city)

table(dat$exp_total)
(nms <- names(table(dat$exp_total)))
dat[dat$exp_total == "", "exp_total"] <- NA
dat$exp_total <- factor(dat$exp_total, levels = nms[c(2, 4, 8, 9, 3, 5, 6, 7)])
summary(dat)

table(dat$exp_field)
(nms <- names(table(dat$exp_field)))
dat$exp_field <- factor(dat$exp_field, levels = nms[c(1, 3, 7, 8, 2, 4, 5, 6)])
summary(dat)

table(dat$education)
dat[dat$education == "", "education"] <- NA
(nms <- names(table(dat$education)))
dat$education <- factor(dat$education, levels = nms[c(2, 6, 1, 3, 5, 4)])
summary(dat)

table(dat$gender)
dat[dat$gender == "Other or prefer not to answer" & !is.na(dat$gender), "gender"] <- "Not reported"
dat$gender <- factor(dat$gender)
summary(dat)

table(dat$race)
dat$race <- factor(dat$race)

head(dat)
summary(dat)

write.table(dat, "clean-salary-21.csv", sep=',', row.names = F, col.names = T)

plot(benefits ~ salary, dat)